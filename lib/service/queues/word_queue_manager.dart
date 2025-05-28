import 'package:trans_app/service/queues/translation_queue.dart';
import 'package:trans_app/utils/church_sentence_endings.dart';

class WordQueueManager {
  final List<String> _words = [];
  List<String> _lastRecognizedWords = [];
  DateTime _lastSpoken = DateTime.now();
  DateTime _listeningStart = DateTime.now();

  final void Function(String) onUpdate;
  final void Function(String) onLog;

  WordQueueManager({required this.onUpdate, required this.onLog});

  void updateFromRecognition(
    String recognizedText, {
    bool forceComplete = false,
  }) {
    final current = recognizedText.split(' ');
    final newWords = _extractNewWords(current, _lastRecognizedWords);

    if (newWords.isEmpty && !forceComplete) return;

    _words.addAll(newWords);
    _lastRecognizedWords = current;
    _lastSpoken = DateTime.now();

    final joined = _words.join(' ');

    if (_shouldCompleteSentence(joined)) {
      final sentence = joined;
      _words.clear();
      TranslationQueue.instance.add(sentence, onUpdate, onLog);
      _listeningStart = DateTime.now();
    }
  }

  bool _shouldCompleteSentence(String text) {
    return isChurchSentenceComplete(
      text: text,
      lastSpoken: _lastSpoken,
      listeningStart: _listeningStart,
      wordCount: _words.length,
    );
  }

  List<String> _extractNewWords(List<String> current, List<String> previous) {
    final overlap = current.length <= previous.length;
    if (overlap || !current.join().contains(previous.join())) {
      return current;
    }
    return current.sublist(previous.length);
  }
}
