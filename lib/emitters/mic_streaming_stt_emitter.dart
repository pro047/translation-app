import 'dart:async';
import 'dart:typed_data';

import 'package:audio_streamer/audio_streamer.dart';
import 'package:trans_app/interfaces/word_emitter.dart';
import 'package:trans_app/service/streaming/mic_streaming/mic_streaming_stt.dart';

class MicStreamingSttEmitter implements WordEmitter {
  final MicStreamingSttClient _sttClient;
  final AudioStreamer _audioStreamer = AudioStreamer();

  StreamSubscription<List<double>>? _audioSubscription;

  MicStreamingSttEmitter() : _sttClient = MicStreamingSttClient();

  @override
  void start(
    void Function(String word) onWord, {
    void Function(String status)? onStatus,
    void Function(String error)? onError,
    void Function(double level)? onSoundLevel,
  }) {
    _sttClient.startStreaming(
      onRecognized: (recognizedText) {
        recognizedText.split(' ').forEach((word) {
          onWord(word);
        });
      },
    );

    _audioSubscription = _audioStreamer.audioStream.listen((List<double> data) {
      // print(
      //   '[MicStreamingSttEmitter] audioStream data received: ${data.length}',
      // );
      final Uint8List pcmBytes = convertListDoubleToUint8List(data);

      // print(
      //   '[MicStreamingSttEmitter] Sending audio chunk of size: ${pcmBytes.length}',
      // );
      _sttClient.sendAudioChunk(pcmBytes);
    });

    onStatus?.call('listening');
  }

  @override
  void stop() async {
    await _audioSubscription?.cancel();
    _audioSubscription = null;

    await _sttClient.stopStreaming();
    await _sttClient.shutdown();
  }
}

Uint8List convertListDoubleToUint8List(List<double> input) {
  final buffer = ByteData(input.length * 2);
  for (int i = 0; i < input.length; i++) {
    int intSample = (input[i] * 32767).clamp(-32768, 32767).toInt();
    buffer.setInt16(i * 2, intSample, Endian.little);
  }
  return buffer.buffer.asUint8List();
}
