final List<String> churchSentenceEndings = [
  '입니다',
  '합니다',
  '하십니다',
  '되겠습니다',
  '있습니다',
  '없습니다',
  '전해드립니다',
  '믿습니다',
  '감사합니다',
  '축복합니다',
  '바랍니다',
  '합시다',
  '기도합시다',
  '살아갑시다',
  '되기를 원합니다',
  '되게 하소서',
  '되게 하시옵소서',
  '원하옵나이다',
  '하옵소서',
  '주시옵소서',
  '하소서',
  '이죠',
  '이었습니다',
  '였죠',
  '예요',
  '에요',
  '였어요',
  '했어요',
  '했죠',
  '했었습니다',
  '선포합니다',
  '외칩니다',
  '확신합니다',
  '깨닫습니다',
  '전파합시다',
  '예수님의 이름으로 기도드립니다',
  '주님의 이름으로 축복합니다',
];

bool isChurchSentenceComplete({
  required String text,
  required DateTime lastSpoken,
  required DateTime listeningStart,
  required int wordCount,
}) {
  final now = DateTime.now();
  final sinceLastSpoken = now.difference(lastSpoken);
  final sinceListeningStart = now.difference(listeningStart);

  final endsWithChurchEnding = churchSentenceEndings.any(
    (ending) => text.trim().endsWith(ending),
  );

  final timeExpired = sinceListeningStart > Duration(seconds: 8);
  final silenceDetected = sinceLastSpoken > Duration(seconds: 1);
  final tooManyWords = wordCount > 70;

  return endsWithChurchEnding || timeExpired || silenceDetected || tooManyWords;
}
