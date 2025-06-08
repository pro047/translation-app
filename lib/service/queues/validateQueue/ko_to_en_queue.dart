import 'package:trans_app/utils/KoToEn/church_sentence_endings.dart';
import 'package:trans_app/interfaces/sentence_receiver.dart';
import 'package:trans_app/interfaces/sentence_translator.dart';

class KoToEnValidateQueue implements SentenceReceiver {
  final SentenceTranslator translator;
  final void Function(String message)? onLog;

  String? _lastSentence;
  DateTime? _lastSpoken;
  DateTime? _listeningStart;

  KoToEnValidateQueue({required this.translator, this.onLog});

  @override
  void receive(List<String> words) {
    onLog?.call('receive success');
    final now = DateTime.now();
    final sentence = words.join(' ').trim();
    onLog?.call('received : $sentence');

    _lastSpoken ??= now;
    _listeningStart ??= now;

    if (_isEmpty(sentence)) return;
    if (_isDuplicate(sentence)) return;

    if (!isChurchSentenceComplete(
      text: sentence,
      lastSpoken: _lastSpoken!,
      listeningStart: _listeningStart!,
      wordCount: words.length,
    )) {
      onLog?.call('[validate] 아직 문장 경계 아님');
      return;
    }

    _send(sentence);
    onLog?.call('[validate] send success');

    _listeningStart = now;
    _lastSpoken = now;
  }

  bool _isEmpty(String sentence) {
    if (sentence.isEmpty) {
      onLog?.call('[validate] ignore empty sentence');
      return true;
    }
    return false;
  }

  bool _isDuplicate(String sentence) {
    if (_lastSentence != null && sentence == _lastSentence) {
      onLog?.call('[validate] ignore duplicate sentence');
      return true;
    }
    _lastSentence = sentence;
    return false;
  }

  void _send(String sentence) {
    translator.add(sentence);
  }
}
