import 'package:trans_app/service/sentence_queue_manager.dart';
import 'package:trans_app/utils/church_sentence_endings.dart';

class WordQueueManager {
  final List<String> _words = [];
  List<String> _lastRecognizedWords = [];
  DateTime _lastSpoken = DateTime.now();
  DateTime _listeningStart = DateTime.now();

  void updateFromRecognition(String recognizedText) {
    final current = recognizedText.split(' ');
    final newWords = _extractNewWords(current, _lastRecognizedWords);
    if (newWords.isEmpty) return;

    _words.addAll(newWords);
    _lastRecognizedWords = current;
    _lastSpoken = DateTime.now();

    final joined = _words.join(' ');

    if (_shouldCompleteSentence(joined)) {
      final sentence = _words.join(' ');
      _words.clear();
      SentenceQueueManager.instance.enqueue(sentence);
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
    if (current.length <= previous.length) return [];
    return current.sublist(previous.length);
  }
}
