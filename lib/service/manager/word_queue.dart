// import 'dart:collection';

// import 'package:trans_app/interfaces/sentence_receiver.dart';

// class WordQueue {
//   final Queue<String> _wordBuffer = Queue();
//   DateTime _start = DateTime.now();

//   final SentenceReceiver receiver;
//   final Duration maxDuration;
//   final int maxQueueLength;

//   bool _lastIsFinal = false;

//   WordQueue({
//     required this.receiver,
//     this.maxDuration = const Duration(seconds: 6),
//     this.maxQueueLength = 5,
//   });

//   void addWord(String word, {required bool isFinal}) {
//     if (word.trim().isEmpty) return;

//     _wordBuffer.add(word);
//     _lastIsFinal = isFinal;

//     final now = DateTime.now();
//     final expired = now.difference(_start) > maxDuration;
//     final full = _wordBuffer.length >= maxQueueLength;

//     if (expired || full || isFinal) {
//       // print('expired or full => emit');
//       _emitChunk();
//     }
//   }

//   void _emitChunk() {
//     // print('[wordQueue] queue emit');
//     receiver.receive(_wordBuffer.first, isFinal: _lastIsFinal);
//     _wordBuffer.clear();
//     _start = DateTime.now();
//   }
// }
