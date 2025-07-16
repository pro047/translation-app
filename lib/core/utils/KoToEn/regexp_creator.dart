import 'package:trans_app/core/utils/KoToEn/sentence_ending_list.dart';

RegExp createChurchEndingRegExp(List<String> endings) {
  final escaped = endings.map(RegExp.escape);
  final pattern = '(${escaped.join('|')})(\\b|[\\s.,?!~…])\\\$';
  return RegExp(pattern, caseSensitive: false);
}

final RegExp endingRegExpCreator = createChurchEndingRegExp(
  churchSentenceEndings,
);
