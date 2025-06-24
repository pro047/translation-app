import 'dart:async';

import 'package:trans_app/data/dto/transcript_data.dart';
import 'package:trans_app/service/queue/valid_queue.dart';

class ValidQueueManager {
  final ValidQueue validQueue;
  final List<TranscriptData> _buffer = [];
  final _sentenceController = StreamController<TranscriptData>.broadcast();

  ValidQueueManager(this.validQueue) {
    validQueue.onAdd.listen((_) => process());
    print('validQueueManager : onAdd.listen regist');
  }

  Stream<TranscriptData> get onSentence => _sentenceController.stream;

  void process() {
    while (validQueue.isNotEmpty) {
      final word = validQueue.remove();
      _buffer.add(word);
      // print('word: ${word.transcript}');

      if (_buffer.length > 10) {
        final sentence = _buffer.map((e) => e.transcript).join(' ');
        final sentenceData = TranscriptData(
          transcript: sentence,
          isFinal: _buffer.first.isFinal,
        );

        _sentenceController.add(sentenceData);
        _buffer.clear();
      }
    }
  }

  int _isSentenceBoundary(String word) {
    return word.length;
  }
}
