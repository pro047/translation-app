import 'dart:async';

import 'package:trans_app/data/dto/transcript_data.dart';
import 'package:trans_app/service/queue/word_queue.dart';

class WordQueueManager {
  final WordQueue wordQueue;
  final int bufferSize;
  final _wordController = StreamController<TranscriptData>.broadcast();
  final Set<TranscriptData> _sentWords = {};

  Stream<TranscriptData> get onWord => _wordController.stream;

  WordQueueManager(this.wordQueue, {this.bufferSize = 5}) {
    wordQueue.onAdd.listen((_) => process());
    print('wordQueueManager : onAdd.listen regist');
  }

  void process() {
    while (wordQueue.length >= bufferSize) {
      final data = wordQueue.remove();

      _sentWords.add(data);

      if (_sentWords.contains(data)) continue;

      // if (_sentWords.length > 10) {
      final firstWord = _sentWords.first;
      _sentWords.remove(firstWord);
      print('🆕 new word : ${firstWord.transcript}');
      _wordController.add(firstWord);
      // }

      // _sentWords.clear();
    }
  }
}
