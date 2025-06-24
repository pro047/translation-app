import 'dart:collection';

import 'package:trans_app/interfaces/sentence_receiver.dart';
import 'package:trans_app/interfaces/sentence_translator.dart';
import 'package:trans_app/utils/KoToEn/sentence_accumulator.dart';

class KoToEnValidateQueue implements SentenceReceiver {
  final SentenceTranslator translator;
  final SentenceAccumulator accumulator;
  final int maxQueueLength;
  final void Function(String message)? onLog;

  final Queue<String> _validQueue = Queue();
  final int threshold = 3;

  KoToEnValidateQueue({
    required this.accumulator,
    required this.translator,
    this.onLog,
    this.maxQueueLength = 1,
  });

  @override
  Future<void> receive(String word, {required bool isFinal}) async {
    // print('🍐 receive success');
    final now = DateTime.now();
    accumulator.updateTranscript(word, now);
    // print('received : $sentence');

    final sentence = accumulator.takeIfComplete();
    if (sentence != null) {
      _addToQueue(sentence);
    }
  }

  void _addToQueue(String sentence) {
    _validQueue.add(sentence);
    // print('🍆 valid queue state : $_validQueue');

    _send(sentence);
    // print('🥬 send sentence to transQueue: $sentence');
  }

  void _send(String sentence) {
    if (_validQueue.length >= maxQueueLength) {
      translator.add(sentence);
      // print('🚌 send success: $sentence');

      _validQueue.clear();
    }
  }
}
