import 'dart:async';

import 'package:trans_app/interfaces/word_emitter.dart';
import 'package:trans_app/service/web_socket/mic_websocket.dart';

class WebSocketWordEmitter implements WordEmitter {
  bool _isListening = false;
  late void Function(String word) _onWord;
  late StreamSubscription<String> _subscription;

  @override
  void start(
    void Function(String word) onWord, {
    void Function(String status)? onStatus,
    void Function(String error)? onError,
    void Function(double level)? onSoundLevel,
    String localeId = 'ko_KR',
  }) {
    WebSocketService().init();

    _onWord = onWord;
    _isListening = true;

    _subscription = WebSocketService().finalTranscriptStream.listen((
      transcript,
    ) {
      if (_isListening) {
        transcript.split(' ').forEach((word) {
          _onWord(word);
        });
      }
    });

    print('WebSocketWordEmitter started');
  }

  @override
  void stop() {
    _isListening = false;
    _subscription.cancel();
    WebSocketService().dispose();
    print('WebSocketWordEmitter stoppped');
  }
}
