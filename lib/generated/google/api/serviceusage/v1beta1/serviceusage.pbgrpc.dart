//
//  Generated code. Do not modify.
//  source: google/api/serviceusage/v1beta1/serviceusage.proto
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

import '../../../longrunning/operations.pb.dart' as $1;
import 'resources.pb.dart' as $18;
import 'serviceusage.pb.dart' as $17;

export 'serviceusage.pb.dart';

/// [Service Usage API](https://cloud.google.com/service-usage/docs/overview)
@$pb.GrpcServiceName('google.api.serviceusage.v1beta1.ServiceUsage')
class ServiceUsageClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = 'serviceusage.googleapis.com';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    'https://www.googleapis.com/auth/cloud-platform',
    'https://www.googleapis.com/auth/cloud-platform.read-only',
    'https://www.googleapis.com/auth/service.management',
  ];

  static final _$enableService = $grpc.ClientMethod<$17.EnableServiceRequest, $1.Operation>(
      '/google.api.serviceusage.v1beta1.ServiceUsage/EnableService',
      ($17.EnableServiceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Operation.fromBuffer(value));
  static final _$disableService = $grpc.ClientMethod<$17.DisableServiceRequest, $1.Operation>(
      '/google.api.serviceusage.v1beta1.ServiceUsage/DisableService',
      ($17.DisableServiceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Operation.fromBuffer(value));
  static final _$getService = $grpc.ClientMethod<$17.GetServiceRequest, $18.Service>(
      '/google.api.serviceusage.v1beta1.ServiceUsage/GetService',
      ($17.GetServiceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $18.Service.fromBuffer(value));
  static final _$listServices = $grpc.ClientMethod<$17.ListServicesRequest, $17.ListServicesResponse>(
      '/google.api.serviceusage.v1beta1.ServiceUsage/ListServices',
      ($17.ListServicesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $17.ListServicesResponse.fromBuffer(value));
  static final _$batchEnableServices = $grpc.ClientMethod<$17.BatchEnableServicesRequest, $1.Operation>(
      '/google.api.serviceusage.v1beta1.ServiceUsage/BatchEnableServices',
      ($17.BatchEnableServicesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Operation.fromBuffer(value));
  static final _$listConsumerQuotaMetrics = $grpc.ClientMethod<$17.ListConsumerQuotaMetricsRequest, $17.ListConsumerQuotaMetricsResponse>(
      '/google.api.serviceusage.v1beta1.ServiceUsage/ListConsumerQuotaMetrics',
      ($17.ListConsumerQuotaMetricsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $17.ListConsumerQuotaMetricsResponse.fromBuffer(value));
  static final _$getConsumerQuotaMetric = $grpc.ClientMethod<$17.GetConsumerQuotaMetricRequest, $18.ConsumerQuotaMetric>(
      '/google.api.serviceusage.v1beta1.ServiceUsage/GetConsumerQuotaMetric',
      ($17.GetConsumerQuotaMetricRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $18.ConsumerQuotaMetric.fromBuffer(value));
  static final _$getConsumerQuotaLimit = $grpc.ClientMethod<$17.GetConsumerQuotaLimitRequest, $18.ConsumerQuotaLimit>(
      '/google.api.serviceusage.v1beta1.ServiceUsage/GetConsumerQuotaLimit',
      ($17.GetConsumerQuotaLimitRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $18.ConsumerQuotaLimit.fromBuffer(value));
  static final _$createAdminOverride = $grpc.ClientMethod<$17.CreateAdminOverrideRequest, $1.Operation>(
      '/google.api.serviceusage.v1beta1.ServiceUsage/CreateAdminOverride',
      ($17.CreateAdminOverrideRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Operation.fromBuffer(value));
  static final _$updateAdminOverride = $grpc.ClientMethod<$17.UpdateAdminOverrideRequest, $1.Operation>(
      '/google.api.serviceusage.v1beta1.ServiceUsage/UpdateAdminOverride',
      ($17.UpdateAdminOverrideRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Operation.fromBuffer(value));
  static final _$deleteAdminOverride = $grpc.ClientMethod<$17.DeleteAdminOverrideRequest, $1.Operation>(
      '/google.api.serviceusage.v1beta1.ServiceUsage/DeleteAdminOverride',
      ($17.DeleteAdminOverrideRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Operation.fromBuffer(value));
  static final _$listAdminOverrides = $grpc.ClientMethod<$17.ListAdminOverridesRequest, $17.ListAdminOverridesResponse>(
      '/google.api.serviceusage.v1beta1.ServiceUsage/ListAdminOverrides',
      ($17.ListAdminOverridesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $17.ListAdminOverridesResponse.fromBuffer(value));
  static final _$importAdminOverrides = $grpc.ClientMethod<$17.ImportAdminOverridesRequest, $1.Operation>(
      '/google.api.serviceusage.v1beta1.ServiceUsage/ImportAdminOverrides',
      ($17.ImportAdminOverridesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Operation.fromBuffer(value));
  static final _$createConsumerOverride = $grpc.ClientMethod<$17.CreateConsumerOverrideRequest, $1.Operation>(
      '/google.api.serviceusage.v1beta1.ServiceUsage/CreateConsumerOverride',
      ($17.CreateConsumerOverrideRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Operation.fromBuffer(value));
  static final _$updateConsumerOverride = $grpc.ClientMethod<$17.UpdateConsumerOverrideRequest, $1.Operation>(
      '/google.api.serviceusage.v1beta1.ServiceUsage/UpdateConsumerOverride',
      ($17.UpdateConsumerOverrideRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Operation.fromBuffer(value));
  static final _$deleteConsumerOverride = $grpc.ClientMethod<$17.DeleteConsumerOverrideRequest, $1.Operation>(
      '/google.api.serviceusage.v1beta1.ServiceUsage/DeleteConsumerOverride',
      ($17.DeleteConsumerOverrideRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Operation.fromBuffer(value));
  static final _$listConsumerOverrides = $grpc.ClientMethod<$17.ListConsumerOverridesRequest, $17.ListConsumerOverridesResponse>(
      '/google.api.serviceusage.v1beta1.ServiceUsage/ListConsumerOverrides',
      ($17.ListConsumerOverridesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $17.ListConsumerOverridesResponse.fromBuffer(value));
  static final _$importConsumerOverrides = $grpc.ClientMethod<$17.ImportConsumerOverridesRequest, $1.Operation>(
      '/google.api.serviceusage.v1beta1.ServiceUsage/ImportConsumerOverrides',
      ($17.ImportConsumerOverridesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Operation.fromBuffer(value));
  static final _$generateServiceIdentity = $grpc.ClientMethod<$17.GenerateServiceIdentityRequest, $1.Operation>(
      '/google.api.serviceusage.v1beta1.ServiceUsage/GenerateServiceIdentity',
      ($17.GenerateServiceIdentityRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Operation.fromBuffer(value));

  ServiceUsageClient(super.channel, {super.options, super.interceptors});

  /// Enables a service so that it can be used with a project.
  ///
  /// Operation response type: `google.protobuf.Empty`
  @$core.Deprecated('This method is deprecated')
  $grpc.ResponseFuture<$1.Operation> enableService($17.EnableServiceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$enableService, request, options: options);
  }

  /// Disables a service so that it can no longer be used with a project.
  /// This prevents unintended usage that may cause unexpected billing
  /// charges or security leaks.
  ///
  /// It is not valid to call the disable method on a service that is not
  /// currently enabled. Callers will receive a `FAILED_PRECONDITION` status if
  /// the target service is not currently enabled.
  ///
  /// Operation response type: `google.protobuf.Empty`
  @$core.Deprecated('This method is deprecated')
  $grpc.ResponseFuture<$1.Operation> disableService($17.DisableServiceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$disableService, request, options: options);
  }

  /// Returns the service configuration and enabled state for a given service.
  @$core.Deprecated('This method is deprecated')
  $grpc.ResponseFuture<$18.Service> getService($17.GetServiceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getService, request, options: options);
  }

  /// Lists all services available to the specified project, and the current
  /// state of those services with respect to the project. The list includes
  /// all public services, all services for which the calling user has the
  /// `servicemanagement.services.bind` permission, and all services that have
  /// already been enabled on the project. The list can be filtered to
  /// only include services in a specific state, for example to only include
  /// services enabled on the project.
  @$core.Deprecated('This method is deprecated')
  $grpc.ResponseFuture<$17.ListServicesResponse> listServices($17.ListServicesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listServices, request, options: options);
  }

  /// Enables multiple services on a project. The operation is atomic: if
  /// enabling any service fails, then the entire batch fails, and no state
  /// changes occur.
  ///
  /// Operation response type: `google.protobuf.Empty`
  @$core.Deprecated('This method is deprecated')
  $grpc.ResponseFuture<$1.Operation> batchEnableServices($17.BatchEnableServicesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$batchEnableServices, request, options: options);
  }

  /// Retrieves a summary of all quota information visible to the service
  /// consumer, organized by service metric. Each metric includes information
  /// about all of its defined limits. Each limit includes the limit
  /// configuration (quota unit, preciseness, default value), the current
  /// effective limit value, and all of the overrides applied to the limit.
  $grpc.ResponseFuture<$17.ListConsumerQuotaMetricsResponse> listConsumerQuotaMetrics($17.ListConsumerQuotaMetricsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listConsumerQuotaMetrics, request, options: options);
  }

  /// Retrieves a summary of quota information for a specific quota metric
  $grpc.ResponseFuture<$18.ConsumerQuotaMetric> getConsumerQuotaMetric($17.GetConsumerQuotaMetricRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getConsumerQuotaMetric, request, options: options);
  }

  /// Retrieves a summary of quota information for a specific quota limit.
  $grpc.ResponseFuture<$18.ConsumerQuotaLimit> getConsumerQuotaLimit($17.GetConsumerQuotaLimitRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getConsumerQuotaLimit, request, options: options);
  }

  /// Creates an admin override.
  /// An admin override is applied by an administrator of a parent folder or
  /// parent organization of the consumer receiving the override. An admin
  /// override is intended to limit the amount of quota the consumer can use out
  /// of the total quota pool allocated to all children of the folder or
  /// organization.
  $grpc.ResponseFuture<$1.Operation> createAdminOverride($17.CreateAdminOverrideRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createAdminOverride, request, options: options);
  }

  /// Updates an admin override.
  $grpc.ResponseFuture<$1.Operation> updateAdminOverride($17.UpdateAdminOverrideRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateAdminOverride, request, options: options);
  }

  /// Deletes an admin override.
  $grpc.ResponseFuture<$1.Operation> deleteAdminOverride($17.DeleteAdminOverrideRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteAdminOverride, request, options: options);
  }

  /// Lists all admin overrides on this limit.
  $grpc.ResponseFuture<$17.ListAdminOverridesResponse> listAdminOverrides($17.ListAdminOverridesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listAdminOverrides, request, options: options);
  }

  /// Creates or updates multiple admin overrides atomically, all on the
  /// same consumer, but on many different metrics or limits.
  /// The name field in the quota override message should not be set.
  $grpc.ResponseFuture<$1.Operation> importAdminOverrides($17.ImportAdminOverridesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$importAdminOverrides, request, options: options);
  }

  /// Creates a consumer override.
  /// A consumer override is applied to the consumer on its own authority to
  /// limit its own quota usage. Consumer overrides cannot be used to grant more
  /// quota than would be allowed by admin overrides, producer overrides, or the
  /// default limit of the service.
  $grpc.ResponseFuture<$1.Operation> createConsumerOverride($17.CreateConsumerOverrideRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createConsumerOverride, request, options: options);
  }

  /// Updates a consumer override.
  $grpc.ResponseFuture<$1.Operation> updateConsumerOverride($17.UpdateConsumerOverrideRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateConsumerOverride, request, options: options);
  }

  /// Deletes a consumer override.
  $grpc.ResponseFuture<$1.Operation> deleteConsumerOverride($17.DeleteConsumerOverrideRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteConsumerOverride, request, options: options);
  }

  /// Lists all consumer overrides on this limit.
  $grpc.ResponseFuture<$17.ListConsumerOverridesResponse> listConsumerOverrides($17.ListConsumerOverridesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listConsumerOverrides, request, options: options);
  }

  /// Creates or updates multiple consumer overrides atomically, all on the
  /// same consumer, but on many different metrics or limits.
  /// The name field in the quota override message should not be set.
  $grpc.ResponseFuture<$1.Operation> importConsumerOverrides($17.ImportConsumerOverridesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$importConsumerOverrides, request, options: options);
  }

  /// Generates service identity for service.
  $grpc.ResponseFuture<$1.Operation> generateServiceIdentity($17.GenerateServiceIdentityRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$generateServiceIdentity, request, options: options);
  }
}

@$pb.GrpcServiceName('google.api.serviceusage.v1beta1.ServiceUsage')
abstract class ServiceUsageServiceBase extends $grpc.Service {
  $core.String get $name => 'google.api.serviceusage.v1beta1.ServiceUsage';

  ServiceUsageServiceBase() {
    $addMethod($grpc.ServiceMethod<$17.EnableServiceRequest, $1.Operation>(
        'EnableService',
        enableService_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $17.EnableServiceRequest.fromBuffer(value),
        ($1.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$17.DisableServiceRequest, $1.Operation>(
        'DisableService',
        disableService_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $17.DisableServiceRequest.fromBuffer(value),
        ($1.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$17.GetServiceRequest, $18.Service>(
        'GetService',
        getService_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $17.GetServiceRequest.fromBuffer(value),
        ($18.Service value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$17.ListServicesRequest, $17.ListServicesResponse>(
        'ListServices',
        listServices_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $17.ListServicesRequest.fromBuffer(value),
        ($17.ListServicesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$17.BatchEnableServicesRequest, $1.Operation>(
        'BatchEnableServices',
        batchEnableServices_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $17.BatchEnableServicesRequest.fromBuffer(value),
        ($1.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$17.ListConsumerQuotaMetricsRequest, $17.ListConsumerQuotaMetricsResponse>(
        'ListConsumerQuotaMetrics',
        listConsumerQuotaMetrics_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $17.ListConsumerQuotaMetricsRequest.fromBuffer(value),
        ($17.ListConsumerQuotaMetricsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$17.GetConsumerQuotaMetricRequest, $18.ConsumerQuotaMetric>(
        'GetConsumerQuotaMetric',
        getConsumerQuotaMetric_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $17.GetConsumerQuotaMetricRequest.fromBuffer(value),
        ($18.ConsumerQuotaMetric value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$17.GetConsumerQuotaLimitRequest, $18.ConsumerQuotaLimit>(
        'GetConsumerQuotaLimit',
        getConsumerQuotaLimit_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $17.GetConsumerQuotaLimitRequest.fromBuffer(value),
        ($18.ConsumerQuotaLimit value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$17.CreateAdminOverrideRequest, $1.Operation>(
        'CreateAdminOverride',
        createAdminOverride_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $17.CreateAdminOverrideRequest.fromBuffer(value),
        ($1.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$17.UpdateAdminOverrideRequest, $1.Operation>(
        'UpdateAdminOverride',
        updateAdminOverride_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $17.UpdateAdminOverrideRequest.fromBuffer(value),
        ($1.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$17.DeleteAdminOverrideRequest, $1.Operation>(
        'DeleteAdminOverride',
        deleteAdminOverride_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $17.DeleteAdminOverrideRequest.fromBuffer(value),
        ($1.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$17.ListAdminOverridesRequest, $17.ListAdminOverridesResponse>(
        'ListAdminOverrides',
        listAdminOverrides_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $17.ListAdminOverridesRequest.fromBuffer(value),
        ($17.ListAdminOverridesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$17.ImportAdminOverridesRequest, $1.Operation>(
        'ImportAdminOverrides',
        importAdminOverrides_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $17.ImportAdminOverridesRequest.fromBuffer(value),
        ($1.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$17.CreateConsumerOverrideRequest, $1.Operation>(
        'CreateConsumerOverride',
        createConsumerOverride_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $17.CreateConsumerOverrideRequest.fromBuffer(value),
        ($1.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$17.UpdateConsumerOverrideRequest, $1.Operation>(
        'UpdateConsumerOverride',
        updateConsumerOverride_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $17.UpdateConsumerOverrideRequest.fromBuffer(value),
        ($1.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$17.DeleteConsumerOverrideRequest, $1.Operation>(
        'DeleteConsumerOverride',
        deleteConsumerOverride_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $17.DeleteConsumerOverrideRequest.fromBuffer(value),
        ($1.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$17.ListConsumerOverridesRequest, $17.ListConsumerOverridesResponse>(
        'ListConsumerOverrides',
        listConsumerOverrides_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $17.ListConsumerOverridesRequest.fromBuffer(value),
        ($17.ListConsumerOverridesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$17.ImportConsumerOverridesRequest, $1.Operation>(
        'ImportConsumerOverrides',
        importConsumerOverrides_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $17.ImportConsumerOverridesRequest.fromBuffer(value),
        ($1.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$17.GenerateServiceIdentityRequest, $1.Operation>(
        'GenerateServiceIdentity',
        generateServiceIdentity_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $17.GenerateServiceIdentityRequest.fromBuffer(value),
        ($1.Operation value) => value.writeToBuffer()));
  }

  $async.Future<$1.Operation> enableService_Pre($grpc.ServiceCall $call, $async.Future<$17.EnableServiceRequest> $request) async {
    return enableService($call, await $request);
  }

  $async.Future<$1.Operation> disableService_Pre($grpc.ServiceCall $call, $async.Future<$17.DisableServiceRequest> $request) async {
    return disableService($call, await $request);
  }

  $async.Future<$18.Service> getService_Pre($grpc.ServiceCall $call, $async.Future<$17.GetServiceRequest> $request) async {
    return getService($call, await $request);
  }

  $async.Future<$17.ListServicesResponse> listServices_Pre($grpc.ServiceCall $call, $async.Future<$17.ListServicesRequest> $request) async {
    return listServices($call, await $request);
  }

  $async.Future<$1.Operation> batchEnableServices_Pre($grpc.ServiceCall $call, $async.Future<$17.BatchEnableServicesRequest> $request) async {
    return batchEnableServices($call, await $request);
  }

  $async.Future<$17.ListConsumerQuotaMetricsResponse> listConsumerQuotaMetrics_Pre($grpc.ServiceCall $call, $async.Future<$17.ListConsumerQuotaMetricsRequest> $request) async {
    return listConsumerQuotaMetrics($call, await $request);
  }

  $async.Future<$18.ConsumerQuotaMetric> getConsumerQuotaMetric_Pre($grpc.ServiceCall $call, $async.Future<$17.GetConsumerQuotaMetricRequest> $request) async {
    return getConsumerQuotaMetric($call, await $request);
  }

  $async.Future<$18.ConsumerQuotaLimit> getConsumerQuotaLimit_Pre($grpc.ServiceCall $call, $async.Future<$17.GetConsumerQuotaLimitRequest> $request) async {
    return getConsumerQuotaLimit($call, await $request);
  }

  $async.Future<$1.Operation> createAdminOverride_Pre($grpc.ServiceCall $call, $async.Future<$17.CreateAdminOverrideRequest> $request) async {
    return createAdminOverride($call, await $request);
  }

  $async.Future<$1.Operation> updateAdminOverride_Pre($grpc.ServiceCall $call, $async.Future<$17.UpdateAdminOverrideRequest> $request) async {
    return updateAdminOverride($call, await $request);
  }

  $async.Future<$1.Operation> deleteAdminOverride_Pre($grpc.ServiceCall $call, $async.Future<$17.DeleteAdminOverrideRequest> $request) async {
    return deleteAdminOverride($call, await $request);
  }

  $async.Future<$17.ListAdminOverridesResponse> listAdminOverrides_Pre($grpc.ServiceCall $call, $async.Future<$17.ListAdminOverridesRequest> $request) async {
    return listAdminOverrides($call, await $request);
  }

  $async.Future<$1.Operation> importAdminOverrides_Pre($grpc.ServiceCall $call, $async.Future<$17.ImportAdminOverridesRequest> $request) async {
    return importAdminOverrides($call, await $request);
  }

  $async.Future<$1.Operation> createConsumerOverride_Pre($grpc.ServiceCall $call, $async.Future<$17.CreateConsumerOverrideRequest> $request) async {
    return createConsumerOverride($call, await $request);
  }

  $async.Future<$1.Operation> updateConsumerOverride_Pre($grpc.ServiceCall $call, $async.Future<$17.UpdateConsumerOverrideRequest> $request) async {
    return updateConsumerOverride($call, await $request);
  }

  $async.Future<$1.Operation> deleteConsumerOverride_Pre($grpc.ServiceCall $call, $async.Future<$17.DeleteConsumerOverrideRequest> $request) async {
    return deleteConsumerOverride($call, await $request);
  }

  $async.Future<$17.ListConsumerOverridesResponse> listConsumerOverrides_Pre($grpc.ServiceCall $call, $async.Future<$17.ListConsumerOverridesRequest> $request) async {
    return listConsumerOverrides($call, await $request);
  }

  $async.Future<$1.Operation> importConsumerOverrides_Pre($grpc.ServiceCall $call, $async.Future<$17.ImportConsumerOverridesRequest> $request) async {
    return importConsumerOverrides($call, await $request);
  }

  $async.Future<$1.Operation> generateServiceIdentity_Pre($grpc.ServiceCall $call, $async.Future<$17.GenerateServiceIdentityRequest> $request) async {
    return generateServiceIdentity($call, await $request);
  }

  $async.Future<$1.Operation> enableService($grpc.ServiceCall call, $17.EnableServiceRequest request);
  $async.Future<$1.Operation> disableService($grpc.ServiceCall call, $17.DisableServiceRequest request);
  $async.Future<$18.Service> getService($grpc.ServiceCall call, $17.GetServiceRequest request);
  $async.Future<$17.ListServicesResponse> listServices($grpc.ServiceCall call, $17.ListServicesRequest request);
  $async.Future<$1.Operation> batchEnableServices($grpc.ServiceCall call, $17.BatchEnableServicesRequest request);
  $async.Future<$17.ListConsumerQuotaMetricsResponse> listConsumerQuotaMetrics($grpc.ServiceCall call, $17.ListConsumerQuotaMetricsRequest request);
  $async.Future<$18.ConsumerQuotaMetric> getConsumerQuotaMetric($grpc.ServiceCall call, $17.GetConsumerQuotaMetricRequest request);
  $async.Future<$18.ConsumerQuotaLimit> getConsumerQuotaLimit($grpc.ServiceCall call, $17.GetConsumerQuotaLimitRequest request);
  $async.Future<$1.Operation> createAdminOverride($grpc.ServiceCall call, $17.CreateAdminOverrideRequest request);
  $async.Future<$1.Operation> updateAdminOverride($grpc.ServiceCall call, $17.UpdateAdminOverrideRequest request);
  $async.Future<$1.Operation> deleteAdminOverride($grpc.ServiceCall call, $17.DeleteAdminOverrideRequest request);
  $async.Future<$17.ListAdminOverridesResponse> listAdminOverrides($grpc.ServiceCall call, $17.ListAdminOverridesRequest request);
  $async.Future<$1.Operation> importAdminOverrides($grpc.ServiceCall call, $17.ImportAdminOverridesRequest request);
  $async.Future<$1.Operation> createConsumerOverride($grpc.ServiceCall call, $17.CreateConsumerOverrideRequest request);
  $async.Future<$1.Operation> updateConsumerOverride($grpc.ServiceCall call, $17.UpdateConsumerOverrideRequest request);
  $async.Future<$1.Operation> deleteConsumerOverride($grpc.ServiceCall call, $17.DeleteConsumerOverrideRequest request);
  $async.Future<$17.ListConsumerOverridesResponse> listConsumerOverrides($grpc.ServiceCall call, $17.ListConsumerOverridesRequest request);
  $async.Future<$1.Operation> importConsumerOverrides($grpc.ServiceCall call, $17.ImportConsumerOverridesRequest request);
  $async.Future<$1.Operation> generateServiceIdentity($grpc.ServiceCall call, $17.GenerateServiceIdentityRequest request);
}
