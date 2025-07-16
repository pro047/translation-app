import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trans_app/data/dto/transcript_data.dart';
import 'package:trans_app/emitters/mic_websocket_word_emitter.dart';
import 'package:trans_app/emitters/stream_websocket_word_emitter.dart';
import 'package:trans_app/interfaces/word_emitter.dart';
import 'package:trans_app/interfaces/youtube_word_emitter.dart';
import 'package:trans_app/service/manager/trans_queue_manager.dart';
import 'package:trans_app/service/manager/transcript_manager.dart';
import 'package:trans_app/service/queue/trans_queue.dart';

import 'package:trans_app/core/utils/KoToEn/sentence_accumulator.dart';

final logProvider = StateProvider<String>((ref) => 'log start\n');
final targetLangProvider = StateProvider<String>((ref) => 'EN');
final sourceLangProvider = StateProvider<String>((ref) => 'KO');

final transcriptManagerProvider = Provider<TranscriptManager>(
  (ref) => TranscriptManager(),
);

final transQueueProvider = Provider<TransQueue<TranscriptData>>((ref) {
  final queue = TransQueue<TranscriptData>();
  return queue;
});

final transQueueManagerProvider = Provider<TransQueueManager>(
  (ref) => TransQueueManager(ref.watch(transQueueProvider)),
);

final sentenceAccumulatorProvider = Provider<SentenceAccumulator>(
  (ref) => SentenceAccumulator(),
);

final webSocketWordEmitterProvider = Provider<WordEmitter>((ref) {
  return WebSocketWordEmitter();
});

final streamWebSocketWordEmitterProvider = Provider<YoutubeWordEmitter>((ref) {
  return StreamWebsocketWordEmitter();
});
