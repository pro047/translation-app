//
//  Generated code. Do not modify.
//  source: google/api/control.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'policy.pb.dart' as $26;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// Selects and configures the service controller used by the service.
///
/// Example:
///
///     control:
///       environment: servicecontrol.googleapis.com
class Control extends $pb.GeneratedMessage {
  factory Control({
    $core.String? environment,
    $core.Iterable<$26.MethodPolicy>? methodPolicies,
  }) {
    final result = create();
    if (environment != null) result.environment = environment;
    if (methodPolicies != null) result.methodPolicies.addAll(methodPolicies);
    return result;
  }

  Control._();

  factory Control.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory Control.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Control', package: const $pb.PackageName(_omitMessageNames ? '' : 'google.api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'environment')
    ..pc<$26.MethodPolicy>(4, _omitFieldNames ? '' : 'methodPolicies', $pb.PbFieldType.PM, subBuilder: $26.MethodPolicy.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Control clone() => Control()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Control copyWith(void Function(Control) updates) => super.copyWith((message) => updates(message as Control)) as Control;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Control create() => Control._();
  @$core.override
  Control createEmptyInstance() => create();
  static $pb.PbList<Control> createRepeated() => $pb.PbList<Control>();
  @$core.pragma('dart2js:noInline')
  static Control getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Control>(create);
  static Control? _defaultInstance;

  /// The service controller environment to use. If empty, no control plane
  /// feature (like quota and billing) will be enabled. The recommended value for
  /// most services is servicecontrol.googleapis.com
  @$pb.TagNumber(1)
  $core.String get environment => $_getSZ(0);
  @$pb.TagNumber(1)
  set environment($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEnvironment() => $_has(0);
  @$pb.TagNumber(1)
  void clearEnvironment() => $_clearField(1);

  /// Defines policies applying to the API methods of the service.
  @$pb.TagNumber(4)
  $pb.PbList<$26.MethodPolicy> get methodPolicies => $_getList(1);
}


const $core.bool _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
