import 'package:trans_app/data/dto/transcript_data.dart';

abstract class YoutubeWordEmitter {
  void start(
    void Function(TranscriptData data)? onWord, {
    void Function(String status)? onStatus,
    void Function(String error)? onError,
    required String websocketUrl,
    String localeId,
  });
  Future<void> stop();
}
