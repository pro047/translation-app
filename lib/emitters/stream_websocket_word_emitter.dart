import 'dart:async';

import 'package:trans_app/interfaces/youtube_word_emitter.dart';
import 'package:trans_app/service/web_socket/youtube_websocket/streaming_websocket.dart';

class StreamWebsocketWordEmitter implements YoutubeWordEmitter {
  late void Function(String word) _onWord;
  late StreamSubscription<String> _subscription;
  final StreamingWebsocket _websocket = StreamingWebsocket();

  bool _isListening = false;

  @override
  void start(
    void Function(String word) onWord, {
    void Function(String status)? onStatus,
    void Function(String error)? onError,
    required String websocketUrl,
    String localeId = 'ko_KR',
  }) async {
    await _websocket.startListening(websocketUrl);

    _onWord = onWord;
    _isListening = true;

    _subscription = _websocket.finalTranscriptStream.listen((transcript) {
      if (_isListening) {
        transcript.split(' ').forEach(_onWord);
      }
    });

    print('StreamWordEmitter started');
  }

  @override
  Future<void> stop() async {
    _isListening = false;
    await _subscription.cancel();
    await _websocket.dispose();
    print('StreamWebSocketWordEmitter stopped');
  }
}
