const coordinatingConjunctions = [
  'And',
  'But',
  'Or',
  'Nor',
  'For',
  'So',
  'Yet',
];

const transitionConjunctions = [
  'However',
  'Therefore',
  'Then',
  'Thus',
  'Nevertheless',
  'Meanwhile',
  'Moreover',
  'Consequently',
  'Furthermore',
  'Nonetheless',
  'Afterward',
  'Otherwise',
];

const temporalConjunctions = [
  'Next',
  'Finally',
  'Eventually',
  'Subsequently',
  'Later',
  'Now',
];

const subordinatingConjunctions = [
  'because',
  'although',
  'though',
  'even though',
  'while',
  'since',
  'unless',
  'whereas',
  'after',
  'before',
  'until',
  'when',
  'once',
  'if',
];

const sentenceStartConjunctions = [
  ...coordinatingConjunctions,
  ...transitionConjunctions,
  ...temporalConjunctions,
];

bool startWithConjunction(String word) {
  if (word.isEmpty) return false;
  final firstWord = word.trim().split(' ').first;
  return sentenceStartConjunctions.contains(firstWord);
}

bool startWithSubordinatingConjunction(String word) {
  return subordinatingConjunctions.contains(word.toLowerCase());
}
