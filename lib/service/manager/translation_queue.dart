import 'dart:collection';

import 'package:trans_app/interfaces/sentence_translator.dart';
import 'package:trans_app/service/api/firebase_service.dart';
import 'package:trans_app/service/api/translation_service.dart';

class TranslationQueue implements SentenceTranslator {
  final void Function(String message)? onLog;
  final Queue<String> _queue = Queue();
  final Set<String> _existingSentences = {};
  final int _maxQueueLength = 1;
  final String targetLang;
  final String sourceLang;
  final Stopwatch _stopwatch = Stopwatch();

  bool _isTranslating = false;

  TranslationQueue({
    this.onLog,
    required this.sourceLang,
    required this.targetLang,
  });

  @override
  void add(String sentence) {
    if (_existingSentences.contains(sentence)) {
      print('😂 중복 문장으로 번역 건너뜀');
      return;
    }

    if (_existingSentences.add(sentence)) {
      _queue.add(sentence);
      // print('😀 큐에 추가 : $sentence');
    }

    if (!_isTranslating) {
      _startTranslate();
    }
  }

  void _startTranslate() async {
    if (_isTranslating || _queue.isEmpty) return;

    _isTranslating = true;

    if (_queue.length >= _maxQueueLength) {
      final sentence = _queue.removeFirst();

      try {
        // print('🚎 [번역 시작] : $sentence');

        _stopwatch.reset();
        _stopwatch.start();

        final translated = await TranslationService.translate(sentence);
        _stopwatch.stop();

        if (translated?.isNotEmpty == true) {
          await FirebaseService.pushTranslatedSentence(translated!);
          print(
            '✅ [번역 결과] : $translated\n 처리 시간: ${_stopwatch.elapsedMilliseconds}ms',
          );
          print('🚓 [번역 완료] : $sentence => $translated');
        } else {
          print('🚑 [번역 실패] translated == null || emtpy');
          print('🚒 [번역 실패] : $sentence');
        }
      } catch (err, stack) {
        print('🚐 번역 실패 : $err');
        print('🛻 $stack');
      } finally {
        _existingSentences.remove(sentence);
        _isTranslating = false;
        _startTranslate();
      }
    }
  }
}
