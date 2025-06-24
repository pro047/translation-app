import 'package:trans_app/data/dto/transcript_data.dart';

abstract class WordEmitter {
  void start(
    void Function(TranscriptData data) onWord, {
    void Function(String status)? onStatus,
    void Function(String error)? onError,
    void Function(double level)? onSoundLevel,
  });
  void stop();
}
