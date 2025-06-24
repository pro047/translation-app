import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:audio_streamer/audio_streamer.dart';
import 'package:trans_app/data/dto/transcript_data.dart';
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
  bool _isInitialized = false;

  final List<double> _frameBuffer = [];

  final StreamController<TranscriptData> _finalTranscriptController =
      StreamController.broadcast();

  Stream<TranscriptData> get finalTranscriptStream =>
      _finalTranscriptController.stream;

  void init() {
    if (_isInitialized) return;

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

      _frameBuffer.addAll(floatSamples);

      const int frameSize = 320;

      while (_frameBuffer.length >= frameSize) {
        final frame = _frameBuffer.sublist(0, frameSize);
        _frameBuffer.removeRange(0, frameSize);

        Uint8List pcmChunk = floatToPCMInt16(frame);
        _channel.sink.add(pcmChunk);
      }
    });

    _channel.stream.listen(
      (message) {
        final data = jsonDecode(message);
        final transcript = data['transcript'];
        final isFinal = data['isFinal'] ?? false;

        if (isFinal) {
          print('[Final] $transcript');
          _finalTranscriptController.add(transcript);
        }
        print('Received from server : $message');
      },
      onError: (error) {
        print('Websocket error: $error');
      },
      onDone: () {
        print('Websocket closed');
      },
    );

    _isInitialized = true;
  }

  // Future<void> _checkActualSampleRate() async {
  //   final actualRate = await _audioStreamer.actualSampleRate;
  //   print('Actual sample rate from AudioStreamer: $actualRate');
  // }

  void dispose() {
    if (!_isInitialized) return;
    _finalTranscriptController.close();
    _channel.sink.close();
    _frameBuffer.clear();
    _isInitialized = false;
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
