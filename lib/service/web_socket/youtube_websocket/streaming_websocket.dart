import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:web_socket_channel/io.dart';

class StreamingWebsocket {
  static final StreamingWebsocket _instance = StreamingWebsocket._internal();

  factory StreamingWebsocket() {
    return _instance;
  }

  StreamingWebsocket._internal() {
    _finalTranscriptController = StreamController<String>.broadcast(
      onCancel: () {
        _isClosed = true;
      },
    );
  }

  bool _isInitialized = false;
  bool _isClosed = false;

  late IOWebSocketChannel _channel;
  late Process _ffmpegProcess;
  late StreamController<String> _finalTranscriptController;

  final ytDlpPath = '/opt/homebrew/bin/yt-dlp';

  Stream<String> get finalTranscriptStream => _finalTranscriptController.stream;

  Future<void> startListening(String websocketUrl) async {
    if (_isInitialized) {
      print('Already initialized');
      return;
    }

    try {
      await _connectWebsocket(websocketUrl);
      _listenWebsocket();
      _isInitialized = true;
    } catch (err) {
      print('Error in streamLiveYoutubeAudio: $err');
      await dispose();
    }
  }

  Future<void> _connectWebsocket(String websocketUrl) async {
    _channel = IOWebSocketChannel.connect(websocketUrl);
  }

  void _listenWebsocket() {
    _channel.stream.listen(
      (message) {
        if (_isClosed) {
          print('😡 Stream is closed, dropping message');
          return;
        }
        final data = jsonDecode(message);
        final transcript = data['transcript'];
        _finalTranscriptController.add(transcript);

        print('received from server : $message');
      },
      onDone: () {
        print('websocket closed');
      },
      onError: (err) {
        print('websocket error: $err');
      },
    );
  }

  Future<void> dispose() async {
    // if (!_isInitialized) return;
    _isClosed = true;
    _isInitialized = false;
    await _finalTranscriptController.close();
    await _channel.sink.close();
    _ffmpegProcess.kill(ProcessSignal.sigint);
  }
}
