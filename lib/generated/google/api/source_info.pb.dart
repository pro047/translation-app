//
//  Generated code. Do not modify.
//  source: google/api/source_info.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../protobuf/any.pb.dart' as $27;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// Source information used to create a Service Config
class SourceInfo extends $pb.GeneratedMessage {
  factory SourceInfo({
    $core.Iterable<$27.Any>? sourceFiles,
  }) {
    final result = create();
    if (sourceFiles != null) result.sourceFiles.addAll(sourceFiles);
    return result;
  }

  SourceInfo._();

  factory SourceInfo.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory SourceInfo.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SourceInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'google.api'), createEmptyInstance: create)
    ..pc<$27.Any>(1, _omitFieldNames ? '' : 'sourceFiles', $pb.PbFieldType.PM, subBuilder: $27.Any.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SourceInfo clone() => SourceInfo()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SourceInfo copyWith(void Function(SourceInfo) updates) => super.copyWith((message) => updates(message as SourceInfo)) as SourceInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SourceInfo create() => SourceInfo._();
  @$core.override
  SourceInfo createEmptyInstance() => create();
  static $pb.PbList<SourceInfo> createRepeated() => $pb.PbList<SourceInfo>();
  @$core.pragma('dart2js:noInline')
  static SourceInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SourceInfo>(create);
  static SourceInfo? _defaultInstance;

  /// All files used during config generation.
  @$pb.TagNumber(1)
  $pb.PbList<$27.Any> get sourceFiles => $_getList(0);
}


const $core.bool _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
