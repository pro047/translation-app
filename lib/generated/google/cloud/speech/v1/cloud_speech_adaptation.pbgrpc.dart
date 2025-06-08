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

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import '../../../protobuf/empty.pb.dart' as $4;
import 'cloud_speech_adaptation.pb.dart' as $2;
import 'resource.pb.dart' as $3;

export 'cloud_speech_adaptation.pb.dart';

/// Service that implements Google Cloud Speech Adaptation API.
@$pb.GrpcServiceName('google.cloud.speech.v1.Adaptation')
class AdaptationClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = 'speech.googleapis.com';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    'https://www.googleapis.com/auth/cloud-platform',
  ];

  static final _$createPhraseSet = $grpc.ClientMethod<$2.CreatePhraseSetRequest, $3.PhraseSet>(
      '/google.cloud.speech.v1.Adaptation/CreatePhraseSet',
      ($2.CreatePhraseSetRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.PhraseSet.fromBuffer(value));
  static final _$getPhraseSet = $grpc.ClientMethod<$2.GetPhraseSetRequest, $3.PhraseSet>(
      '/google.cloud.speech.v1.Adaptation/GetPhraseSet',
      ($2.GetPhraseSetRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.PhraseSet.fromBuffer(value));
  static final _$listPhraseSet = $grpc.ClientMethod<$2.ListPhraseSetRequest, $2.ListPhraseSetResponse>(
      '/google.cloud.speech.v1.Adaptation/ListPhraseSet',
      ($2.ListPhraseSetRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.ListPhraseSetResponse.fromBuffer(value));
  static final _$updatePhraseSet = $grpc.ClientMethod<$2.UpdatePhraseSetRequest, $3.PhraseSet>(
      '/google.cloud.speech.v1.Adaptation/UpdatePhraseSet',
      ($2.UpdatePhraseSetRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.PhraseSet.fromBuffer(value));
  static final _$deletePhraseSet = $grpc.ClientMethod<$2.DeletePhraseSetRequest, $4.Empty>(
      '/google.cloud.speech.v1.Adaptation/DeletePhraseSet',
      ($2.DeletePhraseSetRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.Empty.fromBuffer(value));
  static final _$createCustomClass = $grpc.ClientMethod<$2.CreateCustomClassRequest, $3.CustomClass>(
      '/google.cloud.speech.v1.Adaptation/CreateCustomClass',
      ($2.CreateCustomClassRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.CustomClass.fromBuffer(value));
  static final _$getCustomClass = $grpc.ClientMethod<$2.GetCustomClassRequest, $3.CustomClass>(
      '/google.cloud.speech.v1.Adaptation/GetCustomClass',
      ($2.GetCustomClassRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.CustomClass.fromBuffer(value));
  static final _$listCustomClasses = $grpc.ClientMethod<$2.ListCustomClassesRequest, $2.ListCustomClassesResponse>(
      '/google.cloud.speech.v1.Adaptation/ListCustomClasses',
      ($2.ListCustomClassesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.ListCustomClassesResponse.fromBuffer(value));
  static final _$updateCustomClass = $grpc.ClientMethod<$2.UpdateCustomClassRequest, $3.CustomClass>(
      '/google.cloud.speech.v1.Adaptation/UpdateCustomClass',
      ($2.UpdateCustomClassRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.CustomClass.fromBuffer(value));
  static final _$deleteCustomClass = $grpc.ClientMethod<$2.DeleteCustomClassRequest, $4.Empty>(
      '/google.cloud.speech.v1.Adaptation/DeleteCustomClass',
      ($2.DeleteCustomClassRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.Empty.fromBuffer(value));

  AdaptationClient(super.channel, {super.options, super.interceptors});

  /// Create a set of phrase hints. Each item in the set can be a single word or
  /// a multi-word phrase. The items in the PhraseSet are favored by the
  /// recognition model when you send a call that includes the PhraseSet.
  $grpc.ResponseFuture<$3.PhraseSet> createPhraseSet($2.CreatePhraseSetRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createPhraseSet, request, options: options);
  }

  /// Get a phrase set.
  $grpc.ResponseFuture<$3.PhraseSet> getPhraseSet($2.GetPhraseSetRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPhraseSet, request, options: options);
  }

  /// List phrase sets.
  $grpc.ResponseFuture<$2.ListPhraseSetResponse> listPhraseSet($2.ListPhraseSetRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listPhraseSet, request, options: options);
  }

  /// Update a phrase set.
  $grpc.ResponseFuture<$3.PhraseSet> updatePhraseSet($2.UpdatePhraseSetRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updatePhraseSet, request, options: options);
  }

  /// Delete a phrase set.
  $grpc.ResponseFuture<$4.Empty> deletePhraseSet($2.DeletePhraseSetRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deletePhraseSet, request, options: options);
  }

  /// Create a custom class.
  $grpc.ResponseFuture<$3.CustomClass> createCustomClass($2.CreateCustomClassRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createCustomClass, request, options: options);
  }

  /// Get a custom class.
  $grpc.ResponseFuture<$3.CustomClass> getCustomClass($2.GetCustomClassRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getCustomClass, request, options: options);
  }

  /// List custom classes.
  $grpc.ResponseFuture<$2.ListCustomClassesResponse> listCustomClasses($2.ListCustomClassesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listCustomClasses, request, options: options);
  }

  /// Update a custom class.
  $grpc.ResponseFuture<$3.CustomClass> updateCustomClass($2.UpdateCustomClassRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateCustomClass, request, options: options);
  }

  /// Delete a custom class.
  $grpc.ResponseFuture<$4.Empty> deleteCustomClass($2.DeleteCustomClassRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteCustomClass, request, options: options);
  }
}

@$pb.GrpcServiceName('google.cloud.speech.v1.Adaptation')
abstract class AdaptationServiceBase extends $grpc.Service {
  $core.String get $name => 'google.cloud.speech.v1.Adaptation';

  AdaptationServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.CreatePhraseSetRequest, $3.PhraseSet>(
        'CreatePhraseSet',
        createPhraseSet_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.CreatePhraseSetRequest.fromBuffer(value),
        ($3.PhraseSet value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.GetPhraseSetRequest, $3.PhraseSet>(
        'GetPhraseSet',
        getPhraseSet_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.GetPhraseSetRequest.fromBuffer(value),
        ($3.PhraseSet value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.ListPhraseSetRequest, $2.ListPhraseSetResponse>(
        'ListPhraseSet',
        listPhraseSet_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.ListPhraseSetRequest.fromBuffer(value),
        ($2.ListPhraseSetResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.UpdatePhraseSetRequest, $3.PhraseSet>(
        'UpdatePhraseSet',
        updatePhraseSet_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.UpdatePhraseSetRequest.fromBuffer(value),
        ($3.PhraseSet value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.DeletePhraseSetRequest, $4.Empty>(
        'DeletePhraseSet',
        deletePhraseSet_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.DeletePhraseSetRequest.fromBuffer(value),
        ($4.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.CreateCustomClassRequest, $3.CustomClass>(
        'CreateCustomClass',
        createCustomClass_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.CreateCustomClassRequest.fromBuffer(value),
        ($3.CustomClass value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.GetCustomClassRequest, $3.CustomClass>(
        'GetCustomClass',
        getCustomClass_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.GetCustomClassRequest.fromBuffer(value),
        ($3.CustomClass value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.ListCustomClassesRequest, $2.ListCustomClassesResponse>(
        'ListCustomClasses',
        listCustomClasses_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.ListCustomClassesRequest.fromBuffer(value),
        ($2.ListCustomClassesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.UpdateCustomClassRequest, $3.CustomClass>(
        'UpdateCustomClass',
        updateCustomClass_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.UpdateCustomClassRequest.fromBuffer(value),
        ($3.CustomClass value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.DeleteCustomClassRequest, $4.Empty>(
        'DeleteCustomClass',
        deleteCustomClass_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.DeleteCustomClassRequest.fromBuffer(value),
        ($4.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$3.PhraseSet> createPhraseSet_Pre($grpc.ServiceCall $call, $async.Future<$2.CreatePhraseSetRequest> $request) async {
    return createPhraseSet($call, await $request);
  }

  $async.Future<$3.PhraseSet> getPhraseSet_Pre($grpc.ServiceCall $call, $async.Future<$2.GetPhraseSetRequest> $request) async {
    return getPhraseSet($call, await $request);
  }

  $async.Future<$2.ListPhraseSetResponse> listPhraseSet_Pre($grpc.ServiceCall $call, $async.Future<$2.ListPhraseSetRequest> $request) async {
    return listPhraseSet($call, await $request);
  }

  $async.Future<$3.PhraseSet> updatePhraseSet_Pre($grpc.ServiceCall $call, $async.Future<$2.UpdatePhraseSetRequest> $request) async {
    return updatePhraseSet($call, await $request);
  }

  $async.Future<$4.Empty> deletePhraseSet_Pre($grpc.ServiceCall $call, $async.Future<$2.DeletePhraseSetRequest> $request) async {
    return deletePhraseSet($call, await $request);
  }

  $async.Future<$3.CustomClass> createCustomClass_Pre($grpc.ServiceCall $call, $async.Future<$2.CreateCustomClassRequest> $request) async {
    return createCustomClass($call, await $request);
  }

  $async.Future<$3.CustomClass> getCustomClass_Pre($grpc.ServiceCall $call, $async.Future<$2.GetCustomClassRequest> $request) async {
    return getCustomClass($call, await $request);
  }

  $async.Future<$2.ListCustomClassesResponse> listCustomClasses_Pre($grpc.ServiceCall $call, $async.Future<$2.ListCustomClassesRequest> $request) async {
    return listCustomClasses($call, await $request);
  }

  $async.Future<$3.CustomClass> updateCustomClass_Pre($grpc.ServiceCall $call, $async.Future<$2.UpdateCustomClassRequest> $request) async {
    return updateCustomClass($call, await $request);
  }

  $async.Future<$4.Empty> deleteCustomClass_Pre($grpc.ServiceCall $call, $async.Future<$2.DeleteCustomClassRequest> $request) async {
    return deleteCustomClass($call, await $request);
  }

  $async.Future<$3.PhraseSet> createPhraseSet($grpc.ServiceCall call, $2.CreatePhraseSetRequest request);
  $async.Future<$3.PhraseSet> getPhraseSet($grpc.ServiceCall call, $2.GetPhraseSetRequest request);
  $async.Future<$2.ListPhraseSetResponse> listPhraseSet($grpc.ServiceCall call, $2.ListPhraseSetRequest request);
  $async.Future<$3.PhraseSet> updatePhraseSet($grpc.ServiceCall call, $2.UpdatePhraseSetRequest request);
  $async.Future<$4.Empty> deletePhraseSet($grpc.ServiceCall call, $2.DeletePhraseSetRequest request);
  $async.Future<$3.CustomClass> createCustomClass($grpc.ServiceCall call, $2.CreateCustomClassRequest request);
  $async.Future<$3.CustomClass> getCustomClass($grpc.ServiceCall call, $2.GetCustomClassRequest request);
  $async.Future<$2.ListCustomClassesResponse> listCustomClasses($grpc.ServiceCall call, $2.ListCustomClassesRequest request);
  $async.Future<$3.CustomClass> updateCustomClass($grpc.ServiceCall call, $2.UpdateCustomClassRequest request);
  $async.Future<$4.Empty> deleteCustomClass($grpc.ServiceCall call, $2.DeleteCustomClassRequest request);
}
