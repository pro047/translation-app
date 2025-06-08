//
//  Generated code. Do not modify.
//  source: google/api/expr/conformance/v1alpha1/conformance_service.proto
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

import 'conformance_service.pb.dart' as $8;

export 'conformance_service.pb.dart';

/// Access a CEL implementation from another process or machine.
/// A CEL implementation is decomposed as a parser, a static checker,
/// and an evaluator.  Every CEL implementation is expected to provide
/// a server for this API.  The API will be used for conformance testing
/// and other utilities.
@$pb.GrpcServiceName('google.api.expr.conformance.v1alpha1.ConformanceService')
class ConformanceServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = 'cel.googleapis.com';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  static final _$parse = $grpc.ClientMethod<$8.ParseRequest, $8.ParseResponse>(
      '/google.api.expr.conformance.v1alpha1.ConformanceService/Parse',
      ($8.ParseRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $8.ParseResponse.fromBuffer(value));
  static final _$check = $grpc.ClientMethod<$8.CheckRequest, $8.CheckResponse>(
      '/google.api.expr.conformance.v1alpha1.ConformanceService/Check',
      ($8.CheckRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $8.CheckResponse.fromBuffer(value));
  static final _$eval = $grpc.ClientMethod<$8.EvalRequest, $8.EvalResponse>(
      '/google.api.expr.conformance.v1alpha1.ConformanceService/Eval',
      ($8.EvalRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $8.EvalResponse.fromBuffer(value));

  ConformanceServiceClient(super.channel, {super.options, super.interceptors});

  /// Transforms CEL source text into a parsed representation.
  $grpc.ResponseFuture<$8.ParseResponse> parse($8.ParseRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$parse, request, options: options);
  }

  /// Runs static checks on a parsed CEL representation and return
  /// an annotated representation, or a set of issues.
  $grpc.ResponseFuture<$8.CheckResponse> check($8.CheckRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$check, request, options: options);
  }

  /// Evaluates a parsed or annotation CEL representation given
  /// values of external bindings.
  $grpc.ResponseFuture<$8.EvalResponse> eval($8.EvalRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$eval, request, options: options);
  }
}

@$pb.GrpcServiceName('google.api.expr.conformance.v1alpha1.ConformanceService')
abstract class ConformanceServiceBase extends $grpc.Service {
  $core.String get $name => 'google.api.expr.conformance.v1alpha1.ConformanceService';

  ConformanceServiceBase() {
    $addMethod($grpc.ServiceMethod<$8.ParseRequest, $8.ParseResponse>(
        'Parse',
        parse_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.ParseRequest.fromBuffer(value),
        ($8.ParseResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.CheckRequest, $8.CheckResponse>(
        'Check',
        check_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.CheckRequest.fromBuffer(value),
        ($8.CheckResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.EvalRequest, $8.EvalResponse>(
        'Eval',
        eval_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.EvalRequest.fromBuffer(value),
        ($8.EvalResponse value) => value.writeToBuffer()));
  }

  $async.Future<$8.ParseResponse> parse_Pre($grpc.ServiceCall $call, $async.Future<$8.ParseRequest> $request) async {
    return parse($call, await $request);
  }

  $async.Future<$8.CheckResponse> check_Pre($grpc.ServiceCall $call, $async.Future<$8.CheckRequest> $request) async {
    return check($call, await $request);
  }

  $async.Future<$8.EvalResponse> eval_Pre($grpc.ServiceCall $call, $async.Future<$8.EvalRequest> $request) async {
    return eval($call, await $request);
  }

  $async.Future<$8.ParseResponse> parse($grpc.ServiceCall call, $8.ParseRequest request);
  $async.Future<$8.CheckResponse> check($grpc.ServiceCall call, $8.CheckRequest request);
  $async.Future<$8.EvalResponse> eval($grpc.ServiceCall call, $8.EvalRequest request);
}
