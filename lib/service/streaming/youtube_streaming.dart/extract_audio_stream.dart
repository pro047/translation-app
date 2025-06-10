import 'dart:io';

import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_new/return_code.dart';
import 'package:path_provider/path_provider.dart';

Future<String> extractAudioStream(String hlsUrl) async {
  final String pcmOutputPath = await getOutputPath();

  final String ffmpegcommand =
      '-loglevel verbose -i "$hlsUrl" -f s16le -acodec pcm_s16le -ar 16000 -ac 1 -t 10 "$pcmOutputPath"';

  print('Executing FFmpeg command:\n$ffmpegcommand');

  FFmpegKit.executeAsync(ffmpegcommand, (session) async {
    final returnCode = await session.getReturnCode();
    final logs = await session.getAllLogs();

    for (var log in logs) {
      print('FFmpeg log: ${log.getMessage()}');
    }

    if (ReturnCode.isSuccess(returnCode)) {
      print('Audio stream extraction success!');
      print('PCM saved at: $pcmOutputPath');

      final file = File(pcmOutputPath);
      if (await file.exists()) {
        print('PCM file size: ${await file.length()} bytes');
      } else {
        print('PCM file does not exist');
      }
    } else {
      print('Audio stream extraction failed. Return code: $returnCode');
    }
  });
  return pcmOutputPath;
}

Future<String> getOutputPath() async {
  final dir = await getApplicationDocumentsDirectory();
  final timestamp = DateTime.now().millisecondsSinceEpoch;
  return '${dir.path}/output_$timestamp.pcm';
}
