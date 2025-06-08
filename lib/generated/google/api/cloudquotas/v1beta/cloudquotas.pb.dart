//
//  Generated code. Do not modify.
//  source: google/api/cloudquotas/v1beta/cloudquotas.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../protobuf/field_mask.pb.dart' as $21;
import 'resources.pb.dart' as $6;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// Message for requesting list of QuotaInfos
class ListQuotaInfosRequest extends $pb.GeneratedMessage {
  factory ListQuotaInfosRequest({
    $core.String? parent,
    $core.int? pageSize,
    $core.String? pageToken,
  }) {
    final result = create();
    if (parent != null) result.parent = parent;
    if (pageSize != null) result.pageSize = pageSize;
    if (pageToken != null) result.pageToken = pageToken;
    return result;
  }

  ListQuotaInfosRequest._();

  factory ListQuotaInfosRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory ListQuotaInfosRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListQuotaInfosRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'google.api.cloudquotas.v1beta'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'parent')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..aOS(3, _omitFieldNames ? '' : 'pageToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListQuotaInfosRequest clone() => ListQuotaInfosRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListQuotaInfosRequest copyWith(void Function(ListQuotaInfosRequest) updates) => super.copyWith((message) => updates(message as ListQuotaInfosRequest)) as ListQuotaInfosRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListQuotaInfosRequest create() => ListQuotaInfosRequest._();
  @$core.override
  ListQuotaInfosRequest createEmptyInstance() => create();
  static $pb.PbList<ListQuotaInfosRequest> createRepeated() => $pb.PbList<ListQuotaInfosRequest>();
  @$core.pragma('dart2js:noInline')
  static ListQuotaInfosRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListQuotaInfosRequest>(create);
  static ListQuotaInfosRequest? _defaultInstance;

  /// Required. Parent value of QuotaInfo resources.
  /// Listing across different resource containers (such as 'projects/-') is not
  /// allowed.
  ///
  /// Example names:
  /// `projects/123/locations/global/services/compute.googleapis.com`
  /// `folders/234/locations/global/services/compute.googleapis.com`
  /// `organizations/345/locations/global/services/compute.googleapis.com`
  @$pb.TagNumber(1)
  $core.String get parent => $_getSZ(0);
  @$pb.TagNumber(1)
  set parent($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasParent() => $_has(0);
  @$pb.TagNumber(1)
  void clearParent() => $_clearField(1);

  /// Optional. Requested page size. Server may return fewer items than
  /// requested. If unspecified, server will pick an appropriate default.
  @$pb.TagNumber(2)
  $core.int get pageSize => $_getIZ(1);
  @$pb.TagNumber(2)
  set pageSize($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPageSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageSize() => $_clearField(2);

  /// Optional. A token identifying a page of results the server should return.
  @$pb.TagNumber(3)
  $core.String get pageToken => $_getSZ(2);
  @$pb.TagNumber(3)
  set pageToken($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPageToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearPageToken() => $_clearField(3);
}

/// Message for response to listing QuotaInfos
class ListQuotaInfosResponse extends $pb.GeneratedMessage {
  factory ListQuotaInfosResponse({
    $core.Iterable<$6.QuotaInfo>? quotaInfos,
    $core.String? nextPageToken,
  }) {
    final result = create();
    if (quotaInfos != null) result.quotaInfos.addAll(quotaInfos);
    if (nextPageToken != null) result.nextPageToken = nextPageToken;
    return result;
  }

  ListQuotaInfosResponse._();

  factory ListQuotaInfosResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory ListQuotaInfosResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListQuotaInfosResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'google.api.cloudquotas.v1beta'), createEmptyInstance: create)
    ..pc<$6.QuotaInfo>(1, _omitFieldNames ? '' : 'quotaInfos', $pb.PbFieldType.PM, subBuilder: $6.QuotaInfo.create)
    ..aOS(2, _omitFieldNames ? '' : 'nextPageToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListQuotaInfosResponse clone() => ListQuotaInfosResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListQuotaInfosResponse copyWith(void Function(ListQuotaInfosResponse) updates) => super.copyWith((message) => updates(message as ListQuotaInfosResponse)) as ListQuotaInfosResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListQuotaInfosResponse create() => ListQuotaInfosResponse._();
  @$core.override
  ListQuotaInfosResponse createEmptyInstance() => create();
  static $pb.PbList<ListQuotaInfosResponse> createRepeated() => $pb.PbList<ListQuotaInfosResponse>();
  @$core.pragma('dart2js:noInline')
  static ListQuotaInfosResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListQuotaInfosResponse>(create);
  static ListQuotaInfosResponse? _defaultInstance;

  /// The list of QuotaInfo
  @$pb.TagNumber(1)
  $pb.PbList<$6.QuotaInfo> get quotaInfos => $_getList(0);

  /// A token, which can be sent as `page_token` to retrieve the next page.
  /// If this field is omitted, there are no subsequent pages.
  @$pb.TagNumber(2)
  $core.String get nextPageToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set nextPageToken($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNextPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextPageToken() => $_clearField(2);
}

/// Message for getting a QuotaInfo
class GetQuotaInfoRequest extends $pb.GeneratedMessage {
  factory GetQuotaInfoRequest({
    $core.String? name,
  }) {
    final result = create();
    if (name != null) result.name = name;
    return result;
  }

  GetQuotaInfoRequest._();

  factory GetQuotaInfoRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory GetQuotaInfoRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetQuotaInfoRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'google.api.cloudquotas.v1beta'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetQuotaInfoRequest clone() => GetQuotaInfoRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetQuotaInfoRequest copyWith(void Function(GetQuotaInfoRequest) updates) => super.copyWith((message) => updates(message as GetQuotaInfoRequest)) as GetQuotaInfoRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetQuotaInfoRequest create() => GetQuotaInfoRequest._();
  @$core.override
  GetQuotaInfoRequest createEmptyInstance() => create();
  static $pb.PbList<GetQuotaInfoRequest> createRepeated() => $pb.PbList<GetQuotaInfoRequest>();
  @$core.pragma('dart2js:noInline')
  static GetQuotaInfoRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetQuotaInfoRequest>(create);
  static GetQuotaInfoRequest? _defaultInstance;

  /// Required. The resource name of the quota info.
  ///
  /// An example name:
  /// `projects/123/locations/global/services/compute.googleapis.com/quotaInfos/CpusPerProjectPerRegion`
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);
}

/// Message for requesting list of QuotaPreferences
class ListQuotaPreferencesRequest extends $pb.GeneratedMessage {
  factory ListQuotaPreferencesRequest({
    $core.String? parent,
    $core.int? pageSize,
    $core.String? pageToken,
    $core.String? filter,
    $core.String? orderBy,
  }) {
    final result = create();
    if (parent != null) result.parent = parent;
    if (pageSize != null) result.pageSize = pageSize;
    if (pageToken != null) result.pageToken = pageToken;
    if (filter != null) result.filter = filter;
    if (orderBy != null) result.orderBy = orderBy;
    return result;
  }

  ListQuotaPreferencesRequest._();

  factory ListQuotaPreferencesRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory ListQuotaPreferencesRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListQuotaPreferencesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'google.api.cloudquotas.v1beta'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'parent')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..aOS(3, _omitFieldNames ? '' : 'pageToken')
    ..aOS(4, _omitFieldNames ? '' : 'filter')
    ..aOS(5, _omitFieldNames ? '' : 'orderBy')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListQuotaPreferencesRequest clone() => ListQuotaPreferencesRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListQuotaPreferencesRequest copyWith(void Function(ListQuotaPreferencesRequest) updates) => super.copyWith((message) => updates(message as ListQuotaPreferencesRequest)) as ListQuotaPreferencesRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListQuotaPreferencesRequest create() => ListQuotaPreferencesRequest._();
  @$core.override
  ListQuotaPreferencesRequest createEmptyInstance() => create();
  static $pb.PbList<ListQuotaPreferencesRequest> createRepeated() => $pb.PbList<ListQuotaPreferencesRequest>();
  @$core.pragma('dart2js:noInline')
  static ListQuotaPreferencesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListQuotaPreferencesRequest>(create);
  static ListQuotaPreferencesRequest? _defaultInstance;

  /// Required. Parent value of QuotaPreference resources.
  /// Listing across different resource containers (such as 'projects/-') is not
  /// allowed.
  ///
  /// When the value starts with 'folders' or 'organizations', it lists the
  /// QuotaPreferences for org quotas in the container. It does not list the
  /// QuotaPreferences in the descendant projects of the container.
  ///
  /// Example parents:
  /// `projects/123/locations/global`
  @$pb.TagNumber(1)
  $core.String get parent => $_getSZ(0);
  @$pb.TagNumber(1)
  set parent($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasParent() => $_has(0);
  @$pb.TagNumber(1)
  void clearParent() => $_clearField(1);

  /// Optional. Requested page size. Server may return fewer items than
  /// requested. If unspecified, server will pick an appropriate default.
  @$pb.TagNumber(2)
  $core.int get pageSize => $_getIZ(1);
  @$pb.TagNumber(2)
  set pageSize($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPageSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageSize() => $_clearField(2);

  /// Optional. A token identifying a page of results the server should return.
  @$pb.TagNumber(3)
  $core.String get pageToken => $_getSZ(2);
  @$pb.TagNumber(3)
  set pageToken($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPageToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearPageToken() => $_clearField(3);

  /// Optional. Filter result QuotaPreferences by their state, type,
  /// create/update time range.
  ///
  /// Example filters:
  /// `reconciling=true AND request_type=CLOUD_CONSOLE`,
  /// `reconciling=true OR creation_time>2022-12-03T10:30:00`
  @$pb.TagNumber(4)
  $core.String get filter => $_getSZ(3);
  @$pb.TagNumber(4)
  set filter($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasFilter() => $_has(3);
  @$pb.TagNumber(4)
  void clearFilter() => $_clearField(4);

  /// Optional. How to order of the results. By default, the results are ordered
  /// by create time.
  ///
  /// Example orders:
  /// `quota_id`,
  /// `service, create_time`
  @$pb.TagNumber(5)
  $core.String get orderBy => $_getSZ(4);
  @$pb.TagNumber(5)
  set orderBy($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasOrderBy() => $_has(4);
  @$pb.TagNumber(5)
  void clearOrderBy() => $_clearField(5);
}

/// Message for response to listing QuotaPreferences
class ListQuotaPreferencesResponse extends $pb.GeneratedMessage {
  factory ListQuotaPreferencesResponse({
    $core.Iterable<$6.QuotaPreference>? quotaPreferences,
    $core.String? nextPageToken,
    $core.Iterable<$core.String>? unreachable,
  }) {
    final result = create();
    if (quotaPreferences != null) result.quotaPreferences.addAll(quotaPreferences);
    if (nextPageToken != null) result.nextPageToken = nextPageToken;
    if (unreachable != null) result.unreachable.addAll(unreachable);
    return result;
  }

  ListQuotaPreferencesResponse._();

  factory ListQuotaPreferencesResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory ListQuotaPreferencesResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListQuotaPreferencesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'google.api.cloudquotas.v1beta'), createEmptyInstance: create)
    ..pc<$6.QuotaPreference>(1, _omitFieldNames ? '' : 'quotaPreferences', $pb.PbFieldType.PM, subBuilder: $6.QuotaPreference.create)
    ..aOS(2, _omitFieldNames ? '' : 'nextPageToken')
    ..pPS(3, _omitFieldNames ? '' : 'unreachable')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListQuotaPreferencesResponse clone() => ListQuotaPreferencesResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListQuotaPreferencesResponse copyWith(void Function(ListQuotaPreferencesResponse) updates) => super.copyWith((message) => updates(message as ListQuotaPreferencesResponse)) as ListQuotaPreferencesResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListQuotaPreferencesResponse create() => ListQuotaPreferencesResponse._();
  @$core.override
  ListQuotaPreferencesResponse createEmptyInstance() => create();
  static $pb.PbList<ListQuotaPreferencesResponse> createRepeated() => $pb.PbList<ListQuotaPreferencesResponse>();
  @$core.pragma('dart2js:noInline')
  static ListQuotaPreferencesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListQuotaPreferencesResponse>(create);
  static ListQuotaPreferencesResponse? _defaultInstance;

  /// The list of QuotaPreference
  @$pb.TagNumber(1)
  $pb.PbList<$6.QuotaPreference> get quotaPreferences => $_getList(0);

  /// A token, which can be sent as `page_token` to retrieve the next page.
  /// If this field is omitted, there are no subsequent pages.
  @$pb.TagNumber(2)
  $core.String get nextPageToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set nextPageToken($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNextPageToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextPageToken() => $_clearField(2);

  /// Locations that could not be reached.
  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get unreachable => $_getList(2);
}

/// Message for getting a QuotaPreference
class GetQuotaPreferenceRequest extends $pb.GeneratedMessage {
  factory GetQuotaPreferenceRequest({
    $core.String? name,
  }) {
    final result = create();
    if (name != null) result.name = name;
    return result;
  }

  GetQuotaPreferenceRequest._();

  factory GetQuotaPreferenceRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory GetQuotaPreferenceRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetQuotaPreferenceRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'google.api.cloudquotas.v1beta'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetQuotaPreferenceRequest clone() => GetQuotaPreferenceRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetQuotaPreferenceRequest copyWith(void Function(GetQuotaPreferenceRequest) updates) => super.copyWith((message) => updates(message as GetQuotaPreferenceRequest)) as GetQuotaPreferenceRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetQuotaPreferenceRequest create() => GetQuotaPreferenceRequest._();
  @$core.override
  GetQuotaPreferenceRequest createEmptyInstance() => create();
  static $pb.PbList<GetQuotaPreferenceRequest> createRepeated() => $pb.PbList<GetQuotaPreferenceRequest>();
  @$core.pragma('dart2js:noInline')
  static GetQuotaPreferenceRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetQuotaPreferenceRequest>(create);
  static GetQuotaPreferenceRequest? _defaultInstance;

  /// Required. Name of the resource
  ///
  /// Example name:
  /// `projects/123/locations/global/quota_preferences/my-config-for-us-east1`
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);
}

/// Message for creating a QuotaPreference
class CreateQuotaPreferenceRequest extends $pb.GeneratedMessage {
  factory CreateQuotaPreferenceRequest({
    $core.String? parent,
    $core.String? quotaPreferenceId,
    $6.QuotaPreference? quotaPreference,
    $core.Iterable<$6.QuotaSafetyCheck>? ignoreSafetyChecks,
  }) {
    final result = create();
    if (parent != null) result.parent = parent;
    if (quotaPreferenceId != null) result.quotaPreferenceId = quotaPreferenceId;
    if (quotaPreference != null) result.quotaPreference = quotaPreference;
    if (ignoreSafetyChecks != null) result.ignoreSafetyChecks.addAll(ignoreSafetyChecks);
    return result;
  }

  CreateQuotaPreferenceRequest._();

  factory CreateQuotaPreferenceRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory CreateQuotaPreferenceRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateQuotaPreferenceRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'google.api.cloudquotas.v1beta'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'parent')
    ..aOS(2, _omitFieldNames ? '' : 'quotaPreferenceId')
    ..aOM<$6.QuotaPreference>(3, _omitFieldNames ? '' : 'quotaPreference', subBuilder: $6.QuotaPreference.create)
    ..pc<$6.QuotaSafetyCheck>(4, _omitFieldNames ? '' : 'ignoreSafetyChecks', $pb.PbFieldType.KE, valueOf: $6.QuotaSafetyCheck.valueOf, enumValues: $6.QuotaSafetyCheck.values, defaultEnumValue: $6.QuotaSafetyCheck.QUOTA_SAFETY_CHECK_UNSPECIFIED)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateQuotaPreferenceRequest clone() => CreateQuotaPreferenceRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateQuotaPreferenceRequest copyWith(void Function(CreateQuotaPreferenceRequest) updates) => super.copyWith((message) => updates(message as CreateQuotaPreferenceRequest)) as CreateQuotaPreferenceRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateQuotaPreferenceRequest create() => CreateQuotaPreferenceRequest._();
  @$core.override
  CreateQuotaPreferenceRequest createEmptyInstance() => create();
  static $pb.PbList<CreateQuotaPreferenceRequest> createRepeated() => $pb.PbList<CreateQuotaPreferenceRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateQuotaPreferenceRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateQuotaPreferenceRequest>(create);
  static CreateQuotaPreferenceRequest? _defaultInstance;

  /// Required. Value for parent.
  ///
  /// Example:
  /// `projects/123/locations/global`
  @$pb.TagNumber(1)
  $core.String get parent => $_getSZ(0);
  @$pb.TagNumber(1)
  set parent($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasParent() => $_has(0);
  @$pb.TagNumber(1)
  void clearParent() => $_clearField(1);

  /// Optional. Id of the requesting object, must be unique under its parent.
  /// If client does not set this field, the service will generate one.
  @$pb.TagNumber(2)
  $core.String get quotaPreferenceId => $_getSZ(1);
  @$pb.TagNumber(2)
  set quotaPreferenceId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasQuotaPreferenceId() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuotaPreferenceId() => $_clearField(2);

  /// Required. The resource being created
  @$pb.TagNumber(3)
  $6.QuotaPreference get quotaPreference => $_getN(2);
  @$pb.TagNumber(3)
  set quotaPreference($6.QuotaPreference value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasQuotaPreference() => $_has(2);
  @$pb.TagNumber(3)
  void clearQuotaPreference() => $_clearField(3);
  @$pb.TagNumber(3)
  $6.QuotaPreference ensureQuotaPreference() => $_ensure(2);

  /// The list of quota safety checks to be ignored.
  @$pb.TagNumber(4)
  $pb.PbList<$6.QuotaSafetyCheck> get ignoreSafetyChecks => $_getList(3);
}

/// Message for updating a QuotaPreference
class UpdateQuotaPreferenceRequest extends $pb.GeneratedMessage {
  factory UpdateQuotaPreferenceRequest({
    $21.FieldMask? updateMask,
    $6.QuotaPreference? quotaPreference,
    $core.bool? allowMissing,
    $core.bool? validateOnly,
    $core.Iterable<$6.QuotaSafetyCheck>? ignoreSafetyChecks,
  }) {
    final result = create();
    if (updateMask != null) result.updateMask = updateMask;
    if (quotaPreference != null) result.quotaPreference = quotaPreference;
    if (allowMissing != null) result.allowMissing = allowMissing;
    if (validateOnly != null) result.validateOnly = validateOnly;
    if (ignoreSafetyChecks != null) result.ignoreSafetyChecks.addAll(ignoreSafetyChecks);
    return result;
  }

  UpdateQuotaPreferenceRequest._();

  factory UpdateQuotaPreferenceRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory UpdateQuotaPreferenceRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateQuotaPreferenceRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'google.api.cloudquotas.v1beta'), createEmptyInstance: create)
    ..aOM<$21.FieldMask>(1, _omitFieldNames ? '' : 'updateMask', subBuilder: $21.FieldMask.create)
    ..aOM<$6.QuotaPreference>(2, _omitFieldNames ? '' : 'quotaPreference', subBuilder: $6.QuotaPreference.create)
    ..aOB(3, _omitFieldNames ? '' : 'allowMissing')
    ..aOB(4, _omitFieldNames ? '' : 'validateOnly')
    ..pc<$6.QuotaSafetyCheck>(5, _omitFieldNames ? '' : 'ignoreSafetyChecks', $pb.PbFieldType.KE, valueOf: $6.QuotaSafetyCheck.valueOf, enumValues: $6.QuotaSafetyCheck.values, defaultEnumValue: $6.QuotaSafetyCheck.QUOTA_SAFETY_CHECK_UNSPECIFIED)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateQuotaPreferenceRequest clone() => UpdateQuotaPreferenceRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateQuotaPreferenceRequest copyWith(void Function(UpdateQuotaPreferenceRequest) updates) => super.copyWith((message) => updates(message as UpdateQuotaPreferenceRequest)) as UpdateQuotaPreferenceRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateQuotaPreferenceRequest create() => UpdateQuotaPreferenceRequest._();
  @$core.override
  UpdateQuotaPreferenceRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateQuotaPreferenceRequest> createRepeated() => $pb.PbList<UpdateQuotaPreferenceRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateQuotaPreferenceRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateQuotaPreferenceRequest>(create);
  static UpdateQuotaPreferenceRequest? _defaultInstance;

  /// Optional. Field mask is used to specify the fields to be overwritten in the
  /// QuotaPreference resource by the update.
  /// The fields specified in the update_mask are relative to the resource, not
  /// the full request. A field will be overwritten if it is in the mask. If the
  /// user does not provide a mask then all fields will be overwritten.
  @$pb.TagNumber(1)
  $21.FieldMask get updateMask => $_getN(0);
  @$pb.TagNumber(1)
  set updateMask($21.FieldMask value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasUpdateMask() => $_has(0);
  @$pb.TagNumber(1)
  void clearUpdateMask() => $_clearField(1);
  @$pb.TagNumber(1)
  $21.FieldMask ensureUpdateMask() => $_ensure(0);

  /// Required. The resource being updated
  @$pb.TagNumber(2)
  $6.QuotaPreference get quotaPreference => $_getN(1);
  @$pb.TagNumber(2)
  set quotaPreference($6.QuotaPreference value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasQuotaPreference() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuotaPreference() => $_clearField(2);
  @$pb.TagNumber(2)
  $6.QuotaPreference ensureQuotaPreference() => $_ensure(1);

  /// Optional. If set to true, and the quota preference is not found, a new one
  /// will be created. In this situation, `update_mask` is ignored.
  @$pb.TagNumber(3)
  $core.bool get allowMissing => $_getBF(2);
  @$pb.TagNumber(3)
  set allowMissing($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAllowMissing() => $_has(2);
  @$pb.TagNumber(3)
  void clearAllowMissing() => $_clearField(3);

  /// Optional. If set to true, validate the request, but do not actually update.
  /// Note that a request being valid does not mean that the request is
  /// guaranteed to be fulfilled.
  @$pb.TagNumber(4)
  $core.bool get validateOnly => $_getBF(3);
  @$pb.TagNumber(4)
  set validateOnly($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasValidateOnly() => $_has(3);
  @$pb.TagNumber(4)
  void clearValidateOnly() => $_clearField(4);

  /// The list of quota safety checks to be ignored.
  @$pb.TagNumber(5)
  $pb.PbList<$6.QuotaSafetyCheck> get ignoreSafetyChecks => $_getList(4);
}


const $core.bool _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
