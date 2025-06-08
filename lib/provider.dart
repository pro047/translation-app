import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trans_app/emitters/preacher_stt_emitter.dart';
import 'package:trans_app/interfaces/sentence_receiver.dart';
import 'package:trans_app/interfaces/sentence_translator.dart';
import 'package:trans_app/service/queues/translation_queue.dart';
import 'package:trans_app/service/queues/validateQueue/en_to_ko_queue.dart';
import 'package:trans_app/service/queues/validateQueue/ko_to_en_queue.dart';

import 'package:trans_app/service/queues/word_queue.dart';

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

  if (source == 'KO') {
    return KoToEnValidateQueue(
      translator: translator,
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
final wordQueueProvider = Provider<WordQueue>(
  (ref) => WordQueue(
    receiver: ref.watch(validateQueueProvider),
    onLog: (message) {
      ref.read(logProvider.notifier).state += '[WordQueue] $message\n';
    },
  ),
);
final preacherSttEmitterProvider = Provider<PreacherSttEmitter>((ref) {
  return _singletonEmitter;
});

final _singletonEmitter = PreacherSttEmitter();
