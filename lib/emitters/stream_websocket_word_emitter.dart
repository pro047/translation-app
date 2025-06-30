import 'dart:async';

import 'package:trans_app/data/dto/transcript_data.dart';
import 'package:trans_app/interfaces/youtube_word_emitter.dart';
import 'package:trans_app/service/web_socket/youtube_websocket/streaming_websocket.dart';

class StreamWebsocketWordEmitter implements YoutubeWordEmitter {
  void Function(TranscriptData data)? _onWord;
  StreamSubscription<TranscriptData>? _subscription;
  StreamingWebsocket? _websocket;

  bool _isListening = false;

  @override
  void start(
    void Function(TranscriptData data)? onWord, {
    void Function(String status)? onStatus,
    void Function(String error)? onError,
    required String websocketUrl,
    String localeId = 'ko_KR',
  }) async {
    await stop();

    _websocket = StreamingWebsocket();
    await _websocket!.startListening(websocketUrl);

    _onWord = onWord;
    _isListening = true;

    _subscription = _websocket!.finalTranscriptStream.listen((data) {
      if (_isListening) {
        _onWord?.call(
          TranscriptData(transcript: data.transcript, isFinal: data.isFinal),
        );
      }
    });

    print('StreamWordEmitter started');
  }

  @override
  Future<void> stop() async {
    _isListening = false;
    await _subscription?.cancel();
    await _websocket?.dispose();
    _websocket = null;
    print('StreamWebSocketWordEmitter stopped');
  }
}
