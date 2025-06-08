import 'package:trans_app/utils/KoToEn/regexp_creator.dart';

bool isChurchSentenceComplete({
  required String text,
  required DateTime lastSpoken,
  required DateTime listeningStart,
  required int wordCount,
}) {
  final now = DateTime.now();
  final sinceLastSpoken = now.difference(lastSpoken);
  final sinceListeningStart = now.difference(listeningStart);

  final trimmed = text.trim();

  final endsWithChurchEnding = endingRegExpCreator.hasMatch(trimmed);

  final timeExpired = sinceListeningStart > Duration(seconds: 8);
  final silenceDetected = sinceLastSpoken > Duration(seconds: 1);
  final tooManyWords = wordCount > 70;

  return endsWithChurchEnding || timeExpired || silenceDetected || tooManyWords;
}
