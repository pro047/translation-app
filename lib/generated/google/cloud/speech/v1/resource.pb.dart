//
//  Generated code. Do not modify.
//  source: google/cloud/speech/v1/resource.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// An item of the class.
class CustomClass_ClassItem extends $pb.GeneratedMessage {
  factory CustomClass_ClassItem({
    $core.String? value,
  }) {
    final result = create();
    if (value != null) result.value = value;
    return result;
  }

  CustomClass_ClassItem._();

  factory CustomClass_ClassItem.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory CustomClass_ClassItem.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CustomClass.ClassItem', package: const $pb.PackageName(_omitMessageNames ? '' : 'google.cloud.speech.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'value')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CustomClass_ClassItem clone() => CustomClass_ClassItem()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CustomClass_ClassItem copyWith(void Function(CustomClass_ClassItem) updates) => super.copyWith((message) => updates(message as CustomClass_ClassItem)) as CustomClass_ClassItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CustomClass_ClassItem create() => CustomClass_ClassItem._();
  @$core.override
  CustomClass_ClassItem createEmptyInstance() => create();
  static $pb.PbList<CustomClass_ClassItem> createRepeated() => $pb.PbList<CustomClass_ClassItem>();
  @$core.pragma('dart2js:noInline')
  static CustomClass_ClassItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CustomClass_ClassItem>(create);
  static CustomClass_ClassItem? _defaultInstance;

  /// The class item's value.
  @$pb.TagNumber(1)
  $core.String get value => $_getSZ(0);
  @$pb.TagNumber(1)
  set value($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => $_clearField(1);
}

/// A set of words or phrases that represents a common concept likely to appear
/// in your audio, for example a list of passenger ship names. CustomClass items
/// can be substituted into placeholders that you set in PhraseSet phrases.
class CustomClass extends $pb.GeneratedMessage {
  factory CustomClass({
    $core.String? name,
    $core.String? customClassId,
    $core.Iterable<CustomClass_ClassItem>? items,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (customClassId != null) result.customClassId = customClassId;
    if (items != null) result.items.addAll(items);
    return result;
  }

  CustomClass._();

  factory CustomClass.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory CustomClass.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CustomClass', package: const $pb.PackageName(_omitMessageNames ? '' : 'google.cloud.speech.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'customClassId')
    ..pc<CustomClass_ClassItem>(3, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM, subBuilder: CustomClass_ClassItem.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CustomClass clone() => CustomClass()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CustomClass copyWith(void Function(CustomClass) updates) => super.copyWith((message) => updates(message as CustomClass)) as CustomClass;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CustomClass create() => CustomClass._();
  @$core.override
  CustomClass createEmptyInstance() => create();
  static $pb.PbList<CustomClass> createRepeated() => $pb.PbList<CustomClass>();
  @$core.pragma('dart2js:noInline')
  static CustomClass getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CustomClass>(create);
  static CustomClass? _defaultInstance;

  /// The resource name of the custom class.
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  /// If this custom class is a resource, the custom_class_id is the resource id
  /// of the CustomClass. Case sensitive.
  @$pb.TagNumber(2)
  $core.String get customClassId => $_getSZ(1);
  @$pb.TagNumber(2)
  set customClassId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCustomClassId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCustomClassId() => $_clearField(2);

  /// A collection of class items.
  @$pb.TagNumber(3)
  $pb.PbList<CustomClass_ClassItem> get items => $_getList(2);
}

/// A phrases containing words and phrase "hints" so that
/// the speech recognition is more likely to recognize them. This can be used
/// to improve the accuracy for specific words and phrases, for example, if
/// specific commands are typically spoken by the user. This can also be used
/// to add additional words to the vocabulary of the recognizer. See
/// [usage limits](https://cloud.google.com/speech-to-text/quotas#content).
///
/// List items can also include pre-built or custom classes containing groups
/// of words that represent common concepts that occur in natural language. For
/// example, rather than providing a phrase hint for every month of the
/// year (e.g. "i was born in january", "i was born in febuary", ...), use the
/// pre-built `$MONTH` class improves the likelihood of correctly transcribing
/// audio that includes months (e.g. "i was born in $month").
/// To refer to pre-built classes, use the class' symbol prepended with `$`
/// e.g. `$MONTH`. To refer to custom classes that were defined inline in the
/// request, set the class's `custom_class_id` to a string unique to all class
/// resources and inline classes. Then use the class' id wrapped in $`{...}`
/// e.g. "${my-months}". To refer to custom classes resources, use the class'
/// id wrapped in `${}` (e.g. `${my-months}`).
///
/// Speech-to-Text supports three locations: `global`, `us` (US North America),
/// and `eu` (Europe). If you are calling the `speech.googleapis.com`
/// endpoint, use the `global` location. To specify a region, use a
/// [regional endpoint](https://cloud.google.com/speech-to-text/docs/endpoints)
/// with matching `us` or `eu` location value.
class PhraseSet_Phrase extends $pb.GeneratedMessage {
  factory PhraseSet_Phrase({
    $core.String? value,
    $core.double? boost,
  }) {
    final result = create();
    if (value != null) result.value = value;
    if (boost != null) result.boost = boost;
    return result;
  }

  PhraseSet_Phrase._();

  factory PhraseSet_Phrase.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory PhraseSet_Phrase.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PhraseSet.Phrase', package: const $pb.PackageName(_omitMessageNames ? '' : 'google.cloud.speech.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'value')
    ..a<$core.double>(2, _omitFieldNames ? '' : 'boost', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PhraseSet_Phrase clone() => PhraseSet_Phrase()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PhraseSet_Phrase copyWith(void Function(PhraseSet_Phrase) updates) => super.copyWith((message) => updates(message as PhraseSet_Phrase)) as PhraseSet_Phrase;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PhraseSet_Phrase create() => PhraseSet_Phrase._();
  @$core.override
  PhraseSet_Phrase createEmptyInstance() => create();
  static $pb.PbList<PhraseSet_Phrase> createRepeated() => $pb.PbList<PhraseSet_Phrase>();
  @$core.pragma('dart2js:noInline')
  static PhraseSet_Phrase getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PhraseSet_Phrase>(create);
  static PhraseSet_Phrase? _defaultInstance;

  /// The phrase itself.
  @$pb.TagNumber(1)
  $core.String get value => $_getSZ(0);
  @$pb.TagNumber(1)
  set value($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => $_clearField(1);

  /// Hint Boost. Overrides the boost set at the phrase set level.
  /// Positive value will increase the probability that a specific phrase will
  /// be recognized over other similar sounding phrases. The higher the boost,
  /// the higher the chance of false positive recognition as well. Negative
  /// boost will simply be ignored. Though `boost` can accept a wide range of
  /// positive values, most use cases are best served
  /// with values between 0 and 20. We recommend using a binary search approach
  /// to finding the optimal value for your use case as well as adding
  /// phrases both with and without boost to your requests.
  @$pb.TagNumber(2)
  $core.double get boost => $_getN(1);
  @$pb.TagNumber(2)
  set boost($core.double value) => $_setFloat(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBoost() => $_has(1);
  @$pb.TagNumber(2)
  void clearBoost() => $_clearField(2);
}

/// Provides "hints" to the speech recognizer to favor specific words and phrases
/// in the results.
class PhraseSet extends $pb.GeneratedMessage {
  factory PhraseSet({
    $core.String? name,
    $core.Iterable<PhraseSet_Phrase>? phrases,
    $core.double? boost,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (phrases != null) result.phrases.addAll(phrases);
    if (boost != null) result.boost = boost;
    return result;
  }

  PhraseSet._();

  factory PhraseSet.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory PhraseSet.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PhraseSet', package: const $pb.PackageName(_omitMessageNames ? '' : 'google.cloud.speech.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..pc<PhraseSet_Phrase>(2, _omitFieldNames ? '' : 'phrases', $pb.PbFieldType.PM, subBuilder: PhraseSet_Phrase.create)
    ..a<$core.double>(4, _omitFieldNames ? '' : 'boost', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PhraseSet clone() => PhraseSet()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PhraseSet copyWith(void Function(PhraseSet) updates) => super.copyWith((message) => updates(message as PhraseSet)) as PhraseSet;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PhraseSet create() => PhraseSet._();
  @$core.override
  PhraseSet createEmptyInstance() => create();
  static $pb.PbList<PhraseSet> createRepeated() => $pb.PbList<PhraseSet>();
  @$core.pragma('dart2js:noInline')
  static PhraseSet getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PhraseSet>(create);
  static PhraseSet? _defaultInstance;

  /// The resource name of the phrase set.
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  /// A list of word and phrases.
  @$pb.TagNumber(2)
  $pb.PbList<PhraseSet_Phrase> get phrases => $_getList(1);

  /// Hint Boost. Positive value will increase the probability that a specific
  /// phrase will be recognized over other similar sounding phrases. The higher
  /// the boost, the higher the chance of false positive recognition as well.
  /// Negative boost values would correspond to anti-biasing. Anti-biasing is not
  /// enabled, so negative boost will simply be ignored. Though `boost` can
  /// accept a wide range of positive values, most use cases are best served with
  /// values between 0 (exclusive) and 20. We recommend using a binary search
  /// approach to finding the optimal value for your use case as well as adding
  /// phrases both with and without boost to your requests.
  @$pb.TagNumber(4)
  $core.double get boost => $_getN(2);
  @$pb.TagNumber(4)
  set boost($core.double value) => $_setFloat(2, value);
  @$pb.TagNumber(4)
  $core.bool hasBoost() => $_has(2);
  @$pb.TagNumber(4)
  void clearBoost() => $_clearField(4);
}

class SpeechAdaptation_ABNFGrammar extends $pb.GeneratedMessage {
  factory SpeechAdaptation_ABNFGrammar({
    $core.Iterable<$core.String>? abnfStrings,
  }) {
    final result = create();
    if (abnfStrings != null) result.abnfStrings.addAll(abnfStrings);
    return result;
  }

  SpeechAdaptation_ABNFGrammar._();

  factory SpeechAdaptation_ABNFGrammar.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory SpeechAdaptation_ABNFGrammar.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SpeechAdaptation.ABNFGrammar', package: const $pb.PackageName(_omitMessageNames ? '' : 'google.cloud.speech.v1'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'abnfStrings')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SpeechAdaptation_ABNFGrammar clone() => SpeechAdaptation_ABNFGrammar()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SpeechAdaptation_ABNFGrammar copyWith(void Function(SpeechAdaptation_ABNFGrammar) updates) => super.copyWith((message) => updates(message as SpeechAdaptation_ABNFGrammar)) as SpeechAdaptation_ABNFGrammar;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SpeechAdaptation_ABNFGrammar create() => SpeechAdaptation_ABNFGrammar._();
  @$core.override
  SpeechAdaptation_ABNFGrammar createEmptyInstance() => create();
  static $pb.PbList<SpeechAdaptation_ABNFGrammar> createRepeated() => $pb.PbList<SpeechAdaptation_ABNFGrammar>();
  @$core.pragma('dart2js:noInline')
  static SpeechAdaptation_ABNFGrammar getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SpeechAdaptation_ABNFGrammar>(create);
  static SpeechAdaptation_ABNFGrammar? _defaultInstance;

  /// All declarations and rules of an ABNF grammar broken up into multiple
  /// strings that will end up concatenated.
  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get abnfStrings => $_getList(0);
}

/// Speech adaptation configuration.
class SpeechAdaptation extends $pb.GeneratedMessage {
  factory SpeechAdaptation({
    $core.Iterable<PhraseSet>? phraseSets,
    $core.Iterable<$core.String>? phraseSetReferences,
    $core.Iterable<CustomClass>? customClasses,
    SpeechAdaptation_ABNFGrammar? abnfGrammar,
  }) {
    final result = create();
    if (phraseSets != null) result.phraseSets.addAll(phraseSets);
    if (phraseSetReferences != null) result.phraseSetReferences.addAll(phraseSetReferences);
    if (customClasses != null) result.customClasses.addAll(customClasses);
    if (abnfGrammar != null) result.abnfGrammar = abnfGrammar;
    return result;
  }

  SpeechAdaptation._();

  factory SpeechAdaptation.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory SpeechAdaptation.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SpeechAdaptation', package: const $pb.PackageName(_omitMessageNames ? '' : 'google.cloud.speech.v1'), createEmptyInstance: create)
    ..pc<PhraseSet>(1, _omitFieldNames ? '' : 'phraseSets', $pb.PbFieldType.PM, subBuilder: PhraseSet.create)
    ..pPS(2, _omitFieldNames ? '' : 'phraseSetReferences')
    ..pc<CustomClass>(3, _omitFieldNames ? '' : 'customClasses', $pb.PbFieldType.PM, subBuilder: CustomClass.create)
    ..aOM<SpeechAdaptation_ABNFGrammar>(4, _omitFieldNames ? '' : 'abnfGrammar', subBuilder: SpeechAdaptation_ABNFGrammar.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SpeechAdaptation clone() => SpeechAdaptation()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SpeechAdaptation copyWith(void Function(SpeechAdaptation) updates) => super.copyWith((message) => updates(message as SpeechAdaptation)) as SpeechAdaptation;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SpeechAdaptation create() => SpeechAdaptation._();
  @$core.override
  SpeechAdaptation createEmptyInstance() => create();
  static $pb.PbList<SpeechAdaptation> createRepeated() => $pb.PbList<SpeechAdaptation>();
  @$core.pragma('dart2js:noInline')
  static SpeechAdaptation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SpeechAdaptation>(create);
  static SpeechAdaptation? _defaultInstance;

  /// A collection of phrase sets. To specify the hints inline, leave the
  /// phrase set's `name` blank and fill in the rest of its fields. Any
  /// phrase set can use any custom class.
  @$pb.TagNumber(1)
  $pb.PbList<PhraseSet> get phraseSets => $_getList(0);

  /// A collection of phrase set resource names to use.
  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get phraseSetReferences => $_getList(1);

  /// A collection of custom classes. To specify the classes inline, leave the
  /// class' `name` blank and fill in the rest of its fields, giving it a unique
  /// `custom_class_id`. Refer to the inline defined class in phrase hints by its
  /// `custom_class_id`.
  @$pb.TagNumber(3)
  $pb.PbList<CustomClass> get customClasses => $_getList(2);

  /// Augmented Backus-Naur form (ABNF) is a standardized grammar notation
  /// comprised by a set of derivation rules.
  /// See specifications: https://www.w3.org/TR/speech-grammar
  @$pb.TagNumber(4)
  SpeechAdaptation_ABNFGrammar get abnfGrammar => $_getN(3);
  @$pb.TagNumber(4)
  set abnfGrammar(SpeechAdaptation_ABNFGrammar value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasAbnfGrammar() => $_has(3);
  @$pb.TagNumber(4)
  void clearAbnfGrammar() => $_clearField(4);
  @$pb.TagNumber(4)
  SpeechAdaptation_ABNFGrammar ensureAbnfGrammar() => $_ensure(3);
}

/// A single replacement configuration.
class TranscriptNormalization_Entry extends $pb.GeneratedMessage {
  factory TranscriptNormalization_Entry({
    $core.String? search,
    $core.String? replace,
    $core.bool? caseSensitive,
  }) {
    final result = create();
    if (search != null) result.search = search;
    if (replace != null) result.replace = replace;
    if (caseSensitive != null) result.caseSensitive = caseSensitive;
    return result;
  }

  TranscriptNormalization_Entry._();

  factory TranscriptNormalization_Entry.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory TranscriptNormalization_Entry.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TranscriptNormalization.Entry', package: const $pb.PackageName(_omitMessageNames ? '' : 'google.cloud.speech.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'search')
    ..aOS(2, _omitFieldNames ? '' : 'replace')
    ..aOB(3, _omitFieldNames ? '' : 'caseSensitive')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TranscriptNormalization_Entry clone() => TranscriptNormalization_Entry()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TranscriptNormalization_Entry copyWith(void Function(TranscriptNormalization_Entry) updates) => super.copyWith((message) => updates(message as TranscriptNormalization_Entry)) as TranscriptNormalization_Entry;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TranscriptNormalization_Entry create() => TranscriptNormalization_Entry._();
  @$core.override
  TranscriptNormalization_Entry createEmptyInstance() => create();
  static $pb.PbList<TranscriptNormalization_Entry> createRepeated() => $pb.PbList<TranscriptNormalization_Entry>();
  @$core.pragma('dart2js:noInline')
  static TranscriptNormalization_Entry getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TranscriptNormalization_Entry>(create);
  static TranscriptNormalization_Entry? _defaultInstance;

  /// What to replace. Max length is 100 characters.
  @$pb.TagNumber(1)
  $core.String get search => $_getSZ(0);
  @$pb.TagNumber(1)
  set search($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSearch() => $_has(0);
  @$pb.TagNumber(1)
  void clearSearch() => $_clearField(1);

  /// What to replace with. Max length is 100 characters.
  @$pb.TagNumber(2)
  $core.String get replace => $_getSZ(1);
  @$pb.TagNumber(2)
  set replace($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasReplace() => $_has(1);
  @$pb.TagNumber(2)
  void clearReplace() => $_clearField(2);

  /// Whether the search is case sensitive.
  @$pb.TagNumber(3)
  $core.bool get caseSensitive => $_getBF(2);
  @$pb.TagNumber(3)
  set caseSensitive($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCaseSensitive() => $_has(2);
  @$pb.TagNumber(3)
  void clearCaseSensitive() => $_clearField(3);
}

/// Transcription normalization configuration. Use transcription normalization
/// to automatically replace parts of the transcript with phrases of your
/// choosing. For StreamingRecognize, this normalization only applies to stable
/// partial transcripts (stability > 0.8) and final transcripts.
class TranscriptNormalization extends $pb.GeneratedMessage {
  factory TranscriptNormalization({
    $core.Iterable<TranscriptNormalization_Entry>? entries,
  }) {
    final result = create();
    if (entries != null) result.entries.addAll(entries);
    return result;
  }

  TranscriptNormalization._();

  factory TranscriptNormalization.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory TranscriptNormalization.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TranscriptNormalization', package: const $pb.PackageName(_omitMessageNames ? '' : 'google.cloud.speech.v1'), createEmptyInstance: create)
    ..pc<TranscriptNormalization_Entry>(1, _omitFieldNames ? '' : 'entries', $pb.PbFieldType.PM, subBuilder: TranscriptNormalization_Entry.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TranscriptNormalization clone() => TranscriptNormalization()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TranscriptNormalization copyWith(void Function(TranscriptNormalization) updates) => super.copyWith((message) => updates(message as TranscriptNormalization)) as TranscriptNormalization;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TranscriptNormalization create() => TranscriptNormalization._();
  @$core.override
  TranscriptNormalization createEmptyInstance() => create();
  static $pb.PbList<TranscriptNormalization> createRepeated() => $pb.PbList<TranscriptNormalization>();
  @$core.pragma('dart2js:noInline')
  static TranscriptNormalization getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TranscriptNormalization>(create);
  static TranscriptNormalization? _defaultInstance;

  /// A list of replacement entries. We will perform replacement with one entry
  /// at a time. For example, the second entry in ["cat" => "dog", "mountain cat"
  /// => "mountain dog"] will never be applied because we will always process the
  /// first entry before it. At most 100 entries.
  @$pb.TagNumber(1)
  $pb.PbList<TranscriptNormalization_Entry> get entries => $_getList(0);
}


const $core.bool _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
