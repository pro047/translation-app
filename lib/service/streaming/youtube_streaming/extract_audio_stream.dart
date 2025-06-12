import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

void main() async {
  final youtubeUrl = 'https://www.youtube.com/watch?v=BBrr5iM_dik';
  final websocketUrl = 'ws://127.0.0.1:5001';
  final outputPcmPath = 'output.pcm';

  try {
    await streamLiveYoutubeAudio(youtubeUrl, websocketUrl);
  } catch (err) {
    print('Error : $err');
  }
}

Future<Map<String, dynamic>> getVodStreamInfo(String youtubeUrl) async {
  try {
    final result = await Process.run('yt-dlp', [
      '--cookies',
      'cookies.txt',
      '-f',
      'bestaudio[ext=m4a]/bestaudio/best',
      '--print-json',
      '--no-part',
      '--no-mtime',
      '--no-cache-dir',
      youtubeUrl,
    ], runInShell: true);

    print('result: $result');

    if (result.exitCode != 0) {
      throw Exception('yt-dlp failed: ${result.stderr}');
    }

    final jsonMap = jsonDecode(result.stdout as String) as Map<String, dynamic>;
    return {'url': jsonMap['url'], 'headers': jsonMap['http_headers'] ?? {}};
  } catch (err) {
    print('getStreaminfo error : $err');
    throw Exception('getStreaminfo error');
  }
}

Future<Map<String, dynamic>> getLiveStreamInfo(String youtubeUrl) async {
  try {
    final result = await Process.run('yt-dlp', [
      '--cookies',
      'cookies.txt',
      '-f',
      'bestaudio',
      '-o',
      '-',
      '--print-json',
      '--no-part',
      '--no-mtime',
      '--no-cache-dir',
      youtubeUrl,
    ], runInShell: true);

    print('result: $result');

    if (result.exitCode != 0) {
      throw Exception('yt-dlp failed: ${result.stderr}');
    }

    final jsonMap = jsonDecode(result.stdout as String) as Map<String, dynamic>;
    return {'url': jsonMap['url'], 'headers': jsonMap['http_headers'] ?? {}};
  } catch (err) {
    print('getStreaminfo error : $err');
    throw Exception('getStreaminfo error');
  }
}

Future<void> extractPcmFile(
  String streamUrl,
  Map<String, dynamic> headers,
  String outputPath,
) async {
  final headerList = <String>[];
  headers.forEach((key, value) {
    headerList.add('-headers');
    headerList.add('$key: $value');
  });

  final args = [
    '-protocol_whitelist',
    'file,http,https,tcp,tls',
    ...headerList,
    '-i',
    streamUrl,
    '-f',
    's16le',
    '-acodec',
    'pcm_s16le',
    '-ar',
    '16000',
    '-ac',
    '1',
    '-af',
    'aresample=resampler=soxr',
    outputPath,
  ];

  final process = await Process.start('ffmpeg', args, runInShell: true);

  process.stderr.transform(utf8.decoder).listen((line) {
    print('FFmpeg stderr: $line');
  });

  final exitCode = await process.exitCode;
  print('FFmpeg exited with code $exitCode');
}

Future<void> streamLiveYoutubeAudio(
  String youtubeUrl,
  String websocketUrl,
) async {
  // final formatId = await getAudioFormatId(youtubeUrl);

  // if (formatId != null) {
  final result = await Process.run('yt-dlp', [
    '--cookies',
    'cookies.txt',
    '-f',
    'best',
    '-g',
    youtubeUrl,
  ], runInShell: true);
  print('result : ${result.runtimeType}');

  if (result.exitCode != 0) {
    throw Exception('yt-dlp failed: ${result.stderr}');
  }

  final streamURl = (result.stdout as String).trim();
  print('streamUrl : $streamURl');

  final channel = IOWebSocketChannel.connect(websocketUrl);
  print('WebSocket connected to $websocketUrl');

  final ffmpegProcess = await Process.start('ffmpeg', [
    '-loglevel',
    'verbose',
    '-i',
    streamURl,
    '-vn',
    '-fflags',
    'nobuffer',
    '-flags',
    'low_delay',
    '-strict',
    '-2',
    '-f',
    's16le',
    '-acodec',
    'pcm_s16le',
    '-ar',
    '16000',
    '-ac',
    '1',
    '-rtbufsize',
    '512k',
    '-',
  ], runInShell: true);

  print('ffmpegProcess : ${ffmpegProcess.stdout}');

  ffmpegProcess.stdout.listen(
    (List<int> data) {
      print('data : $data');
      channel.sink.add(Uint8List.fromList(data));
      print('Sent ${data.length} bytes to WebSocket');
    },
    onDone: () async {
      print('FFmpeg stream ended');
      await channel.sink.close();
    },
    onError: (err) async {
      print('FFmpeg stream error: $err');
      await channel.sink.close();
    },
    cancelOnError: true,
  );

  ffmpegProcess.stderr.transform(utf8.decoder).listen((line) {
    print('FFmpeg stderr: $line');
  });

  final exitCode = await ffmpegProcess.exitCode;
  print('FFmpeg exited with code $exitCode');
}

Future<void> streamPcmFile(String pcmFilePath, String websocketUrl) async {
  RandomAccessFile? raf;
  IOWebSocketChannel? channel;

  try {
    channel = IOWebSocketChannel.connect(websocketUrl, protocols: ['binary']);

    print('Raw WebSocket connected');

    final file = File(pcmFilePath);
    final chunkSize = 1280;

    raf = await file.open();

    print('WebSocket connected to $websocketUrl');

    while (true) {
      final chunk = await raf.read(chunkSize);
      if (chunk.isEmpty) break;

      final buffer = Uint8List.fromList(chunk);
      if (buffer.lengthInBytes != chunkSize) {
        print('Warning: Incomplete chunk read');
      }

      channel.sink.add(buffer);
      print('Sent ${chunk.length} bytes to WebSocket');

      await Future.delayed(Duration(milliseconds: 20));
    }
  } catch (err) {
    print('WebSocket connection failed : $err');
  } finally {
    if (raf != null) {
      await raf.close();
      print('File stream done, closing Websocket');
    }
    if (channel != null) {
      await channel.sink.close(status.goingAway);
      print('WebSocket closed');
    }
  }
}

Future<String?> getAudioFormatId(String youtubeUrl) async {
  final result = await Process.run('yt-dlp', [
    '-F',
    youtubeUrl,
  ], runInShell: true);

  if (result.exitCode != 0) {
    print('yt-dlp -F failed: ${result.stderr}');
    return null;
  }

  final output = result.stdout as String;
  final lines = output.split('\n');

  final audioLine = lines
      .where(
        (line) =>
            line.contains('audio only') &&
            (line.contains('m4a') || line.contains('webm')),
      )
      .toList();

  if (audioLine.isEmpty) {
    print('No audio-only stream found.');
    return null;
  }

  final match = RegExp(r'^(\d+)').firstMatch(audioLine.first);
  if (match == null) {
    print('Failed to parse format Id.');
    return null;
  }

  final formatId = match.group(1);
  print('Selected audio-only format Id: $formatId');
  return formatId;
}
