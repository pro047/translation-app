import 'package:trans_app/interfaces/word_emitter.dart';
import 'package:trans_app/service/streaming/youtube_streaming.dart/file_streaming_stt.dart';

class FileStreamingSttEmitter implements WordEmitter {
  final FileStreamingStt _sttClient = FileStreamingStt();
  String pcmFilePath;

  FileStreamingSttEmitter(this.pcmFilePath);

  @override
  void start(
    void Function(String word) onWord, {
    void Function(String status)? onStatus,
    void Function(String error)? onError,
    void Function(double level)? onSoundLevel,
  }) async {
    await _sttClient.streamRecognizeFromPcmFile(
      pcmFilePath: pcmFilePath,
      onTextRecognized: (recognizedText) {
        onWord(recognizedText);
      },
    );

    await _sttClient.shutdown();
  }

  @override
  void stop() {}
}
