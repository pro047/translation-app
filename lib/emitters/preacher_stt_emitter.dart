import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:trans_app/interfaces/word_emitter.dart';
import 'package:trans_app/service/foreground/foreground.dart';

class PreacherSttEmitter implements WordEmitter {
  final stt.SpeechToText _speech = stt.SpeechToText();
  String _lastRecognized = '';
  bool _shouldStop = false;
  void Function(double level)? onSoundLevel;

  @override
  void start(
    void Function(String word) onWord, {
    void Function(String status)? onStatus,
    void Function(String error)? onError,
    void Function(double level)? onSoundLevel,
    String localeId = 'ko_KR',
  }) async {
    this.onSoundLevel = onSoundLevel;
    _shouldStop = false;

    bool available = await _speech.initialize(
      onStatus: (status) async {
        if (onStatus != null) onStatus(status);
        if (_shouldStop) return;
        if ((status == 'done' || status == 'notListening') &&
            !_speech.isListening) {
          await Future.delayed(Duration(milliseconds: 300));
          _startListening(
            onWord,
            onStatus: onStatus,
            onError: onError,
            localeId: localeId,
          );
        }
      },
      onError: (error) async {
        onError?.call(error.errorMsg);
        await _speech.cancel();
        await Future.delayed(Duration(milliseconds: 300));
        _startListening(
          onWord,
          onStatus: onStatus,
          onError: onError,
          localeId: localeId,
        );
      },
    );

    if (!available) {
      onError?.call("Failed initialized STT");
      return;
    }
    _lastRecognized = '';
    _startListening(
      onWord,
      onStatus: onStatus,
      onError: onError,
      localeId: localeId,
    );
  }

  @override
  void stop() {
    _shouldStop = true;
    _speech.cancel();
    _speech.stop();
    FlutterForegroundTask.stopService();
  }

  void _startListening(
    void Function(String word) onWord, {
    required String localeId,
    void Function(String status)? onStatus,
    void Function(String error)? onError,
  }) {
    startForegroundService();
    if (_speech.isListening || _shouldStop) {
      return;
    }

    _speech.listen(
      pauseFor: Duration(seconds: 5),
      listenFor: Duration(minutes: 5),
      onResult: (result) {
        final text = result.recognizedWords.trim();
        if (result.finalResult && text.isNotEmpty) {
          final diff =
              (_lastRecognized.isNotEmpty && text.startsWith(_lastRecognized))
              ? text.substring(_lastRecognized.length).trim()
              : text;
          if (diff.isNotEmpty) {
            onWord(diff);
          }
          _lastRecognized = text;
        }
      },
      onSoundLevelChange: (level) {
        onSoundLevel?.call(level);
      },
      localeId: localeId,
      listenOptions: stt.SpeechListenOptions(
        partialResults: true,
        cancelOnError: false,
        listenMode: stt.ListenMode.dictation,
        autoPunctuation: true,
      ),
    );
  }
}
