import 'dart:typed_data';

import 'package:audio_streamer/audio_streamer.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  static final WebSocketService _instance = WebSocketService._internal();

  factory WebSocketService() {
    return _instance;
  }

  WebSocketService._internal();

  late WebSocketChannel _channel;
  late AudioStreamer _audioStreamer;
  bool _checkActualSampleRate = false;

  void init() {
    final _channel = WebSocketChannel.connect(
      Uri.parse('ws://172.30.1.90:5001'),
    );

    _audioStreamer = AudioStreamer();
    _audioStreamer.sampleRate = 16000;

    _audioStreamer.audioStream.listen((List<double> floatSamples) async {
      if (!_checkActualSampleRate) {
        final actualRate = await _audioStreamer.actualSampleRate;
        print('Actual sample rate from AudioStreamer : $actualRate');
        _checkActualSampleRate = true;
      }

      Uint8List pcmChunk = floatToPCMInt16(floatSamples);
      _channel.sink.add(pcmChunk);
    });

    _channel.stream.listen(
      (message) {
        print('Received from server : $message');
      },
      onError: (error) {
        print('Websocket error: $error');
      },
      onDone: () {
        print('Websocket closed');
      },
    );
  }

  // Future<void> _checkActualSampleRate() async {
  //   final actualRate = await _audioStreamer.actualSampleRate;
  //   print('Actual sample rate from AudioStreamer: $actualRate');
  // }

  void dispose() {
    _channel.sink.close();
  }
}

Uint8List floatToPCMInt16(List<double> floatSamples) {
  final buffer = Int16List(floatSamples.length);

  for (int i = 0; i < floatSamples.length; i++) {
    double sample = floatSamples[i];

    sample = sample.clamp(-1.0, 1.0);

    buffer[i] = (sample * 32767).toInt();
  }

  final byteData = ByteData(buffer.lengthInBytes);
  for (var i = 0; i < buffer.length; i++) {
    byteData.setInt16(i * 2, buffer[i], Endian.little);
  }
  return Uint8List.view(buffer.buffer);
}
