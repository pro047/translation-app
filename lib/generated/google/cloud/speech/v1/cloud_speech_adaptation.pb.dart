//
//  Generated code. Do not modify.
//  source: google/cloud/speech/v1/cloud_speech_adaptation.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../protobuf/field_mask.pb.dart' as $9;
import 'resource.pb.dart' as $3;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// Message sent by the client for the `CreatePhraseSet` method.
class CreatePhraseSetRequest extends $pb.GeneratedMessage {
  factory CreatePhraseSetRequest({
    $core.String? parent,
    $core.String? phraseSetId,
    $3.PhraseSet? phraseSet,
  }) {
    final result = create();
    if (parent != null) result.parent = parent;
    if (phraseSetId != null) result.phraseSetId = phraseSetId;
    if (phraseSet != null) result.phraseSet = phraseSet;
    return result;
  }

  CreatePhraseSetRequest._();

  factory CreatePhraseSetRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory CreatePhraseSetRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreatePhraseSetRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'google.cloud.speech.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'parent')
    ..aOS(2, _omitFieldNames ? '' : 'phraseSetId')
    ..aOM<$3.PhraseSet>(3, _omitFieldNames ? '' : 'phraseSet', subBuilder: $3.PhraseSet.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreatePhraseSetRequest clone() => CreatePhraseSetRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreatePhraseSetRequest copyWith(void Function(CreatePhraseSetRequest) updates) => super.copyWith((message) => updates(message as CreatePhraseSetRequest)) as CreatePhraseSetRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePhraseSetRequest create() => CreatePhraseSetRequest._();
  @$core.override
  CreatePhraseSetRequest createEmptyInstance() => create();
  static $pb.PbList<CreatePhraseSetRequest> createRepeated() => $pb.PbList<CreatePhraseSetRequest>();
  @$core.pragma('dart2js:noInline')
  static CreatePhraseSetRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePhraseSetRequest>(create);
  static CreatePhraseSetRequest? _defaultInstance;

  /// Required. The parent resource where this phrase set will be created.
  /// Format:
  ///
  /// `projects/{project}/locations/{location}`
  ///
  /// Speech-to-Text supports three locations: `global`, `us` (US North America),
  /// and `eu` (Europe). If you are calling the `speech.googleapis.com`
  /// endpoint, use the `global` location. To specify a region, use a
  /// [regional endpoint](https://cloud.google.com/speech-to-text/docs/endpoints)
  /// with matching `us` or `eu` location value.
  @$pb.TagNumber(1)
  $core.String get parent => $_getSZ(0);
  @$pb.TagNumber(1)
  set parent($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasParent() => $_has(0);
  @$pb.TagNumber(1)
  void clearParent() => $_clearField(1);

  /// Required. The ID to use for the phrase set, which will become the final
  /// component of the phrase set's resource name.
  ///
  /// This value should restrict to letters, numbers, and hyphens, with the first
  /// character a letter, the last a letter or a number, and be 4-63 characters.
  @$pb.TagNumber(2)
  $core.String get phraseSetId => $_getSZ(1);
  @$pb.TagNumber(2)
  set phraseSetId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPhraseSetId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPhraseSetId() => $_clearField(2);

  /// Required. The phrase set to create.
  @$pb.TagNumber(3)
  $3.PhraseSet get phraseSet => $_getN(2);
  @$pb.TagNumber(3)
  set phraseSet($3.PhraseSet value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasPhraseSet() => $_has(2);
  @$pb.TagNumber(3)
  void clearPhraseSet() => $_clearField(3);
  @$pb.TagNumber(3)
  $3.PhraseSet ensurePhraseSet() => $_ensure(2);
}

/// Message sent by the client for the `UpdatePhraseSet` method.
class UpdatePhraseSetRequest extends $pb.GeneratedMessage {
  factory UpdatePhraseSetRequest({
    $3.PhraseSet? phraseSet,
    $9.FieldMask? updateMask,
  }) {
    final result = create();
    if (phraseSet != null) result.phraseSet = phraseSet;
    if (updateMask != null) result.updateMask = updateMask;
    return result;
  }

  UpdatePhraseSetRequest._();

  factory UpdatePhraseSetRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory UpdatePhraseSetRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdatePhraseSetRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'google.cloud.speech.v1'), createEmptyInstance: create)
    ..aOM<$3.PhraseSet>(1, _omitFieldNames ? '' : 'phraseSet', subBuilder: $3.PhraseSet.create)
    ..aOM<$9.FieldMask>(2, _omitFieldNames ? '' : 'updateMask', subBuilder: $9.FieldMask.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdatePhraseSetRequest clone() => UpdatePhraseSetRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdatePhraseSetRequest copyWith(void Function(UpdatePhraseSetRequest) updates) => super.copyWith((message) => updates(message as UpdatePhraseSetRequest)) as UpdatePhraseSetRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdatePhraseSetRequest create() => UpdatePhraseSetRequest._();
  @$core.override
  UpdatePhraseSetRequest createEmptyInstance() => create();
  static $pb.PbList<UpdatePhraseSetRequest> createRepeated() => $pb.PbList<UpdatePhraseSetRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdatePhraseSetRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePhraseSetRequest>(create);
  static UpdatePhraseSetRequest? _defaultInstance;

  /// Required. The phrase set to update.
  ///
  /// The phrase set's `name` field is used to identify the set to be
  /// updated. Format:
  ///
  /// `projects/{project}/locations/{location}/phraseSets/{phrase_set}`
  ///
  /// Speech-to-Text supports three locations: `global`, `us` (US North America),
  /// and `eu` (Europe). If you are calling the `speech.googleapis.com`
  /// endpoint, use the `global` location. To specify a region, use a
  /// [regional endpoint](https://cloud.google.com/speech-to-text/docs/endpoints)
  /// with matching `us` or `eu` location value.
  @$pb.TagNumber(1)
  $3.PhraseSet get phraseSet => $_getN(0);
  @$pb.TagNumber(1)
  set phraseSet($3.PhraseSet value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPhraseSet() => $_has(0);
  @$pb.TagNumber(1)
  void clearPhraseSet() => $_clearField(1);
  @$pb.TagNumber(1)
  $3.PhraseSet ensurePhraseSet() => $_ensure(0);

  /// The list of fields to be updated.
  @$pb.TagNumber(2)
  $9.FieldMask get updateMask => $_getN(1);
  @$pb.TagNumber(2)
  set updateMask($9.FieldMask value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasUpdateMask() => $_has(1);
  @$pb.TagNumber(2)
  void clearUpdateMask() => $_clearField(2);
  @$pb.TagNumber(2)
  $9.FieldMask ensureUpdateMask() => $_ensure(1);
}

/// Message sent by the client for the `GetPhraseSet` method.
class GetPhraseSetRequest extends $pb.GeneratedMessage {
  factory GetPhraseSetRequest({
    $core.String? name,
  }) {
    final result = create();
    if (name != null) result.name = name;
    return result;
  }

  GetPhraseSetRequest._();

  factory GetPhraseSetRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory GetPhraseSetRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPhraseSetRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'google.cloud.speech.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPhraseSetRequest clone() => GetPhraseSetRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPhraseSetRequest copyWith(void Function(GetPhraseSetRequest) updates) => super.copyWith((message) => updates(message as GetPhraseSetRequest)) as GetPhraseSetRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPhraseSetRequest create() => GetPhraseSetRequest._();
  @$core.override
  GetPhraseSetRequest createEmptyInstance() => create();
  static $pb.PbList<GetPhraseSetRequest> createRepeated() => $pb.PbList<GetPhraseSetRequest>();
  @$core.pragma('dart2js:noInline')
  static GetPhraseSetRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPhraseSetRequest>(create);
  static GetPhraseSetRequest? _defaultInstance;

  /// Required. The name of the phrase set to retrieve. Format:
  ///
  /// `projects/{project}/locations/{location}/phraseSets/{phrase_set}`
  ///
  /// Speech-to-Text supports three locations: `global`, `us` (US North America),
  /// and `eu` (Europe). If you are calling the `speech.googleapis.com`
  /// endpoint, use the `global` location. To specify a region, use a
  /// [regional endpoint](https://cloud.google.com/speech-to-text/docs/endpoints)
  /// with matching `us` or `eu` location value.
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);
}

/// Message sent by the client for the `ListPhraseSet` method.
class ListPhraseSetRequest extends $pb.GeneratedMessage {
  factory ListPhraseSetRequest({
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

  ListPhraseSetRequest._();

  factory ListPhraseSetRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory ListPhraseSetRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListPhraseSetRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'google.cloud.speech.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'parent')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..aOS(3, _omitFieldNames ? '' : 'pageToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListPhraseSetRequest clone() => ListPhraseSetRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListPhraseSetRequest copyWith(void Function(ListPhraseSetRequest) updates) => super.copyWith((message) => updates(message as ListPhraseSetRequest)) as ListPhraseSetRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListPhraseSetRequest create() => ListPhraseSetRequest._();
  @$core.override
  ListPhraseSetRequest createEmptyInstance() => create();
  static $pb.PbList<ListPhraseSetRequest> createRepeated() => $pb.PbList<ListPhraseSetRequest>();
  @$core.pragma('dart2js:noInline')
  static ListPhraseSetRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListPhraseSetRequest>(create);
  static ListPhraseSetRequest? _defaultInstance;

  /// Required. The parent, which owns this collection of phrase set. Format:
  ///
  /// `projects/{project}/locations/{location}`
  ///
  /// Speech-to-Text supports three locations: `global`, `us` (US North America),
  /// and `eu` (Europe). If you are calling the `speech.googleapis.com`
  /// endpoint, use the `global` location. To specify a region, use a
  /// [regional endpoint](https://cloud.google.com/speech-to-text/docs/endpoints)
  /// with matching `us` or `eu` location value.
  @$pb.TagNumber(1)
  $core.String get parent => $_getSZ(0);
  @$pb.TagNumber(1)
  set parent($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasParent() => $_has(0);
  @$pb.TagNumber(1)
  void clearParent() => $_clearField(1);

  /// The maximum number of phrase sets to return. The service may return
  /// fewer than this value. If unspecified, at most 50 phrase sets will be
  /// returned. The maximum value is 1000; values above 1000 will be coerced to
  /// 1000.
  @$pb.TagNumber(2)
  $core.int get pageSize => $_getIZ(1);
  @$pb.TagNumber(2)
  set pageSize($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPageSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageSize() => $_clearField(2);

  /// A page token, received from a previous `ListPhraseSet` call.
  /// Provide this to retrieve the subsequent page.
  ///
  /// When paginating, all other parameters provided to `ListPhraseSet` must
  /// match the call that provided the page token.
  @$pb.TagNumber(3)
  $core.String get pageToken => $_getSZ(2);
  @$pb.TagNumber(3)
  set pageToken($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPageToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearPageToken() => $_clearField(3);
}

/// Message returned to the client by the `ListPhraseSet` method.
class ListPhraseSetResponse extends $pb.GeneratedMessage {
  factory ListPhraseSetResponse({
    $core.Iterable<$3.PhraseSet>? phraseSets,
    $core.String? nextPageToken,
  }) {
    final result = create();
    if (phraseSets != null) result.phraseSets.addAll(phraseSets);
    if (nextPageToken != null) result.nextPageToken = nextPageToken;
    return result;
  }

  ListPhraseSetResponse._();

  factory ListPhraseSetResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory ListPhraseSetResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListPhraseSetResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'google.cloud.speech.v1'), createEmptyInstance: create)
    ..pc<$3.PhraseSet>(1, _omitFieldNames ? '' : 'phraseSets', $pb.PbFieldType.PM, subBuilder: $3.PhraseSet.create)
    ..aOS(2, _omitFieldNames ? '' : 'nextPageToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListPhraseSetResponse clone() => ListPhraseSetResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListPhraseSetResponse copyWith(void Function(ListPhraseSetResponse) updates) => super.copyWith((message) => updates(message as ListPhraseSetResponse)) as ListPhraseSetResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListPhraseSetResponse create() => ListPhraseSetResponse._();
  @$core.override
  ListPhraseSetResponse createEmptyInstance() => create();
  static $pb.PbList<ListPhraseSetResponse> createRepeated() => $pb.PbList<ListPhraseSetResponse>();
  @$core.pragma('dart2js:noInline')
  static ListPhraseSetResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListPhraseSetResponse>(create);
  static ListPhraseSetResponse? _defaultInstance;

  /// The phrase set.
  @$pb.TagNumber(1)
  $pb.PbList<$3.PhraseSet> get phraseSets => $_getList(0);

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

/// Message sent by the client for the `DeletePhraseSet` method.
class DeletePhraseSetRequest extends $pb.GeneratedMessage {
  factory DeletePhraseSetRequest({
    $core.String? name,
  }) {
    final result = create();
    if (name != null) result.name = name;
    return result;
  }

  DeletePhraseSetRequest._();

  factory DeletePhraseSetRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory DeletePhraseSetRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeletePhraseSetRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'google.cloud.speech.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeletePhraseSetRequest clone() => DeletePhraseSetRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeletePhraseSetRequest copyWith(void Function(DeletePhraseSetRequest) updates) => super.copyWith((message) => updates(message as DeletePhraseSetRequest)) as DeletePhraseSetRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeletePhraseSetRequest create() => DeletePhraseSetRequest._();
  @$core.override
  DeletePhraseSetRequest createEmptyInstance() => create();
  static $pb.PbList<DeletePhraseSetRequest> createRepeated() => $pb.PbList<DeletePhraseSetRequest>();
  @$core.pragma('dart2js:noInline')
  static DeletePhraseSetRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeletePhraseSetRequest>(create);
  static DeletePhraseSetRequest? _defaultInstance;

  /// Required. The name of the phrase set to delete. Format:
  ///
  /// `projects/{project}/locations/{location}/phraseSets/{phrase_set}`
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);
}

/// Message sent by the client for the `CreateCustomClass` method.
class CreateCustomClassRequest extends $pb.GeneratedMessage {
  factory CreateCustomClassRequest({
    $core.String? parent,
    $core.String? customClassId,
    $3.CustomClass? customClass,
  }) {
    final result = create();
    if (parent != null) result.parent = parent;
    if (customClassId != null) result.customClassId = customClassId;
    if (customClass != null) result.customClass = customClass;
    return result;
  }

  CreateCustomClassRequest._();

  factory CreateCustomClassRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory CreateCustomClassRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateCustomClassRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'google.cloud.speech.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'parent')
    ..aOS(2, _omitFieldNames ? '' : 'customClassId')
    ..aOM<$3.CustomClass>(3, _omitFieldNames ? '' : 'customClass', subBuilder: $3.CustomClass.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateCustomClassRequest clone() => CreateCustomClassRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateCustomClassRequest copyWith(void Function(CreateCustomClassRequest) updates) => super.copyWith((message) => updates(message as CreateCustomClassRequest)) as CreateCustomClassRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateCustomClassRequest create() => CreateCustomClassRequest._();
  @$core.override
  CreateCustomClassRequest createEmptyInstance() => create();
  static $pb.PbList<CreateCustomClassRequest> createRepeated() => $pb.PbList<CreateCustomClassRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateCustomClassRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateCustomClassRequest>(create);
  static CreateCustomClassRequest? _defaultInstance;

  /// Required. The parent resource where this custom class will be created.
  /// Format:
  ///
  /// `projects/{project}/locations/{location}/customClasses`
  ///
  /// Speech-to-Text supports three locations: `global`, `us` (US North America),
  /// and `eu` (Europe). If you are calling the `speech.googleapis.com`
  /// endpoint, use the `global` location. To specify a region, use a
  /// [regional endpoint](https://cloud.google.com/speech-to-text/docs/endpoints)
  /// with matching `us` or `eu` location value.
  @$pb.TagNumber(1)
  $core.String get parent => $_getSZ(0);
  @$pb.TagNumber(1)
  set parent($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasParent() => $_has(0);
  @$pb.TagNumber(1)
  void clearParent() => $_clearField(1);

  /// Required. The ID to use for the custom class, which will become the final
  /// component of the custom class' resource name.
  ///
  /// This value should restrict to letters, numbers, and hyphens, with the first
  /// character a letter, the last a letter or a number, and be 4-63 characters.
  @$pb.TagNumber(2)
  $core.String get customClassId => $_getSZ(1);
  @$pb.TagNumber(2)
  set customClassId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCustomClassId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCustomClassId() => $_clearField(2);

  /// Required. The custom class to create.
  @$pb.TagNumber(3)
  $3.CustomClass get customClass => $_getN(2);
  @$pb.TagNumber(3)
  set customClass($3.CustomClass value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasCustomClass() => $_has(2);
  @$pb.TagNumber(3)
  void clearCustomClass() => $_clearField(3);
  @$pb.TagNumber(3)
  $3.CustomClass ensureCustomClass() => $_ensure(2);
}

/// Message sent by the client for the `UpdateCustomClass` method.
class UpdateCustomClassRequest extends $pb.GeneratedMessage {
  factory UpdateCustomClassRequest({
    $3.CustomClass? customClass,
    $9.FieldMask? updateMask,
  }) {
    final result = create();
    if (customClass != null) result.customClass = customClass;
    if (updateMask != null) result.updateMask = updateMask;
    return result;
  }

  UpdateCustomClassRequest._();

  factory UpdateCustomClassRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory UpdateCustomClassRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateCustomClassRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'google.cloud.speech.v1'), createEmptyInstance: create)
    ..aOM<$3.CustomClass>(1, _omitFieldNames ? '' : 'customClass', subBuilder: $3.CustomClass.create)
    ..aOM<$9.FieldMask>(2, _omitFieldNames ? '' : 'updateMask', subBuilder: $9.FieldMask.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateCustomClassRequest clone() => UpdateCustomClassRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateCustomClassRequest copyWith(void Function(UpdateCustomClassRequest) updates) => super.copyWith((message) => updates(message as UpdateCustomClassRequest)) as UpdateCustomClassRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateCustomClassRequest create() => UpdateCustomClassRequest._();
  @$core.override
  UpdateCustomClassRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateCustomClassRequest> createRepeated() => $pb.PbList<UpdateCustomClassRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateCustomClassRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateCustomClassRequest>(create);
  static UpdateCustomClassRequest? _defaultInstance;

  /// Required. The custom class to update.
  ///
  /// The custom class's `name` field is used to identify the custom class to be
  /// updated. Format:
  ///
  /// `projects/{project}/locations/{location}/customClasses/{custom_class}`
  ///
  /// Speech-to-Text supports three locations: `global`, `us` (US North America),
  /// and `eu` (Europe). If you are calling the `speech.googleapis.com`
  /// endpoint, use the `global` location. To specify a region, use a
  /// [regional endpoint](https://cloud.google.com/speech-to-text/docs/endpoints)
  /// with matching `us` or `eu` location value.
  @$pb.TagNumber(1)
  $3.CustomClass get customClass => $_getN(0);
  @$pb.TagNumber(1)
  set customClass($3.CustomClass value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasCustomClass() => $_has(0);
  @$pb.TagNumber(1)
  void clearCustomClass() => $_clearField(1);
  @$pb.TagNumber(1)
  $3.CustomClass ensureCustomClass() => $_ensure(0);

  /// The list of fields to be updated.
  @$pb.TagNumber(2)
  $9.FieldMask get updateMask => $_getN(1);
  @$pb.TagNumber(2)
  set updateMask($9.FieldMask value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasUpdateMask() => $_has(1);
  @$pb.TagNumber(2)
  void clearUpdateMask() => $_clearField(2);
  @$pb.TagNumber(2)
  $9.FieldMask ensureUpdateMask() => $_ensure(1);
}

/// Message sent by the client for the `GetCustomClass` method.
class GetCustomClassRequest extends $pb.GeneratedMessage {
  factory GetCustomClassRequest({
    $core.String? name,
  }) {
    final result = create();
    if (name != null) result.name = name;
    return result;
  }

  GetCustomClassRequest._();

  factory GetCustomClassRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory GetCustomClassRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetCustomClassRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'google.cloud.speech.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCustomClassRequest clone() => GetCustomClassRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCustomClassRequest copyWith(void Function(GetCustomClassRequest) updates) => super.copyWith((message) => updates(message as GetCustomClassRequest)) as GetCustomClassRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCustomClassRequest create() => GetCustomClassRequest._();
  @$core.override
  GetCustomClassRequest createEmptyInstance() => create();
  static $pb.PbList<GetCustomClassRequest> createRepeated() => $pb.PbList<GetCustomClassRequest>();
  @$core.pragma('dart2js:noInline')
  static GetCustomClassRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCustomClassRequest>(create);
  static GetCustomClassRequest? _defaultInstance;

  /// Required. The name of the custom class to retrieve. Format:
  ///
  /// `projects/{project}/locations/{location}/customClasses/{custom_class}`
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);
}

/// Message sent by the client for the `ListCustomClasses` method.
class ListCustomClassesRequest extends $pb.GeneratedMessage {
  factory ListCustomClassesRequest({
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

  ListCustomClassesRequest._();

  factory ListCustomClassesRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory ListCustomClassesRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListCustomClassesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'google.cloud.speech.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'parent')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..aOS(3, _omitFieldNames ? '' : 'pageToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListCustomClassesRequest clone() => ListCustomClassesRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListCustomClassesRequest copyWith(void Function(ListCustomClassesRequest) updates) => super.copyWith((message) => updates(message as ListCustomClassesRequest)) as ListCustomClassesRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListCustomClassesRequest create() => ListCustomClassesRequest._();
  @$core.override
  ListCustomClassesRequest createEmptyInstance() => create();
  static $pb.PbList<ListCustomClassesRequest> createRepeated() => $pb.PbList<ListCustomClassesRequest>();
  @$core.pragma('dart2js:noInline')
  static ListCustomClassesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListCustomClassesRequest>(create);
  static ListCustomClassesRequest? _defaultInstance;

  /// Required. The parent, which owns this collection of custom classes. Format:
  ///
  /// `projects/{project}/locations/{location}/customClasses`
  ///
  /// Speech-to-Text supports three locations: `global`, `us` (US North America),
  /// and `eu` (Europe). If you are calling the `speech.googleapis.com`
  /// endpoint, use the `global` location. To specify a region, use a
  /// [regional endpoint](https://cloud.google.com/speech-to-text/docs/endpoints)
  /// with matching `us` or `eu` location value.
  @$pb.TagNumber(1)
  $core.String get parent => $_getSZ(0);
  @$pb.TagNumber(1)
  set parent($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasParent() => $_has(0);
  @$pb.TagNumber(1)
  void clearParent() => $_clearField(1);

  /// The maximum number of custom classes to return. The service may return
  /// fewer than this value. If unspecified, at most 50 custom classes will be
  /// returned. The maximum value is 1000; values above 1000 will be coerced to
  /// 1000.
  @$pb.TagNumber(2)
  $core.int get pageSize => $_getIZ(1);
  @$pb.TagNumber(2)
  set pageSize($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPageSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageSize() => $_clearField(2);

  /// A page token, received from a previous `ListCustomClass` call.
  /// Provide this to retrieve the subsequent page.
  ///
  /// When paginating, all other parameters provided to `ListCustomClass` must
  /// match the call that provided the page token.
  @$pb.TagNumber(3)
  $core.String get pageToken => $_getSZ(2);
  @$pb.TagNumber(3)
  set pageToken($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPageToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearPageToken() => $_clearField(3);
}

/// Message returned to the client by the `ListCustomClasses` method.
class ListCustomClassesResponse extends $pb.GeneratedMessage {
  factory ListCustomClassesResponse({
    $core.Iterable<$3.CustomClass>? customClasses,
    $core.String? nextPageToken,
  }) {
    final result = create();
    if (customClasses != null) result.customClasses.addAll(customClasses);
    if (nextPageToken != null) result.nextPageToken = nextPageToken;
    return result;
  }

  ListCustomClassesResponse._();

  factory ListCustomClassesResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory ListCustomClassesResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListCustomClassesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'google.cloud.speech.v1'), createEmptyInstance: create)
    ..pc<$3.CustomClass>(1, _omitFieldNames ? '' : 'customClasses', $pb.PbFieldType.PM, subBuilder: $3.CustomClass.create)
    ..aOS(2, _omitFieldNames ? '' : 'nextPageToken')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListCustomClassesResponse clone() => ListCustomClassesResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListCustomClassesResponse copyWith(void Function(ListCustomClassesResponse) updates) => super.copyWith((message) => updates(message as ListCustomClassesResponse)) as ListCustomClassesResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListCustomClassesResponse create() => ListCustomClassesResponse._();
  @$core.override
  ListCustomClassesResponse createEmptyInstance() => create();
  static $pb.PbList<ListCustomClassesResponse> createRepeated() => $pb.PbList<ListCustomClassesResponse>();
  @$core.pragma('dart2js:noInline')
  static ListCustomClassesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListCustomClassesResponse>(create);
  static ListCustomClassesResponse? _defaultInstance;

  /// The custom classes.
  @$pb.TagNumber(1)
  $pb.PbList<$3.CustomClass> get customClasses => $_getList(0);

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

/// Message sent by the client for the `DeleteCustomClass` method.
class DeleteCustomClassRequest extends $pb.GeneratedMessage {
  factory DeleteCustomClassRequest({
    $core.String? name,
  }) {
    final result = create();
    if (name != null) result.name = name;
    return result;
  }

  DeleteCustomClassRequest._();

  factory DeleteCustomClassRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory DeleteCustomClassRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteCustomClassRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'google.cloud.speech.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteCustomClassRequest clone() => DeleteCustomClassRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteCustomClassRequest copyWith(void Function(DeleteCustomClassRequest) updates) => super.copyWith((message) => updates(message as DeleteCustomClassRequest)) as DeleteCustomClassRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteCustomClassRequest create() => DeleteCustomClassRequest._();
  @$core.override
  DeleteCustomClassRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteCustomClassRequest> createRepeated() => $pb.PbList<DeleteCustomClassRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteCustomClassRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteCustomClassRequest>(create);
  static DeleteCustomClassRequest? _defaultInstance;

  /// Required. The name of the custom class to delete. Format:
  ///
  /// `projects/{project}/locations/{location}/customClasses/{custom_class}`
  ///
  /// Speech-to-Text supports three locations: `global`, `us` (US North America),
  /// and `eu` (Europe). If you are calling the `speech.googleapis.com`
  /// endpoint, use the `global` location. To specify a region, use a
  /// [regional endpoint](https://cloud.google.com/speech-to-text/docs/endpoints)
  /// with matching `us` or `eu` location value.
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);
}


const $core.bool _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
