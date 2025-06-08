//
//  Generated code. Do not modify.
//  source: google/api/cloudquotas/v1/cloudquotas.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'cloudquotas.pb.dart' as $3;
import 'resources.pb.dart' as $4;

export 'cloudquotas.pb.dart';

/// The Cloud Quotas API is an infrastructure service for Google Cloud that lets
/// service consumers list and manage their resource usage limits.
///
/// - List/Get the metadata and current status of the quotas for a service.
/// - Create/Update quota preferencess that declare the preferred quota values.
/// - Check the status of a quota preference request.
/// - List/Get pending and historical quota preference.
@$pb.GrpcServiceName('google.api.cloudquotas.v1.CloudQuotas')
class CloudQuotasClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = 'cloudquotas.googleapis.com';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    'https://www.googleapis.com/auth/cloud-platform',
  ];

  static final _$listQuotaInfos = $grpc.ClientMethod<$3.ListQuotaInfosRequest, $3.ListQuotaInfosResponse>(
      '/google.api.cloudquotas.v1.CloudQuotas/ListQuotaInfos',
      ($3.ListQuotaInfosRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.ListQuotaInfosResponse.fromBuffer(value));
  static final _$getQuotaInfo = $grpc.ClientMethod<$3.GetQuotaInfoRequest, $4.QuotaInfo>(
      '/google.api.cloudquotas.v1.CloudQuotas/GetQuotaInfo',
      ($3.GetQuotaInfoRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.QuotaInfo.fromBuffer(value));
  static final _$listQuotaPreferences = $grpc.ClientMethod<$3.ListQuotaPreferencesRequest, $3.ListQuotaPreferencesResponse>(
      '/google.api.cloudquotas.v1.CloudQuotas/ListQuotaPreferences',
      ($3.ListQuotaPreferencesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.ListQuotaPreferencesResponse.fromBuffer(value));
  static final _$getQuotaPreference = $grpc.ClientMethod<$3.GetQuotaPreferenceRequest, $4.QuotaPreference>(
      '/google.api.cloudquotas.v1.CloudQuotas/GetQuotaPreference',
      ($3.GetQuotaPreferenceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.QuotaPreference.fromBuffer(value));
  static final _$createQuotaPreference = $grpc.ClientMethod<$3.CreateQuotaPreferenceRequest, $4.QuotaPreference>(
      '/google.api.cloudquotas.v1.CloudQuotas/CreateQuotaPreference',
      ($3.CreateQuotaPreferenceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.QuotaPreference.fromBuffer(value));
  static final _$updateQuotaPreference = $grpc.ClientMethod<$3.UpdateQuotaPreferenceRequest, $4.QuotaPreference>(
      '/google.api.cloudquotas.v1.CloudQuotas/UpdateQuotaPreference',
      ($3.UpdateQuotaPreferenceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.QuotaPreference.fromBuffer(value));

  CloudQuotasClient(super.channel, {super.options, super.interceptors});

  /// Lists QuotaInfos of all quotas for a given project, folder or organization.
  $grpc.ResponseFuture<$3.ListQuotaInfosResponse> listQuotaInfos($3.ListQuotaInfosRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listQuotaInfos, request, options: options);
  }

  /// Retrieve the QuotaInfo of a quota for a project, folder or organization.
  $grpc.ResponseFuture<$4.QuotaInfo> getQuotaInfo($3.GetQuotaInfoRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getQuotaInfo, request, options: options);
  }

  /// Lists QuotaPreferences in a given project, folder or organization.
  $grpc.ResponseFuture<$3.ListQuotaPreferencesResponse> listQuotaPreferences($3.ListQuotaPreferencesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listQuotaPreferences, request, options: options);
  }

  /// Gets details of a single QuotaPreference.
  $grpc.ResponseFuture<$4.QuotaPreference> getQuotaPreference($3.GetQuotaPreferenceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getQuotaPreference, request, options: options);
  }

  /// Creates a new QuotaPreference that declares the desired value for a quota.
  $grpc.ResponseFuture<$4.QuotaPreference> createQuotaPreference($3.CreateQuotaPreferenceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createQuotaPreference, request, options: options);
  }

  /// Updates the parameters of a single QuotaPreference. It can updates the
  /// config in any states, not just the ones pending approval.
  $grpc.ResponseFuture<$4.QuotaPreference> updateQuotaPreference($3.UpdateQuotaPreferenceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateQuotaPreference, request, options: options);
  }
}

@$pb.GrpcServiceName('google.api.cloudquotas.v1.CloudQuotas')
abstract class CloudQuotasServiceBase extends $grpc.Service {
  $core.String get $name => 'google.api.cloudquotas.v1.CloudQuotas';

  CloudQuotasServiceBase() {
    $addMethod($grpc.ServiceMethod<$3.ListQuotaInfosRequest, $3.ListQuotaInfosResponse>(
        'ListQuotaInfos',
        listQuotaInfos_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.ListQuotaInfosRequest.fromBuffer(value),
        ($3.ListQuotaInfosResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.GetQuotaInfoRequest, $4.QuotaInfo>(
        'GetQuotaInfo',
        getQuotaInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.GetQuotaInfoRequest.fromBuffer(value),
        ($4.QuotaInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.ListQuotaPreferencesRequest, $3.ListQuotaPreferencesResponse>(
        'ListQuotaPreferences',
        listQuotaPreferences_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.ListQuotaPreferencesRequest.fromBuffer(value),
        ($3.ListQuotaPreferencesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.GetQuotaPreferenceRequest, $4.QuotaPreference>(
        'GetQuotaPreference',
        getQuotaPreference_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.GetQuotaPreferenceRequest.fromBuffer(value),
        ($4.QuotaPreference value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.CreateQuotaPreferenceRequest, $4.QuotaPreference>(
        'CreateQuotaPreference',
        createQuotaPreference_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.CreateQuotaPreferenceRequest.fromBuffer(value),
        ($4.QuotaPreference value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.UpdateQuotaPreferenceRequest, $4.QuotaPreference>(
        'UpdateQuotaPreference',
        updateQuotaPreference_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.UpdateQuotaPreferenceRequest.fromBuffer(value),
        ($4.QuotaPreference value) => value.writeToBuffer()));
  }

  $async.Future<$3.ListQuotaInfosResponse> listQuotaInfos_Pre($grpc.ServiceCall $call, $async.Future<$3.ListQuotaInfosRequest> $request) async {
    return listQuotaInfos($call, await $request);
  }

  $async.Future<$4.QuotaInfo> getQuotaInfo_Pre($grpc.ServiceCall $call, $async.Future<$3.GetQuotaInfoRequest> $request) async {
    return getQuotaInfo($call, await $request);
  }

  $async.Future<$3.ListQuotaPreferencesResponse> listQuotaPreferences_Pre($grpc.ServiceCall $call, $async.Future<$3.ListQuotaPreferencesRequest> $request) async {
    return listQuotaPreferences($call, await $request);
  }

  $async.Future<$4.QuotaPreference> getQuotaPreference_Pre($grpc.ServiceCall $call, $async.Future<$3.GetQuotaPreferenceRequest> $request) async {
    return getQuotaPreference($call, await $request);
  }

  $async.Future<$4.QuotaPreference> createQuotaPreference_Pre($grpc.ServiceCall $call, $async.Future<$3.CreateQuotaPreferenceRequest> $request) async {
    return createQuotaPreference($call, await $request);
  }

  $async.Future<$4.QuotaPreference> updateQuotaPreference_Pre($grpc.ServiceCall $call, $async.Future<$3.UpdateQuotaPreferenceRequest> $request) async {
    return updateQuotaPreference($call, await $request);
  }

  $async.Future<$3.ListQuotaInfosResponse> listQuotaInfos($grpc.ServiceCall call, $3.ListQuotaInfosRequest request);
  $async.Future<$4.QuotaInfo> getQuotaInfo($grpc.ServiceCall call, $3.GetQuotaInfoRequest request);
  $async.Future<$3.ListQuotaPreferencesResponse> listQuotaPreferences($grpc.ServiceCall call, $3.ListQuotaPreferencesRequest request);
  $async.Future<$4.QuotaPreference> getQuotaPreference($grpc.ServiceCall call, $3.GetQuotaPreferenceRequest request);
  $async.Future<$4.QuotaPreference> createQuotaPreference($grpc.ServiceCall call, $3.CreateQuotaPreferenceRequest request);
  $async.Future<$4.QuotaPreference> updateQuotaPreference($grpc.ServiceCall call, $3.UpdateQuotaPreferenceRequest request);
}
