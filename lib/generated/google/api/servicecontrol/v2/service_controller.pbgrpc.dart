//
//  Generated code. Do not modify.
//  source: google/api/servicecontrol/v2/service_controller.proto
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

import 'service_controller.pb.dart' as $11;

export 'service_controller.pb.dart';

/// [Service Control API
/// v2](https://cloud.google.com/service-infrastructure/docs/service-control/access-control)
///
/// Private Preview. This feature is only available for approved services.
///
/// This API provides admission control and telemetry reporting for services
/// that are integrated with [Service
/// Infrastructure](https://cloud.google.com/service-infrastructure).
@$pb.GrpcServiceName('google.api.servicecontrol.v2.ServiceController')
class ServiceControllerClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = 'servicecontrol.googleapis.com';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    'https://www.googleapis.com/auth/cloud-platform',
    'https://www.googleapis.com/auth/servicecontrol',
  ];

  static final _$check = $grpc.ClientMethod<$11.CheckRequest, $11.CheckResponse>(
      '/google.api.servicecontrol.v2.ServiceController/Check',
      ($11.CheckRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $11.CheckResponse.fromBuffer(value));
  static final _$report = $grpc.ClientMethod<$11.ReportRequest, $11.ReportResponse>(
      '/google.api.servicecontrol.v2.ServiceController/Report',
      ($11.ReportRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $11.ReportResponse.fromBuffer(value));

  ServiceControllerClient(super.channel, {super.options, super.interceptors});

  /// Private Preview. This feature is only available for approved services.
  ///
  /// This method provides admission control for services that are integrated
  /// with [Service
  /// Infrastructure](https://cloud.google.com/service-infrastructure). It checks
  /// whether an operation should be allowed based on the service configuration
  /// and relevant policies. It must be called before the operation is executed.
  /// For more information, see
  /// [Admission
  /// Control](https://cloud.google.com/service-infrastructure/docs/admission-control).
  ///
  /// NOTE: The admission control has an expected policy propagation delay of
  /// 60s. The caller **must** not depend on the most recent policy changes.
  ///
  /// NOTE: The admission control has a hard limit of 1 referenced resources
  /// per call. If an operation refers to more than 1 resources, the caller
  /// must call the Check method multiple times.
  ///
  /// This method requires the `servicemanagement.services.check` permission
  /// on the specified service. For more information, see
  /// [Service Control API Access
  /// Control](https://cloud.google.com/service-infrastructure/docs/service-control/access-control).
  $grpc.ResponseFuture<$11.CheckResponse> check($11.CheckRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$check, request, options: options);
  }

  /// Private Preview. This feature is only available for approved services.
  ///
  /// This method provides telemetry reporting for services that are integrated
  /// with [Service
  /// Infrastructure](https://cloud.google.com/service-infrastructure). It
  /// reports a list of operations that have occurred on a service. It must be
  /// called after the operations have been executed. For more information, see
  /// [Telemetry
  /// Reporting](https://cloud.google.com/service-infrastructure/docs/telemetry-reporting).
  ///
  /// NOTE: The telemetry reporting has a hard limit of 1000 operations and 1MB
  /// per Report call. It is recommended to have no more than 100 operations per
  /// call.
  ///
  /// This method requires the `servicemanagement.services.report` permission
  /// on the specified service. For more information, see
  /// [Service Control API Access
  /// Control](https://cloud.google.com/service-infrastructure/docs/service-control/access-control).
  $grpc.ResponseFuture<$11.ReportResponse> report($11.ReportRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$report, request, options: options);
  }
}

@$pb.GrpcServiceName('google.api.servicecontrol.v2.ServiceController')
abstract class ServiceControllerServiceBase extends $grpc.Service {
  $core.String get $name => 'google.api.servicecontrol.v2.ServiceController';

  ServiceControllerServiceBase() {
    $addMethod($grpc.ServiceMethod<$11.CheckRequest, $11.CheckResponse>(
        'Check',
        check_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $11.CheckRequest.fromBuffer(value),
        ($11.CheckResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$11.ReportRequest, $11.ReportResponse>(
        'Report',
        report_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $11.ReportRequest.fromBuffer(value),
        ($11.ReportResponse value) => value.writeToBuffer()));
  }

  $async.Future<$11.CheckResponse> check_Pre($grpc.ServiceCall $call, $async.Future<$11.CheckRequest> $request) async {
    return check($call, await $request);
  }

  $async.Future<$11.ReportResponse> report_Pre($grpc.ServiceCall $call, $async.Future<$11.ReportRequest> $request) async {
    return report($call, await $request);
  }

  $async.Future<$11.CheckResponse> check($grpc.ServiceCall call, $11.CheckRequest request);
  $async.Future<$11.ReportResponse> report($grpc.ServiceCall call, $11.ReportRequest request);
}
