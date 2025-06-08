//
//  Generated code. Do not modify.
//  source: google/api/cloudquotas/v1beta/quota_adjuster_settings.proto
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

import 'quota_adjuster_settings.pb.dart' as $7;

export 'quota_adjuster_settings.pb.dart';

/// The Quotas Adjuster Settings API is an infrastructure service for Google
///  Cloud that lets service consumers view and update their quota adjuster
///  settings.
///
/// - Update quota adjuster settings.
/// - Get the name of the configurations.
@$pb.GrpcServiceName('google.api.cloudquotas.v1beta.QuotaAdjusterSettingsManager')
class QuotaAdjusterSettingsManagerClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = 'cloudquotas.googleapis.com';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    'https://www.googleapis.com/auth/cloud-platform',
  ];

  static final _$updateQuotaAdjusterSettings = $grpc.ClientMethod<$7.UpdateQuotaAdjusterSettingsRequest, $7.QuotaAdjusterSettings>(
      '/google.api.cloudquotas.v1beta.QuotaAdjusterSettingsManager/UpdateQuotaAdjusterSettings',
      ($7.UpdateQuotaAdjusterSettingsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $7.QuotaAdjusterSettings.fromBuffer(value));
  static final _$getQuotaAdjusterSettings = $grpc.ClientMethod<$7.GetQuotaAdjusterSettingsRequest, $7.QuotaAdjusterSettings>(
      '/google.api.cloudquotas.v1beta.QuotaAdjusterSettingsManager/GetQuotaAdjusterSettings',
      ($7.GetQuotaAdjusterSettingsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $7.QuotaAdjusterSettings.fromBuffer(value));

  QuotaAdjusterSettingsManagerClient(super.channel, {super.options, super.interceptors});

  /// RPC Method for updating QuotaAdjusterSettings based on the request
  $grpc.ResponseFuture<$7.QuotaAdjusterSettings> updateQuotaAdjusterSettings($7.UpdateQuotaAdjusterSettingsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateQuotaAdjusterSettings, request, options: options);
  }

  /// RPC Method for getting QuotaAdjusterSettings based on the request
  $grpc.ResponseFuture<$7.QuotaAdjusterSettings> getQuotaAdjusterSettings($7.GetQuotaAdjusterSettingsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getQuotaAdjusterSettings, request, options: options);
  }
}

@$pb.GrpcServiceName('google.api.cloudquotas.v1beta.QuotaAdjusterSettingsManager')
abstract class QuotaAdjusterSettingsManagerServiceBase extends $grpc.Service {
  $core.String get $name => 'google.api.cloudquotas.v1beta.QuotaAdjusterSettingsManager';

  QuotaAdjusterSettingsManagerServiceBase() {
    $addMethod($grpc.ServiceMethod<$7.UpdateQuotaAdjusterSettingsRequest, $7.QuotaAdjusterSettings>(
        'UpdateQuotaAdjusterSettings',
        updateQuotaAdjusterSettings_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $7.UpdateQuotaAdjusterSettingsRequest.fromBuffer(value),
        ($7.QuotaAdjusterSettings value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.GetQuotaAdjusterSettingsRequest, $7.QuotaAdjusterSettings>(
        'GetQuotaAdjusterSettings',
        getQuotaAdjusterSettings_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $7.GetQuotaAdjusterSettingsRequest.fromBuffer(value),
        ($7.QuotaAdjusterSettings value) => value.writeToBuffer()));
  }

  $async.Future<$7.QuotaAdjusterSettings> updateQuotaAdjusterSettings_Pre($grpc.ServiceCall $call, $async.Future<$7.UpdateQuotaAdjusterSettingsRequest> $request) async {
    return updateQuotaAdjusterSettings($call, await $request);
  }

  $async.Future<$7.QuotaAdjusterSettings> getQuotaAdjusterSettings_Pre($grpc.ServiceCall $call, $async.Future<$7.GetQuotaAdjusterSettingsRequest> $request) async {
    return getQuotaAdjusterSettings($call, await $request);
  }

  $async.Future<$7.QuotaAdjusterSettings> updateQuotaAdjusterSettings($grpc.ServiceCall call, $7.UpdateQuotaAdjusterSettingsRequest request);
  $async.Future<$7.QuotaAdjusterSettings> getQuotaAdjusterSettings($grpc.ServiceCall call, $7.GetQuotaAdjusterSettingsRequest request);
}
