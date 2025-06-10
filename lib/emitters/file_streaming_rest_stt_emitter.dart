import 'package:trans_app/interfaces/word_emitter.dart';
import 'package:trans_app/service/streaming/youtube_streaming.dart/file_streaming_rest_stt.dart';

class FileStreamingRestSttEmitter implements WordEmitter {
  final FileStreamingRestSttClient _sttClient;

  FileStreamingRestSttEmitter(this._sttClient);

  @override
  void start(
    void Function(String word) onWord, {
    void Function(String status)? onStatus,
    void Function(String error)? onError,
    void Function(double level)? onSoundLevel,
  }) {
    _sttClient.startStreaming(onRecognized: onWord);
  }

  @override
  void stop() async {
    await _sttClient.stopStreaming();
  }
}
