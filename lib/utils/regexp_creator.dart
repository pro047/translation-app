import 'package:trans_app/utils/sentence_ending_list.dart';

RegExp createChurchEndingRegExp(List<String> endings) {
  final escaped = endings.map(RegExp.escape);
  final pattern = '(${escaped.join('|')})\$';
  return RegExp(pattern, caseSensitive: false);
}

final RegExp endingRegExpCreator = createChurchEndingRegExp(
  churchSentenceEndings,
);
