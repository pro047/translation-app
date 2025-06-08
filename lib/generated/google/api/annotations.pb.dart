//
//  Generated code. Do not modify.
//  source: google/api/annotations.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'http.pb.dart' as $20;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class Annotations {
  static final http = $pb.Extension<$20.HttpRule>(_omitMessageNames ? '' : 'google.protobuf.MethodOptions', _omitFieldNames ? '' : 'http', 72295728, $pb.PbFieldType.OM, defaultOrMaker: $20.HttpRule.getDefault, subBuilder: $20.HttpRule.create);
  static void registerAllExtensions($pb.ExtensionRegistry registry) {
    registry.add(http);
  }
}


const $core.bool _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
