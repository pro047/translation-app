//
//  Generated code. Do not modify.
//  source: google/api/visibility.proto
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

/// `Visibility` restricts service consumer's access to service elements,
/// such as whether an application can call a visibility-restricted method.
/// The restriction is expressed by applying visibility labels on service
/// elements. The visibility labels are elsewhere linked to service consumers.
///
/// A service can define multiple visibility labels, but a service consumer
/// should be granted at most one visibility label. Multiple visibility
/// labels for a single service consumer are not supported.
///
/// If an element and all its parents have no visibility label, its visibility
/// is unconditionally granted.
///
/// Example:
///
///     visibility:
///       rules:
///       - selector: google.calendar.Calendar.EnhancedSearch
///         restriction: PREVIEW
///       - selector: google.calendar.Calendar.Delegate
///         restriction: INTERNAL
///
/// Here, all methods are publicly visible except for the restricted methods
/// EnhancedSearch and Delegate.
class Visibility extends $pb.GeneratedMessage {
  factory Visibility({
    $core.Iterable<VisibilityRule>? rules,
  }) {
    final result = create();
    if (rules != null) result.rules.addAll(rules);
    return result;
  }

  Visibility._();

  factory Visibility.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory Visibility.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Visibility', package: const $pb.PackageName(_omitMessageNames ? '' : 'google.api'), createEmptyInstance: create)
    ..pc<VisibilityRule>(1, _omitFieldNames ? '' : 'rules', $pb.PbFieldType.PM, subBuilder: VisibilityRule.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Visibility clone() => Visibility()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Visibility copyWith(void Function(Visibility) updates) => super.copyWith((message) => updates(message as Visibility)) as Visibility;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Visibility create() => Visibility._();
  @$core.override
  Visibility createEmptyInstance() => create();
  static $pb.PbList<Visibility> createRepeated() => $pb.PbList<Visibility>();
  @$core.pragma('dart2js:noInline')
  static Visibility getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Visibility>(create);
  static Visibility? _defaultInstance;

  /// A list of visibility rules that apply to individual API elements.
  ///
  /// **NOTE:** All service configuration rules follow "last one wins" order.
  @$pb.TagNumber(1)
  $pb.PbList<VisibilityRule> get rules => $_getList(0);
}

/// A visibility rule provides visibility configuration for an individual API
/// element.
class VisibilityRule extends $pb.GeneratedMessage {
  factory VisibilityRule({
    $core.String? selector,
    $core.String? restriction,
  }) {
    final result = create();
    if (selector != null) result.selector = selector;
    if (restriction != null) result.restriction = restriction;
    return result;
  }

  VisibilityRule._();

  factory VisibilityRule.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory VisibilityRule.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'VisibilityRule', package: const $pb.PackageName(_omitMessageNames ? '' : 'google.api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'selector')
    ..aOS(2, _omitFieldNames ? '' : 'restriction')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VisibilityRule clone() => VisibilityRule()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VisibilityRule copyWith(void Function(VisibilityRule) updates) => super.copyWith((message) => updates(message as VisibilityRule)) as VisibilityRule;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VisibilityRule create() => VisibilityRule._();
  @$core.override
  VisibilityRule createEmptyInstance() => create();
  static $pb.PbList<VisibilityRule> createRepeated() => $pb.PbList<VisibilityRule>();
  @$core.pragma('dart2js:noInline')
  static VisibilityRule getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VisibilityRule>(create);
  static VisibilityRule? _defaultInstance;

  /// Selects methods, messages, fields, enums, etc. to which this rule applies.
  ///
  /// Refer to [selector][google.api.DocumentationRule.selector] for syntax
  /// details.
  @$pb.TagNumber(1)
  $core.String get selector => $_getSZ(0);
  @$pb.TagNumber(1)
  set selector($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSelector() => $_has(0);
  @$pb.TagNumber(1)
  void clearSelector() => $_clearField(1);

  /// A comma-separated list of visibility labels that apply to the `selector`.
  /// Any of the listed labels can be used to grant the visibility.
  ///
  /// If a rule has multiple labels, removing one of the labels but not all of
  /// them can break clients.
  ///
  /// Example:
  ///
  ///     visibility:
  ///       rules:
  ///       - selector: google.calendar.Calendar.EnhancedSearch
  ///         restriction: INTERNAL, PREVIEW
  ///
  /// Removing INTERNAL from this restriction will break clients that rely on
  /// this method and only had access to it through INTERNAL.
  @$pb.TagNumber(2)
  $core.String get restriction => $_getSZ(1);
  @$pb.TagNumber(2)
  set restriction($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRestriction() => $_has(1);
  @$pb.TagNumber(2)
  void clearRestriction() => $_clearField(2);
}

class VisibilityExt {
  static final enumVisibility = $pb.Extension<VisibilityRule>(_omitMessageNames ? '' : 'google.protobuf.EnumOptions', _omitFieldNames ? '' : 'enumVisibility', 72295727, $pb.PbFieldType.OM, defaultOrMaker: VisibilityRule.getDefault, subBuilder: VisibilityRule.create);
  static final valueVisibility = $pb.Extension<VisibilityRule>(_omitMessageNames ? '' : 'google.protobuf.EnumValueOptions', _omitFieldNames ? '' : 'valueVisibility', 72295727, $pb.PbFieldType.OM, defaultOrMaker: VisibilityRule.getDefault, subBuilder: VisibilityRule.create);
  static final fieldVisibility = $pb.Extension<VisibilityRule>(_omitMessageNames ? '' : 'google.protobuf.FieldOptions', _omitFieldNames ? '' : 'fieldVisibility', 72295727, $pb.PbFieldType.OM, defaultOrMaker: VisibilityRule.getDefault, subBuilder: VisibilityRule.create);
  static final messageVisibility = $pb.Extension<VisibilityRule>(_omitMessageNames ? '' : 'google.protobuf.MessageOptions', _omitFieldNames ? '' : 'messageVisibility', 72295727, $pb.PbFieldType.OM, defaultOrMaker: VisibilityRule.getDefault, subBuilder: VisibilityRule.create);
  static final methodVisibility = $pb.Extension<VisibilityRule>(_omitMessageNames ? '' : 'google.protobuf.MethodOptions', _omitFieldNames ? '' : 'methodVisibility', 72295727, $pb.PbFieldType.OM, defaultOrMaker: VisibilityRule.getDefault, subBuilder: VisibilityRule.create);
  static final apiVisibility = $pb.Extension<VisibilityRule>(_omitMessageNames ? '' : 'google.protobuf.ServiceOptions', _omitFieldNames ? '' : 'apiVisibility', 72295727, $pb.PbFieldType.OM, defaultOrMaker: VisibilityRule.getDefault, subBuilder: VisibilityRule.create);
  static void registerAllExtensions($pb.ExtensionRegistry registry) {
    registry.add(enumVisibility);
    registry.add(valueVisibility);
    registry.add(fieldVisibility);
    registry.add(messageVisibility);
    registry.add(methodVisibility);
    registry.add(apiVisibility);
  }
}


const $core.bool _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
