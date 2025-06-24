import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trans_app/emitters/mic_websocket_word_emitter.dart';
import 'package:trans_app/emitters/stream_websocket_word_emitter.dart';
import 'package:trans_app/interfaces/sentence_receiver.dart';
import 'package:trans_app/interfaces/sentence_translator.dart';
import 'package:trans_app/interfaces/word_emitter.dart';
import 'package:trans_app/interfaces/youtube_word_emitter.dart';
import 'package:trans_app/service/manager/trans_queue_manager.dart';
import 'package:trans_app/service/manager/translation_queue.dart';
import 'package:trans_app/service/manager/valid_queue_manager.dart';
import 'package:trans_app/service/manager/validateQueue/en_to_ko_queue.dart';
import 'package:trans_app/service/manager/validateQueue/ko_to_en_queue.dart';
import 'package:trans_app/service/manager/word_queue_manager.dart';
import 'package:trans_app/service/queue/trans_queue.dart';
import 'package:trans_app/service/queue/valid_queue.dart';

// import 'package:trans_app/service/manager/word_queue.dart';
import 'package:trans_app/service/queue/word_queue.dart';
import 'package:trans_app/utils/KoToEn/sentence_accumulator.dart';

final logProvider = StateProvider<String>((ref) => 'log start\n');
final targetLangProvider = StateProvider<String>((ref) => 'EN');
final sourceLangProvider = StateProvider<String>((ref) => 'KO');

final translationQueueProvider = Provider<SentenceTranslator>(
  (ref) => TranslationQueue(
    onLog: (message) =>
        ref.read(logProvider.notifier).state += '[TranslationQueue] $message\n',
    targetLang: ref.watch(targetLangProvider),
    sourceLang: ref.watch(sourceLangProvider),
  ),
);

final validateQueueProvider = Provider<SentenceReceiver>((ref) {
  final source = ref.watch(sourceLangProvider);
  final translator = ref.watch(translationQueueProvider);
  final accumulator = ref.watch(sentenceAccumulatorProvider);

  if (source == 'KO') {
    return KoToEnValidateQueue(
      translator: translator,
      accumulator: accumulator,
      onLog: (message) => ref.read(logProvider.notifier).state +=
          '[ValidationQueue] $message\n',
    );
  } else {
    return EnToKoValidateQueue(
      translator: translator,
      onLog: (message) => ref.read(logProvider.notifier).state +=
          '[ValidationQueue] $message\n',
    );
  }
});

// final wordQueueProvider = Provider<WordQueue>(
//   (ref) => WordQueue(receiver: ref.watch(validateQueueProvider)),
// );

final wordQueueProvider = Provider<WordQueue>((ref) => WordQueue());

final wordQueueManagerProvider = Provider<WordQueueManager>((ref) {
  final queue = ref.watch(wordQueueProvider);
  final manager = WordQueueManager(queue);
  return manager;
});

final validQueueProvider = Provider<ValidQueue>((ref) {
  final queue = ValidQueue();

  final wordManager = ref.watch(wordQueueManagerProvider);
  wordManager.onWord.listen((data) {
    queue.add(data);
  });

  return queue;
});

final validQueueManagerProvider = Provider<ValidQueueManager>((ref) {
  final queue = ref.watch(validQueueProvider);
  final manager = ValidQueueManager(queue);
  return manager;
});

final transQueueProvider = Provider<TransQueue>((ref) {
  final queue = TransQueue();

  final validManager = ref.watch(validQueueManagerProvider);
  validManager.onSentence.listen((data) {
    queue.add(data);
  });

  return queue;
});

final transQueueManagerProvider = Provider<TransQueueManager>((ref) {
  final queue = ref.watch(transQueueProvider);
  final manager = TransQueueManager(queue);

  return manager;
});

final sentenceAccumulatorProvider = Provider<SentenceAccumulator>(
  (ref) => SentenceAccumulator(),
);

final webSocketWordEmitterProvider = Provider<WordEmitter>((ref) {
  return WebSocketWordEmitter();
});

final streamWebSocketWordEmitterProvider = Provider<YoutubeWordEmitter>((ref) {
  return StreamWebsocketWordEmitter();
});
