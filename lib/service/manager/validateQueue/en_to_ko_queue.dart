import 'dart:collection';

import 'package:trans_app/interfaces/sentence_receiver.dart';
import 'package:trans_app/interfaces/sentence_translator.dart';
import 'package:trans_app/utils/EnToKo/addreviations_list.dart';
import 'package:trans_app/utils/EnToKo/conjunction_list.dart';

class EnToKoValidateQueue implements SentenceReceiver {
  final Queue<String> _sentenceBuffer = Queue();
  final SentenceTranslator translator;
  final void Function(String message)? onLog;

  String? _lastSentence;
  DateTime? _lastSpoken;
  DateTime? _listeningStart;

  EnToKoValidateQueue({required this.translator, this.onLog});

  @override
  void receive(String word, {required bool isFinal}) {
    final now = DateTime.now();
    final sentence = word.trim();

    onLog?.call('EnToKo receive');

    _lastSpoken ??= now;
    _listeningStart ??= now;

    if (_isEmpty(sentence)) return;
    if (_isDuplicate(sentence)) return;

    final firstWord = sentence.split(' ').first;
    onLog?.call('firstword : $firstWord');

    if (_isLikelySentenceComplete(sentence, firstWord)) {
      _sentenceBuffer.add(sentence);
      _listeningStart = now;
      _lastSpoken = now;
    } else {
      onLog?.call('isLikelySentenceComplete fail');
    }

    if (_sentenceBuffer.length >= 5) {
      _send();
    }
  }

  bool _isEmpty(String sentence) => sentence.isEmpty;

  bool _isDuplicate(String sentence) {
    if (_lastSentence != null && sentence == _lastSentence) {
      return true;
    }
    _lastSentence = sentence;
    return false;
  }

  bool _isLikelySentenceComplete(String sentence, String? firstWord) {
    final trimmed = sentence.trim();
    onLog?.call('trimmed : $trimmed');

    if (abbreviations.any((abbr) => trimmed.endsWith(abbr))) {
      onLog?.call('abbr fail');
      return false;
    }

    if (RegExp(r'[.!?]$').hasMatch(trimmed)) {
      onLog?.call('RegExp rail');
      return true;
    }

    if (firstWord != null && startWithSubordinatingConjunction(firstWord)) {
      onLog?.call('startWithSub fail');
      return false;
    }

    if (firstWord != null && startWithConjunction(firstWord)) {
      onLog?.call('startWithConjunc fail');
      return true;
    }

    return false;
  }

  void _send() {
    onLog?.call('send success');
    for (final sentence in _sentenceBuffer) {
      translator.add(sentence);
    }
    _sentenceBuffer.clear();
  }
}
