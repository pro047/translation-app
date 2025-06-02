import 'dart:collection';

import 'package:trans_app/interfaces/sentence_translator.dart';
import 'package:trans_app/service/api/firebase_service.dart';
import 'package:trans_app/service/api/translation_service.dart';

class TranslationQueue implements SentenceTranslator {
  final void Function(String message)? onLog;
  final String targetLang;
  final String sourceLang;

  final Queue<String> _queue = Queue();
  final Stopwatch _stopwatch = Stopwatch();

  bool _isTranslating = false;

  TranslationQueue({
    this.onLog,
    required this.sourceLang,
    required this.targetLang,
  });

  @override
  void add(String sentence) {
    if (_queue.contains(sentence)) {
      onLog?.call('[중복 문장으로 번역 건너뜀] $sentence');
      return;
    }

    _queue.add(sentence);

    onLog?.call('[큐에 추가] : $sentence');
    onLog?.call('[현재 큐 상태] : $_queue');

    if (!_isTranslating) {
      _startTranslate();
    }
  }

  void _startTranslate() async {
    if (_isTranslating || _queue.isEmpty) return;

    _isTranslating = true;

    final sentence = _queue.removeFirst();

    try {
      onLog?.call('[번역 시작] : $sentence');
      onLog?.call('번역 중입니다...');

      _stopwatch.reset();
      _stopwatch.start();

      final translated = await TranslationService.translate(
        sentence,
        targetLang,
        sourceLang,
      );
      _stopwatch.stop();

      if (translated?.isNotEmpty == true) {
        await FirebaseService.pushTranslatedSentence(translated!);
        onLog?.call(
          '[번역 결과] : $translated\n 처리 시간: ${_stopwatch.elapsedMilliseconds}ms',
        );
        onLog?.call('[번역 완료] : $sentence => $translated');
      } else {
        onLog?.call('[번역 실패] translated == null || emtpy');
        onLog?.call('[번역 실패] : $sentence');
      }
    } catch (err, stack) {
      onLog?.call('번역 실패 : $err');
      onLog?.call('$stack');
    } finally {
      _isTranslating = false;
      _startTranslate();
    }
  }
}
