//
//  Generated code. Do not modify.
//  source: google/api/backend.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'backend.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'backend.pbenum.dart';

/// `Backend` defines the backend configuration for a service.
class Backend extends $pb.GeneratedMessage {
  factory Backend({
    $core.Iterable<BackendRule>? rules,
  }) {
    final result = create();
    if (rules != null) result.rules.addAll(rules);
    return result;
  }

  Backend._();

  factory Backend.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory Backend.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Backend', package: const $pb.PackageName(_omitMessageNames ? '' : 'google.api'), createEmptyInstance: create)
    ..pc<BackendRule>(1, _omitFieldNames ? '' : 'rules', $pb.PbFieldType.PM, subBuilder: BackendRule.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Backend clone() => Backend()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Backend copyWith(void Function(Backend) updates) => super.copyWith((message) => updates(message as Backend)) as Backend;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Backend create() => Backend._();
  @$core.override
  Backend createEmptyInstance() => create();
  static $pb.PbList<Backend> createRepeated() => $pb.PbList<Backend>();
  @$core.pragma('dart2js:noInline')
  static Backend getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Backend>(create);
  static Backend? _defaultInstance;

  /// A list of API backend rules that apply to individual API methods.
  ///
  /// **NOTE:** All service configuration rules follow "last one wins" order.
  @$pb.TagNumber(1)
  $pb.PbList<BackendRule> get rules => $_getList(0);
}

enum BackendRule_Authentication {
  jwtAudience, 
  disableAuth, 
  notSet
}

/// A backend rule provides configuration for an individual API element.
class BackendRule extends $pb.GeneratedMessage {
  factory BackendRule({
    $core.String? selector,
    $core.String? address,
    $core.double? deadline,
  @$core.Deprecated('This field is deprecated.')
    $core.double? minDeadline,
    $core.double? operationDeadline,
    BackendRule_PathTranslation? pathTranslation,
    $core.String? jwtAudience,
    $core.bool? disableAuth,
    $core.String? protocol,
    $core.Iterable<$core.MapEntry<$core.String, BackendRule>>? overridesByRequestProtocol,
  }) {
    final result = create();
    if (selector != null) result.selector = selector;
    if (address != null) result.address = address;
    if (deadline != null) result.deadline = deadline;
    if (minDeadline != null) result.minDeadline = minDeadline;
    if (operationDeadline != null) result.operationDeadline = operationDeadline;
    if (pathTranslation != null) result.pathTranslation = pathTranslation;
    if (jwtAudience != null) result.jwtAudience = jwtAudience;
    if (disableAuth != null) result.disableAuth = disableAuth;
    if (protocol != null) result.protocol = protocol;
    if (overridesByRequestProtocol != null) result.overridesByRequestProtocol.addEntries(overridesByRequestProtocol);
    return result;
  }

  BackendRule._();

  factory BackendRule.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory BackendRule.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, BackendRule_Authentication> _BackendRule_AuthenticationByTag = {
    7 : BackendRule_Authentication.jwtAudience,
    8 : BackendRule_Authentication.disableAuth,
    0 : BackendRule_Authentication.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BackendRule', package: const $pb.PackageName(_omitMessageNames ? '' : 'google.api'), createEmptyInstance: create)
    ..oo(0, [7, 8])
    ..aOS(1, _omitFieldNames ? '' : 'selector')
    ..aOS(2, _omitFieldNames ? '' : 'address')
    ..a<$core.double>(3, _omitFieldNames ? '' : 'deadline', $pb.PbFieldType.OD)
    ..a<$core.double>(4, _omitFieldNames ? '' : 'minDeadline', $pb.PbFieldType.OD)
    ..a<$core.double>(5, _omitFieldNames ? '' : 'operationDeadline', $pb.PbFieldType.OD)
    ..e<BackendRule_PathTranslation>(6, _omitFieldNames ? '' : 'pathTranslation', $pb.PbFieldType.OE, defaultOrMaker: BackendRule_PathTranslation.PATH_TRANSLATION_UNSPECIFIED, valueOf: BackendRule_PathTranslation.valueOf, enumValues: BackendRule_PathTranslation.values)
    ..aOS(7, _omitFieldNames ? '' : 'jwtAudience')
    ..aOB(8, _omitFieldNames ? '' : 'disableAuth')
    ..aOS(9, _omitFieldNames ? '' : 'protocol')
    ..m<$core.String, BackendRule>(10, _omitFieldNames ? '' : 'overridesByRequestProtocol', entryClassName: 'BackendRule.OverridesByRequestProtocolEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: BackendRule.create, valueDefaultOrMaker: BackendRule.getDefault, packageName: const $pb.PackageName('google.api'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BackendRule clone() => BackendRule()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BackendRule copyWith(void Function(BackendRule) updates) => super.copyWith((message) => updates(message as BackendRule)) as BackendRule;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BackendRule create() => BackendRule._();
  @$core.override
  BackendRule createEmptyInstance() => create();
  static $pb.PbList<BackendRule> createRepeated() => $pb.PbList<BackendRule>();
  @$core.pragma('dart2js:noInline')
  static BackendRule getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BackendRule>(create);
  static BackendRule? _defaultInstance;

  BackendRule_Authentication whichAuthentication() => _BackendRule_AuthenticationByTag[$_whichOneof(0)]!;
  void clearAuthentication() => $_clearField($_whichOneof(0));

  /// Selects the methods to which this rule applies.
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

  /// The address of the API backend.
  ///
  /// The scheme is used to determine the backend protocol and security.
  /// The following schemes are accepted:
  ///
  ///    SCHEME        PROTOCOL    SECURITY
  ///    http://       HTTP        None
  ///    https://      HTTP        TLS
  ///    grpc://       gRPC        None
  ///    grpcs://      gRPC        TLS
  ///
  /// It is recommended to explicitly include a scheme. Leaving out the scheme
  /// may cause constrasting behaviors across platforms.
  ///
  /// If the port is unspecified, the default is:
  /// - 80 for schemes without TLS
  /// - 443 for schemes with TLS
  ///
  /// For HTTP backends, use [protocol][google.api.BackendRule.protocol]
  /// to specify the protocol version.
  @$pb.TagNumber(2)
  $core.String get address => $_getSZ(1);
  @$pb.TagNumber(2)
  set address($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearAddress() => $_clearField(2);

  /// The number of seconds to wait for a response from a request. The default
  /// varies based on the request protocol and deployment environment.
  @$pb.TagNumber(3)
  $core.double get deadline => $_getN(2);
  @$pb.TagNumber(3)
  set deadline($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDeadline() => $_has(2);
  @$pb.TagNumber(3)
  void clearDeadline() => $_clearField(3);

  /// Deprecated, do not use.
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  $core.double get minDeadline => $_getN(3);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  set minDeadline($core.double value) => $_setDouble(3, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  $core.bool hasMinDeadline() => $_has(3);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(4)
  void clearMinDeadline() => $_clearField(4);

  /// The number of seconds to wait for the completion of a long running
  /// operation. The default is no deadline.
  @$pb.TagNumber(5)
  $core.double get operationDeadline => $_getN(4);
  @$pb.TagNumber(5)
  set operationDeadline($core.double value) => $_setDouble(4, value);
  @$pb.TagNumber(5)
  $core.bool hasOperationDeadline() => $_has(4);
  @$pb.TagNumber(5)
  void clearOperationDeadline() => $_clearField(5);

  @$pb.TagNumber(6)
  BackendRule_PathTranslation get pathTranslation => $_getN(5);
  @$pb.TagNumber(6)
  set pathTranslation(BackendRule_PathTranslation value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasPathTranslation() => $_has(5);
  @$pb.TagNumber(6)
  void clearPathTranslation() => $_clearField(6);

  /// The JWT audience is used when generating a JWT ID token for the backend.
  /// This ID token will be added in the HTTP "authorization" header, and sent
  /// to the backend.
  @$pb.TagNumber(7)
  $core.String get jwtAudience => $_getSZ(6);
  @$pb.TagNumber(7)
  set jwtAudience($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasJwtAudience() => $_has(6);
  @$pb.TagNumber(7)
  void clearJwtAudience() => $_clearField(7);

  /// When disable_auth is true, a JWT ID token won't be generated and the
  /// original "Authorization" HTTP header will be preserved. If the header is
  /// used to carry the original token and is expected by the backend, this
  /// field must be set to true to preserve the header.
  @$pb.TagNumber(8)
  $core.bool get disableAuth => $_getBF(7);
  @$pb.TagNumber(8)
  set disableAuth($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasDisableAuth() => $_has(7);
  @$pb.TagNumber(8)
  void clearDisableAuth() => $_clearField(8);

  /// The protocol used for sending a request to the backend.
  /// The supported values are "http/1.1" and "h2".
  ///
  /// The default value is inferred from the scheme in the
  /// [address][google.api.BackendRule.address] field:
  ///
  ///    SCHEME        PROTOCOL
  ///    http://       http/1.1
  ///    https://      http/1.1
  ///    grpc://       h2
  ///    grpcs://      h2
  ///
  /// For secure HTTP backends (https://) that support HTTP/2, set this field
  /// to "h2" for improved performance.
  ///
  /// Configuring this field to non-default values is only supported for secure
  /// HTTP backends. This field will be ignored for all other backends.
  ///
  /// See
  /// https://www.iana.org/assignments/tls-extensiontype-values/tls-extensiontype-values.xhtml#alpn-protocol-ids
  /// for more details on the supported values.
  @$pb.TagNumber(9)
  $core.String get protocol => $_getSZ(8);
  @$pb.TagNumber(9)
  set protocol($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasProtocol() => $_has(8);
  @$pb.TagNumber(9)
  void clearProtocol() => $_clearField(9);

  /// The map between request protocol and the backend address.
  @$pb.TagNumber(10)
  $pb.PbMap<$core.String, BackendRule> get overridesByRequestProtocol => $_getMap(9);
}


const $core.bool _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
