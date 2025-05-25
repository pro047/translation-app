import 'package:trans_app/service/deepl_service.dart';
import 'package:trans_app/service/firebase_service.dart';

class TranslationQueue {
  final List<String> _queue = [];
  bool _isTranslating = false;

  void add(String sentence, Function(String) onUpdate, Function(String) onLog) {
    if (_queue.contains(sentence)) return;
    _queue.add(sentence);
    _startNext(onUpdate, onLog);
  }

  void _startNext(Function(String) onUpdatd, Function(String) onLog) async {
    if (_isTranslating || _queue.isEmpty) return;

    _isTranslating = true;
    final sentence = _queue.removeAt(0);

    try {
      onUpdatd('번역 중입니다...');
      final stopwatch = Stopwatch()..start();
      final translated = await DeeplService.translateKotoEn(sentence);
      await FirebaseService.pushTranslatedSentence(translated);
      stopwatch.stop();

      onUpdatd('$translated\n 처리 시간: ${stopwatch.elapsedMilliseconds}s');
      onLog('번역 완료: $sentence => $translated');
    } catch (err) {
      onLog('번역 실패 : $err');
    } finally {
      _isTranslating = false;
      _startNext(onUpdatd, onLog);
    }
  }
}
