import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:trans_app/interfaces/word_emitter.dart';

class PreacherSttEmitter implements WordEmitter {
  final stt.SpeechToText _speech = stt.SpeechToText();
  String _lastRecognized = '';
  void Function(double level)? onSoundLevel;

  @override
  void start(
    void Function(String word) onWord, {
    void Function(String status)? onStatus,
    void Function(String error)? onError,
    void Function(double level)? onSoundLevel,
  }) async {
    this.onSoundLevel = onSoundLevel;

    bool available = await _speech.initialize(
      onStatus: (status) async {
        if (onStatus != null) onStatus(status);
        if ((status == 'done' || status == 'notListening') &&
            !_speech.isListening) {
          await Future.delayed(Duration(milliseconds: 300));
          _startListening(onWord, onStatus: onStatus, onError: onError);
        }
      },
      onError: (error) async {
        onError?.call(error.errorMsg);
        await _speech.cancel();
        await Future.delayed(Duration(milliseconds: 300));
        _startListening(onWord, onStatus: onStatus, onError: onError);
      },
    );

    if (!available) {
      onError?.call("Failed initialized STT");
      return;
    }
    _lastRecognized = '';
    _startListening(onWord, onStatus: onStatus, onError: onError);
  }

  @override
  void stop() {
    _speech.stop();
  }

  void _startListening(
    void Function(String word) onWord, {
    void Function(String status)? onStatus,
    void Function(String error)? onError,
  }) {
    if (_speech.isListening) {
      return;
    }

    _speech.listen(
      pauseFor: Duration(seconds: 10),
      listenFor: Duration(minutes: 5),
      onResult: (result) {
        final text = result.recognizedWords.trim();
        if (result.finalResult && text.isNotEmpty) {
          String diff;
          if (_lastRecognized.isNotEmpty && text.startsWith(_lastRecognized)) {
            diff = text.substring(_lastRecognized.length).trim();
          } else {
            diff = text;
          }
          if (diff.isNotEmpty) {
            onWord(diff);
          }
          _lastRecognized = text;
        }
      },
      onSoundLevelChange: (level) {
        onSoundLevel?.call(level);
      },
      localeId: 'ko_KR',
      listenOptions: stt.SpeechListenOptions(
        partialResults: true,
        cancelOnError: false,
        listenMode: stt.ListenMode.dictation,
        autoPunctuation: true,
      ),
    );
  }
}
