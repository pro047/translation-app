import 'dart:collection';

import 'package:trans_app/service/api/firebase_service.dart';
import 'package:trans_app/service/api/translation_service.dart';

class TranslationQueue {
  TranslationQueue._();
  static final TranslationQueue instance = TranslationQueue._();

  List<String> get pending => _queue.toList();

  final Queue<String> _queue = Queue();
  final Stopwatch _stopwatch = Stopwatch();

  bool _isTranslating = false;

  void add(String sentence, Function(String) onUpdate, Function(String) onLog) {
    if (_queue.contains(sentence)) {
      onLog('[중복 문장으로 번역 건너뜀] $sentence');
      return;
    }

    _queue.add(sentence);

    onLog('[translation Queue] : $sentence');
    onLog('[translation Queue State] : $_queue');

    onUpdate('번역 큐에 들어옴 : $sentence');

    _startNext(onUpdate, onLog);
  }

  void _startNext(Function(String) onUpdate, Function(String) onLog) async {
    if (_isTranslating || _queue.isEmpty) return;

    _isTranslating = true;

    final sentence = _queue.removeFirst();

    try {
      onLog('[번역 시작] : $sentence');
      onUpdate('번역 중입니다...');

      _stopwatch.reset();
      _stopwatch.start();

      final translated = await TranslationService.translate(sentence);
      _stopwatch.stop();

      if (translated?.isNotEmpty == true) {
        await FirebaseService.pushTranslatedSentence(translated!);
        onUpdate('$translated\n 처리 시간: ${_stopwatch.elapsedMilliseconds}ms');
        onLog('번역 완료: $sentence => $translated');
      } else {
        onLog('[번역 실패] translated == null || emtpy');
        onUpdate('[번역 실패] : $sentence');
      }
    } catch (err) {
      onLog('번역 실패 : $err');
    } finally {
      _isTranslating = false;
      _startNext(onUpdate, onLog);
    }
  }
}
