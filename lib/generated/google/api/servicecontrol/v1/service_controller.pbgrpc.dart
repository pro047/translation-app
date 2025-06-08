//
//  Generated code. Do not modify.
//  source: google/api/servicecontrol/v1/service_controller.proto
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

import 'service_controller.pb.dart' as $10;

export 'service_controller.pb.dart';

/// [Google Service Control API](/service-control/overview)
///
/// Lets clients check and report operations against a [managed
/// service](https://cloud.google.com/service-management/reference/rpc/google.api/servicemanagement.v1#google.api.servicemanagement.v1.ManagedService).
@$pb.GrpcServiceName('google.api.servicecontrol.v1.ServiceController')
class ServiceControllerClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = 'servicecontrol.googleapis.com';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    'https://www.googleapis.com/auth/cloud-platform',
    'https://www.googleapis.com/auth/servicecontrol',
  ];

  static final _$check = $grpc.ClientMethod<$10.CheckRequest, $10.CheckResponse>(
      '/google.api.servicecontrol.v1.ServiceController/Check',
      ($10.CheckRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $10.CheckResponse.fromBuffer(value));
  static final _$report = $grpc.ClientMethod<$10.ReportRequest, $10.ReportResponse>(
      '/google.api.servicecontrol.v1.ServiceController/Report',
      ($10.ReportRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $10.ReportResponse.fromBuffer(value));

  ServiceControllerClient(super.channel, {super.options, super.interceptors});

  /// Checks whether an operation on a service should be allowed to proceed
  /// based on the configuration of the service and related policies. It must be
  /// called before the operation is executed.
  ///
  /// If feasible, the client should cache the check results and reuse them for
  /// 60 seconds. In case of any server errors, the client should rely on the
  /// cached results for much longer time to avoid outage.
  /// WARNING: There is general 60s delay for the configuration and policy
  /// propagation, therefore callers MUST NOT depend on the `Check` method having
  /// the latest policy information.
  ///
  /// NOTE: the [CheckRequest][google.api.servicecontrol.v1.CheckRequest] has
  /// the size limit (wire-format byte size) of 1MB.
  ///
  /// This method requires the `servicemanagement.services.check` permission
  /// on the specified service. For more information, see
  /// [Cloud IAM](https://cloud.google.com/iam).
  $grpc.ResponseFuture<$10.CheckResponse> check($10.CheckRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$check, request, options: options);
  }

  /// Reports operation results to Google Service Control, such as logs and
  /// metrics. It should be called after an operation is completed.
  ///
  /// If feasible, the client should aggregate reporting data for up to 5
  /// seconds to reduce API traffic. Limiting aggregation to 5 seconds is to
  /// reduce data loss during client crashes. Clients should carefully choose
  /// the aggregation time window to avoid data loss risk more than 0.01%
  /// for business and compliance reasons.
  ///
  /// NOTE: the [ReportRequest][google.api.servicecontrol.v1.ReportRequest] has
  /// the size limit (wire-format byte size) of 1MB.
  ///
  /// This method requires the `servicemanagement.services.report` permission
  /// on the specified service. For more information, see
  /// [Google Cloud IAM](https://cloud.google.com/iam).
  $grpc.ResponseFuture<$10.ReportResponse> report($10.ReportRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$report, request, options: options);
  }
}

@$pb.GrpcServiceName('google.api.servicecontrol.v1.ServiceController')
abstract class ServiceControllerServiceBase extends $grpc.Service {
  $core.String get $name => 'google.api.servicecontrol.v1.ServiceController';

  ServiceControllerServiceBase() {
    $addMethod($grpc.ServiceMethod<$10.CheckRequest, $10.CheckResponse>(
        'Check',
        check_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $10.CheckRequest.fromBuffer(value),
        ($10.CheckResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$10.ReportRequest, $10.ReportResponse>(
        'Report',
        report_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $10.ReportRequest.fromBuffer(value),
        ($10.ReportResponse value) => value.writeToBuffer()));
  }

  $async.Future<$10.CheckResponse> check_Pre($grpc.ServiceCall $call, $async.Future<$10.CheckRequest> $request) async {
    return check($call, await $request);
  }

  $async.Future<$10.ReportResponse> report_Pre($grpc.ServiceCall $call, $async.Future<$10.ReportRequest> $request) async {
    return report($call, await $request);
  }

  $async.Future<$10.CheckResponse> check($grpc.ServiceCall call, $10.CheckRequest request);
  $async.Future<$10.ReportResponse> report($grpc.ServiceCall call, $10.ReportRequest request);
}
