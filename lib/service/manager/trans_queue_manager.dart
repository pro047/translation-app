import 'dart:async';

import 'package:trans_app/data/dto/transcript_data.dart';
import 'package:trans_app/service/api/firebase_service.dart';
import 'package:trans_app/service/api/translation_service.dart';
import 'package:trans_app/service/queue/trans_queue.dart';

class TransQueueManager {
  final TransQueue<TranscriptData> transQueue;
  final int maxQueueLength;

  List<TranscriptData> _buffer = [];
  bool _isTranslating = false;
  String? lastTranslatedText;

  TransQueueManager(this.transQueue, {this.maxQueueLength = 5}) {
    transQueue.onAdd.listen((_) => process());
  }

  Future<void> receive(TranscriptData data) async {
    if (transQueue.length >= maxQueueLength) {
      print('trnasQueue is full. Dropping : ${data.transcript}');
      return;
    }
    await process();
  }

  Future<void> process() async {
    if (_isTranslating) return;
    print('✅ transManager processing ... / isTranslating : $_isTranslating');

    if (transQueue.isNotEmpty) {
      final sentence = transQueue.remove();
      _buffer.add(sentence);

      if (_buffer.isEmpty) {
        print('_buffer is Empty / _buffer is Empty : ${_buffer.isEmpty}');
        return;
      }

      final sentenceToTranslate = _buffer.first.transcript;
      if (sentenceToTranslate == lastTranslatedText) {
        print('⏭️ skipping duplicate sentece');
        return;
      }

      lastTranslatedText = sentenceToTranslate;

      _buffer = [];
      _isTranslating = true;

      try {
        final translated = await TranslationService.translate(
          sentenceToTranslate,
        );
        print('번역 결과 : $sentenceToTranslate => $translated');
        if (translated != null) {
          await FirebaseService.pushTranslatedSentence(translated);
        }
      } catch (err) {
        print('translation error : $err');
      }

      _isTranslating = false;

      if (transQueue.isNotEmpty) {
        await process();
      }
    }
  }
}
