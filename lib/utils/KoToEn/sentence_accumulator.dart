import 'package:trans_app/utils/KoToEn/church_sentence_endings.dart';

class SentenceAccumulator {
  final Duration maxListeningDuration;
  final Duration silenceThreshold;
  final List<String> _words = [];

  String? _lastTranscript;
  DateTime? _lastSpoken;
  DateTime? _listeningStart;

  SentenceAccumulator({
    this.maxListeningDuration = const Duration(seconds: 5),
    this.silenceThreshold = const Duration(seconds: 1),
  });

  void updateTranscript(String transcript, DateTime timestamp) {
    if (transcript == _lastTranscript) return;

    _lastTranscript = transcript;
    _lastSpoken = timestamp;
    _listeningStart ??= timestamp;

    _words
      ..clear()
      ..addAll(transcript.trim().split(RegExp(r'\s+')));
  }

  bool get isComplete {
    final now = DateTime.now();
    final sentence = _words.join(' ');

    if (_words.length < 6) return false;

    return isChurchSentenceComplete(
      text: sentence,
      lastSpoken: _lastSpoken ?? now,
      listeningStart: _listeningStart ?? now,
    );
  }

  String? takeIfComplete() {
    if (!isComplete) return null;

    final completeSentence = _words.join(' ').trim();

    _words.clear();
    _lastTranscript = null;
    _lastSpoken = null;
    _listeningStart = null;

    return completeSentence;
  }

  void reset() {
    _words.clear();
    _lastSpoken = null;
    _listeningStart = null;
    _lastTranscript = null;
  }
}
