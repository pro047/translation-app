//
//  Generated code. Do not modify.
//  source: google/api/servicecontrol/v1/quota_controller.proto
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

import 'quota_controller.pb.dart' as $9;

export 'quota_controller.pb.dart';

/// [Google Quota Control API](/service-control/overview)
///
/// Allows clients to allocate and release quota against a [managed
/// service](https://cloud.google.com/service-management/reference/rpc/google.api/servicemanagement.v1#google.api.servicemanagement.v1.ManagedService).
@$pb.GrpcServiceName('google.api.servicecontrol.v1.QuotaController')
class QuotaControllerClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = 'servicecontrol.googleapis.com';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    'https://www.googleapis.com/auth/cloud-platform',
    'https://www.googleapis.com/auth/servicecontrol',
  ];

  static final _$allocateQuota = $grpc.ClientMethod<$9.AllocateQuotaRequest, $9.AllocateQuotaResponse>(
      '/google.api.servicecontrol.v1.QuotaController/AllocateQuota',
      ($9.AllocateQuotaRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $9.AllocateQuotaResponse.fromBuffer(value));

  QuotaControllerClient(super.channel, {super.options, super.interceptors});

  /// Attempts to allocate quota for the specified consumer. It should be called
  /// before the operation is executed.
  ///
  /// This method requires the `servicemanagement.services.quota`
  /// permission on the specified service. For more information, see
  /// [Cloud IAM](https://cloud.google.com/iam).
  ///
  /// **NOTE:** The client **must** fail-open on server errors `INTERNAL`,
  /// `UNKNOWN`, `DEADLINE_EXCEEDED`, and `UNAVAILABLE`. To ensure system
  /// reliability, the server may inject these errors to prohibit any hard
  /// dependency on the quota functionality.
  $grpc.ResponseFuture<$9.AllocateQuotaResponse> allocateQuota($9.AllocateQuotaRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$allocateQuota, request, options: options);
  }
}

@$pb.GrpcServiceName('google.api.servicecontrol.v1.QuotaController')
abstract class QuotaControllerServiceBase extends $grpc.Service {
  $core.String get $name => 'google.api.servicecontrol.v1.QuotaController';

  QuotaControllerServiceBase() {
    $addMethod($grpc.ServiceMethod<$9.AllocateQuotaRequest, $9.AllocateQuotaResponse>(
        'AllocateQuota',
        allocateQuota_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $9.AllocateQuotaRequest.fromBuffer(value),
        ($9.AllocateQuotaResponse value) => value.writeToBuffer()));
  }

  $async.Future<$9.AllocateQuotaResponse> allocateQuota_Pre($grpc.ServiceCall $call, $async.Future<$9.AllocateQuotaRequest> $request) async {
    return allocateQuota($call, await $request);
  }

  $async.Future<$9.AllocateQuotaResponse> allocateQuota($grpc.ServiceCall call, $9.AllocateQuotaRequest request);
}
