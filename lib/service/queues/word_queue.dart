import 'dart:collection';

import 'package:trans_app/interfaces/sentence_receiver.dart';

class WordQueue {
  final Queue<String> _wordBuffer = Queue();
  DateTime _start = DateTime.now();

  final SentenceReceiver receiver;
  final Duration maxDuration;
  final int maxWords;

  final void Function(String message)? onLog;

  WordQueue({
    this.onLog,
    required this.receiver,
    this.maxDuration = const Duration(seconds: 6),
    required this.maxWords,
  });

  void addWord(String word) {
    onLog?.call('WordState: $word');
    if (word.trim().isEmpty) return;

    _wordBuffer.add(word);
    onLog?.call('WordQueueBuffer: $_wordBuffer');

    final now = DateTime.now();
    final expired = now.difference(_start) > maxDuration;
    final full = _wordBuffer.length >= maxWords;

    if (expired || full) {
      onLog?.call('expired or full => emit');
      _emitChunk();
    }
  }

  void flush() {
    if (_wordBuffer.isNotEmpty) {
      onLog?.call('flush => emit');
      _emitChunk();
    }
  }

  void _emitChunk() {
    onLog?.call('[wordQueue] queue emit');
    receiver.receive(_wordBuffer.toList());
    _wordBuffer.clear();
    _start = DateTime.now();
  }
}
