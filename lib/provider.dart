import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trans_app/emitters/preacher_stt_emitter.dart';
import 'package:trans_app/interfaces/sentence_receiver.dart';
import 'package:trans_app/interfaces/sentence_translator.dart';
import 'package:trans_app/service/queues/translation_queue.dart';
import 'package:trans_app/service/queues/validate_queue.dart';

import 'package:trans_app/service/queues/word_queue.dart';

final logProvider = StateProvider<String>((ref) => '');
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
final validateQueueProvider = Provider<SentenceReceiver>(
  (ref) => ValidateQueue(
    translator: ref.watch(translationQueueProvider),
    onLog: (messag) =>
        ref.read(logProvider.notifier).state += '[ValidateQueue] $messag\n',
  ),
);
final wordQueueProvider = Provider<WordQueue>(
  (ref) => WordQueue(
    receiver: ref.watch(validateQueueProvider),
    onLog: (message) {
      ref.read(logProvider.notifier).state += '[WordQueue] $message\n';
    },
  ),
);
final preacherSttEmitterProvider = Provider<PreacherSttEmitter>(
  (ref) => PreacherSttEmitter(),
);
