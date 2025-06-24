import 'dart:async';

import 'package:trans_app/data/dto/transcript_data.dart';
import 'package:trans_app/interfaces/word_emitter.dart';
import 'package:trans_app/service/web_socket/mic_websocket.dart';

class WebSocketWordEmitter implements WordEmitter {
  bool _isListening = false;
  void Function(TranscriptData data)? _onWord;
  StreamSubscription<TranscriptData>? _subscription;

  @override
  void start(
    void Function(TranscriptData data) onWord, {
    void Function(String status)? onStatus,
    void Function(String error)? onError,
    void Function(double level)? onSoundLevel,
    String localeId = 'ko_KR',
  }) {
    WebSocketService().init();

    _onWord = onWord;
    _isListening = true;

    _subscription = WebSocketService().finalTranscriptStream.listen((data) {
      if (_isListening) {
        final words = data.transcript.split(' ');
        for (final word in words) {
          _onWord?.call(
            TranscriptData(transcript: word, isFinal: data.isFinal),
          );
        }
      }
    });

    print('WebSocketWordEmitter started');
  }

  @override
  void stop() {
    _isListening = false;
    _subscription?.cancel();
    WebSocketService().dispose();
    print('WebSocketWordEmitter stoppped');
  }
}
