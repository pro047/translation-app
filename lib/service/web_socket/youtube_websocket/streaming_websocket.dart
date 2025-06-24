import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:trans_app/data/dto/transcript_data.dart';
import 'package:web_socket_channel/io.dart';

class StreamingWebsocket {
  late WebSocket _rawSocket;
  late IOWebSocketChannel _channel;

  final _finalTranscriptController =
      StreamController<TranscriptData>.broadcast();

  bool _isClosed = false;
  String? _currentWebsocketUrl;

  Stream<TranscriptData> get finalTranscriptStream =>
      _finalTranscriptController.stream;

  Future<void> startListening(String websocketUrl) async {
    _currentWebsocketUrl = websocketUrl;
    try {
      await _connectWebsocket(websocketUrl);
      _listenWebsocket();
      _isClosed = false;
    } catch (err) {
      print('start error : $err');
    }
  }

  Future<void> _connectWebsocket(String websocketUrl) async {
    _rawSocket = await WebSocket.connect(websocketUrl);
    _channel = IOWebSocketChannel.connect(websocketUrl);
  }

  Future<void> reconnect() async {
    if (_currentWebsocketUrl == null) {
      print('🚙 Cannot reconnect: no websocketUrl saved');
      return;
    }

    print('🚗 Reconnecting websocket $_currentWebsocketUrl');

    await dispose();

    _isClosed = false;

    await _connectWebsocket(_currentWebsocketUrl!);
    _listenWebsocket();
  }

  void _listenWebsocket() {
    _channel.stream.listen(
      (event) async {
        if (_isClosed) {
          print('😡 Stream is closed, dropping event');

          print('🚕 Attempting to reconnect ...');
          await reconnect();
        }
        final json = jsonDecode(event);
        final data = TranscriptData.fromJson(json);

        _finalTranscriptController.add(data);

        print('received from server : $event');
      },
      onDone: () async {
        print('websocket closed');

        try {
          print(
            '💓 closeCode : ${_rawSocket.closeCode}, reason: ${_rawSocket.closeReason}',
          );
        } catch (_) {}

        if (!_isClosed) {
          print('🚕 Attempting to reconnect ...');
          await reconnect();
        }
      },
      onError: (err) async {
        print('websocket error: $err');

        if (!_isClosed) {
          print('🚕 Attempting to reconnect ...');
          await reconnect();
        }
      },
    );
  }

  Future<void> dispose() async {
    _isClosed = true;
    await _finalTranscriptController.close();
    await _channel.sink.close();
  }
}
