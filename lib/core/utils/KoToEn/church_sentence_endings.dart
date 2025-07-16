import 'package:trans_app/core/utils/KoToEn/sentence_ending_list.dart';

bool isChurchSentenceComplete({
  required String text,
  required DateTime lastSpoken,
  required DateTime listeningStart,
  // required int wordCount,
}) {
  final now = DateTime.now();
  final sinceLastSpoken = now.difference(lastSpoken);
  final sinceListeningStart = now.difference(listeningStart);

  final trimmed = text.trim();

  // final endsWithChurchEnding = endingRegExpCreator.hasMatch(trimmed);
  final endsWithChurchEnding = churchSentenceEndings.any(
    (ending) => trimmed.endsWith(ending),
  );

  final timeExpired = sinceListeningStart > Duration(seconds: 5);
  final silenceDetected = sinceLastSpoken > Duration(seconds: 1);
  // final isSilentAndLongEnough = silenceDetected && wordCount > 5;
  // final tooManyWords = wordCount > 10;

  return endsWithChurchEnding || timeExpired || silenceDetected;
  // tooManyWords;
}
