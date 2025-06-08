//
//  Generated code. Do not modify.
//  source: google/api/servicemanagement/v1/servicemanager.proto
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
import '../../service.pb.dart' as $14;
import 'resources.pb.dart' as $13;
import 'servicemanager.pb.dart' as $12;

export 'servicemanager.pb.dart';

/// [Google Service Management
/// API](https://cloud.google.com/service-infrastructure/docs/overview)
@$pb.GrpcServiceName('google.api.servicemanagement.v1.ServiceManager')
class ServiceManagerClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = 'servicemanagement.googleapis.com';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    'https://www.googleapis.com/auth/cloud-platform',
    'https://www.googleapis.com/auth/cloud-platform.read-only',
    'https://www.googleapis.com/auth/service.management',
    'https://www.googleapis.com/auth/service.management.readonly',
  ];

  static final _$listServices = $grpc.ClientMethod<$12.ListServicesRequest, $12.ListServicesResponse>(
      '/google.api.servicemanagement.v1.ServiceManager/ListServices',
      ($12.ListServicesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $12.ListServicesResponse.fromBuffer(value));
  static final _$getService = $grpc.ClientMethod<$12.GetServiceRequest, $13.ManagedService>(
      '/google.api.servicemanagement.v1.ServiceManager/GetService',
      ($12.GetServiceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $13.ManagedService.fromBuffer(value));
  static final _$createService = $grpc.ClientMethod<$12.CreateServiceRequest, $1.Operation>(
      '/google.api.servicemanagement.v1.ServiceManager/CreateService',
      ($12.CreateServiceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Operation.fromBuffer(value));
  static final _$deleteService = $grpc.ClientMethod<$12.DeleteServiceRequest, $1.Operation>(
      '/google.api.servicemanagement.v1.ServiceManager/DeleteService',
      ($12.DeleteServiceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Operation.fromBuffer(value));
  static final _$undeleteService = $grpc.ClientMethod<$12.UndeleteServiceRequest, $1.Operation>(
      '/google.api.servicemanagement.v1.ServiceManager/UndeleteService',
      ($12.UndeleteServiceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Operation.fromBuffer(value));
  static final _$listServiceConfigs = $grpc.ClientMethod<$12.ListServiceConfigsRequest, $12.ListServiceConfigsResponse>(
      '/google.api.servicemanagement.v1.ServiceManager/ListServiceConfigs',
      ($12.ListServiceConfigsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $12.ListServiceConfigsResponse.fromBuffer(value));
  static final _$getServiceConfig = $grpc.ClientMethod<$12.GetServiceConfigRequest, $14.Service>(
      '/google.api.servicemanagement.v1.ServiceManager/GetServiceConfig',
      ($12.GetServiceConfigRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $14.Service.fromBuffer(value));
  static final _$createServiceConfig = $grpc.ClientMethod<$12.CreateServiceConfigRequest, $14.Service>(
      '/google.api.servicemanagement.v1.ServiceManager/CreateServiceConfig',
      ($12.CreateServiceConfigRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $14.Service.fromBuffer(value));
  static final _$submitConfigSource = $grpc.ClientMethod<$12.SubmitConfigSourceRequest, $1.Operation>(
      '/google.api.servicemanagement.v1.ServiceManager/SubmitConfigSource',
      ($12.SubmitConfigSourceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Operation.fromBuffer(value));
  static final _$listServiceRollouts = $grpc.ClientMethod<$12.ListServiceRolloutsRequest, $12.ListServiceRolloutsResponse>(
      '/google.api.servicemanagement.v1.ServiceManager/ListServiceRollouts',
      ($12.ListServiceRolloutsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $12.ListServiceRolloutsResponse.fromBuffer(value));
  static final _$getServiceRollout = $grpc.ClientMethod<$12.GetServiceRolloutRequest, $13.Rollout>(
      '/google.api.servicemanagement.v1.ServiceManager/GetServiceRollout',
      ($12.GetServiceRolloutRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $13.Rollout.fromBuffer(value));
  static final _$createServiceRollout = $grpc.ClientMethod<$12.CreateServiceRolloutRequest, $1.Operation>(
      '/google.api.servicemanagement.v1.ServiceManager/CreateServiceRollout',
      ($12.CreateServiceRolloutRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Operation.fromBuffer(value));
  static final _$generateConfigReport = $grpc.ClientMethod<$12.GenerateConfigReportRequest, $12.GenerateConfigReportResponse>(
      '/google.api.servicemanagement.v1.ServiceManager/GenerateConfigReport',
      ($12.GenerateConfigReportRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $12.GenerateConfigReportResponse.fromBuffer(value));

  ServiceManagerClient(super.channel, {super.options, super.interceptors});

  /// Lists managed services.
  ///
  /// Returns all public services. For authenticated users, also returns all
  /// services the calling user has "servicemanagement.services.get" permission
  /// for.
  $grpc.ResponseFuture<$12.ListServicesResponse> listServices($12.ListServicesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listServices, request, options: options);
  }

  /// Gets a managed service. Authentication is required unless the service is
  /// public.
  $grpc.ResponseFuture<$13.ManagedService> getService($12.GetServiceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getService, request, options: options);
  }

  /// Creates a new managed service.
  ///
  /// A managed service is immutable, and is subject to mandatory 30-day
  /// data retention. You cannot move a service or recreate it within 30 days
  /// after deletion.
  ///
  /// One producer project can own no more than 500 services. For security and
  /// reliability purposes, a production service should be hosted in a
  /// dedicated producer project.
  ///
  /// Operation<response: ManagedService>
  $grpc.ResponseFuture<$1.Operation> createService($12.CreateServiceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createService, request, options: options);
  }

  /// Deletes a managed service. This method will change the service to the
  /// `Soft-Delete` state for 30 days. Within this period, service producers may
  /// call
  /// [UndeleteService][google.api.servicemanagement.v1.ServiceManager.UndeleteService]
  /// to restore the service. After 30 days, the service will be permanently
  /// deleted.
  ///
  /// Operation<response: google.protobuf.Empty>
  $grpc.ResponseFuture<$1.Operation> deleteService($12.DeleteServiceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteService, request, options: options);
  }

  /// Revives a previously deleted managed service. The method restores the
  /// service using the configuration at the time the service was deleted.
  /// The target service must exist and must have been deleted within the
  /// last 30 days.
  ///
  /// Operation<response: UndeleteServiceResponse>
  $grpc.ResponseFuture<$1.Operation> undeleteService($12.UndeleteServiceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$undeleteService, request, options: options);
  }

  /// Lists the history of the service configuration for a managed service,
  /// from the newest to the oldest.
  $grpc.ResponseFuture<$12.ListServiceConfigsResponse> listServiceConfigs($12.ListServiceConfigsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listServiceConfigs, request, options: options);
  }

  /// Gets a service configuration (version) for a managed service.
  $grpc.ResponseFuture<$14.Service> getServiceConfig($12.GetServiceConfigRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getServiceConfig, request, options: options);
  }

  /// Creates a new service configuration (version) for a managed service.
  /// This method only stores the service configuration. To roll out the service
  /// configuration to backend systems please call
  /// [CreateServiceRollout][google.api.servicemanagement.v1.ServiceManager.CreateServiceRollout].
  ///
  /// Only the 100 most recent service configurations and ones referenced by
  /// existing rollouts are kept for each service. The rest will be deleted
  /// eventually.
  $grpc.ResponseFuture<$14.Service> createServiceConfig($12.CreateServiceConfigRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createServiceConfig, request, options: options);
  }

  /// Creates a new service configuration (version) for a managed service based
  /// on
  /// user-supplied configuration source files (for example: OpenAPI
  /// Specification). This method stores the source configurations as well as the
  /// generated service configuration. To rollout the service configuration to
  /// other services,
  /// please call
  /// [CreateServiceRollout][google.api.servicemanagement.v1.ServiceManager.CreateServiceRollout].
  ///
  /// Only the 100 most recent configuration sources and ones referenced by
  /// existing service configurtions are kept for each service. The rest will be
  /// deleted eventually.
  ///
  /// Operation<response: SubmitConfigSourceResponse>
  $grpc.ResponseFuture<$1.Operation> submitConfigSource($12.SubmitConfigSourceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$submitConfigSource, request, options: options);
  }

  /// Lists the history of the service configuration rollouts for a managed
  /// service, from the newest to the oldest.
  $grpc.ResponseFuture<$12.ListServiceRolloutsResponse> listServiceRollouts($12.ListServiceRolloutsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listServiceRollouts, request, options: options);
  }

  /// Gets a service configuration
  /// [rollout][google.api.servicemanagement.v1.Rollout].
  $grpc.ResponseFuture<$13.Rollout> getServiceRollout($12.GetServiceRolloutRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getServiceRollout, request, options: options);
  }

  /// Creates a new service configuration rollout. Based on rollout, the
  /// Google Service Management will roll out the service configurations to
  /// different backend services. For example, the logging configuration will be
  /// pushed to Google Cloud Logging.
  ///
  /// Please note that any previous pending and running Rollouts and associated
  /// Operations will be automatically cancelled so that the latest Rollout will
  /// not be blocked by previous Rollouts.
  ///
  /// Only the 100 most recent (in any state) and the last 10 successful (if not
  /// already part of the set of 100 most recent) rollouts are kept for each
  /// service. The rest will be deleted eventually.
  ///
  /// Operation<response: Rollout>
  $grpc.ResponseFuture<$1.Operation> createServiceRollout($12.CreateServiceRolloutRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createServiceRollout, request, options: options);
  }

  /// Generates and returns a report (errors, warnings and changes from
  /// existing configurations) associated with
  /// GenerateConfigReportRequest.new_value
  ///
  /// If GenerateConfigReportRequest.old_value is specified,
  /// GenerateConfigReportRequest will contain a single ChangeReport based on the
  /// comparison between GenerateConfigReportRequest.new_value and
  /// GenerateConfigReportRequest.old_value.
  /// If GenerateConfigReportRequest.old_value is not specified, this method
  /// will compare GenerateConfigReportRequest.new_value with the last pushed
  /// service configuration.
  $grpc.ResponseFuture<$12.GenerateConfigReportResponse> generateConfigReport($12.GenerateConfigReportRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$generateConfigReport, request, options: options);
  }
}

@$pb.GrpcServiceName('google.api.servicemanagement.v1.ServiceManager')
abstract class ServiceManagerServiceBase extends $grpc.Service {
  $core.String get $name => 'google.api.servicemanagement.v1.ServiceManager';

  ServiceManagerServiceBase() {
    $addMethod($grpc.ServiceMethod<$12.ListServicesRequest, $12.ListServicesResponse>(
        'ListServices',
        listServices_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $12.ListServicesRequest.fromBuffer(value),
        ($12.ListServicesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$12.GetServiceRequest, $13.ManagedService>(
        'GetService',
        getService_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $12.GetServiceRequest.fromBuffer(value),
        ($13.ManagedService value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$12.CreateServiceRequest, $1.Operation>(
        'CreateService',
        createService_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $12.CreateServiceRequest.fromBuffer(value),
        ($1.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$12.DeleteServiceRequest, $1.Operation>(
        'DeleteService',
        deleteService_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $12.DeleteServiceRequest.fromBuffer(value),
        ($1.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$12.UndeleteServiceRequest, $1.Operation>(
        'UndeleteService',
        undeleteService_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $12.UndeleteServiceRequest.fromBuffer(value),
        ($1.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$12.ListServiceConfigsRequest, $12.ListServiceConfigsResponse>(
        'ListServiceConfigs',
        listServiceConfigs_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $12.ListServiceConfigsRequest.fromBuffer(value),
        ($12.ListServiceConfigsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$12.GetServiceConfigRequest, $14.Service>(
        'GetServiceConfig',
        getServiceConfig_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $12.GetServiceConfigRequest.fromBuffer(value),
        ($14.Service value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$12.CreateServiceConfigRequest, $14.Service>(
        'CreateServiceConfig',
        createServiceConfig_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $12.CreateServiceConfigRequest.fromBuffer(value),
        ($14.Service value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$12.SubmitConfigSourceRequest, $1.Operation>(
        'SubmitConfigSource',
        submitConfigSource_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $12.SubmitConfigSourceRequest.fromBuffer(value),
        ($1.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$12.ListServiceRolloutsRequest, $12.ListServiceRolloutsResponse>(
        'ListServiceRollouts',
        listServiceRollouts_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $12.ListServiceRolloutsRequest.fromBuffer(value),
        ($12.ListServiceRolloutsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$12.GetServiceRolloutRequest, $13.Rollout>(
        'GetServiceRollout',
        getServiceRollout_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $12.GetServiceRolloutRequest.fromBuffer(value),
        ($13.Rollout value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$12.CreateServiceRolloutRequest, $1.Operation>(
        'CreateServiceRollout',
        createServiceRollout_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $12.CreateServiceRolloutRequest.fromBuffer(value),
        ($1.Operation value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$12.GenerateConfigReportRequest, $12.GenerateConfigReportResponse>(
        'GenerateConfigReport',
        generateConfigReport_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $12.GenerateConfigReportRequest.fromBuffer(value),
        ($12.GenerateConfigReportResponse value) => value.writeToBuffer()));
  }

  $async.Future<$12.ListServicesResponse> listServices_Pre($grpc.ServiceCall $call, $async.Future<$12.ListServicesRequest> $request) async {
    return listServices($call, await $request);
  }

  $async.Future<$13.ManagedService> getService_Pre($grpc.ServiceCall $call, $async.Future<$12.GetServiceRequest> $request) async {
    return getService($call, await $request);
  }

  $async.Future<$1.Operation> createService_Pre($grpc.ServiceCall $call, $async.Future<$12.CreateServiceRequest> $request) async {
    return createService($call, await $request);
  }

  $async.Future<$1.Operation> deleteService_Pre($grpc.ServiceCall $call, $async.Future<$12.DeleteServiceRequest> $request) async {
    return deleteService($call, await $request);
  }

  $async.Future<$1.Operation> undeleteService_Pre($grpc.ServiceCall $call, $async.Future<$12.UndeleteServiceRequest> $request) async {
    return undeleteService($call, await $request);
  }

  $async.Future<$12.ListServiceConfigsResponse> listServiceConfigs_Pre($grpc.ServiceCall $call, $async.Future<$12.ListServiceConfigsRequest> $request) async {
    return listServiceConfigs($call, await $request);
  }

  $async.Future<$14.Service> getServiceConfig_Pre($grpc.ServiceCall $call, $async.Future<$12.GetServiceConfigRequest> $request) async {
    return getServiceConfig($call, await $request);
  }

  $async.Future<$14.Service> createServiceConfig_Pre($grpc.ServiceCall $call, $async.Future<$12.CreateServiceConfigRequest> $request) async {
    return createServiceConfig($call, await $request);
  }

  $async.Future<$1.Operation> submitConfigSource_Pre($grpc.ServiceCall $call, $async.Future<$12.SubmitConfigSourceRequest> $request) async {
    return submitConfigSource($call, await $request);
  }

  $async.Future<$12.ListServiceRolloutsResponse> listServiceRollouts_Pre($grpc.ServiceCall $call, $async.Future<$12.ListServiceRolloutsRequest> $request) async {
    return listServiceRollouts($call, await $request);
  }

  $async.Future<$13.Rollout> getServiceRollout_Pre($grpc.ServiceCall $call, $async.Future<$12.GetServiceRolloutRequest> $request) async {
    return getServiceRollout($call, await $request);
  }

  $async.Future<$1.Operation> createServiceRollout_Pre($grpc.ServiceCall $call, $async.Future<$12.CreateServiceRolloutRequest> $request) async {
    return createServiceRollout($call, await $request);
  }

  $async.Future<$12.GenerateConfigReportResponse> generateConfigReport_Pre($grpc.ServiceCall $call, $async.Future<$12.GenerateConfigReportRequest> $request) async {
    return generateConfigReport($call, await $request);
  }

  $async.Future<$12.ListServicesResponse> listServices($grpc.ServiceCall call, $12.ListServicesRequest request);
  $async.Future<$13.ManagedService> getService($grpc.ServiceCall call, $12.GetServiceRequest request);
  $async.Future<$1.Operation> createService($grpc.ServiceCall call, $12.CreateServiceRequest request);
  $async.Future<$1.Operation> deleteService($grpc.ServiceCall call, $12.DeleteServiceRequest request);
  $async.Future<$1.Operation> undeleteService($grpc.ServiceCall call, $12.UndeleteServiceRequest request);
  $async.Future<$12.ListServiceConfigsResponse> listServiceConfigs($grpc.ServiceCall call, $12.ListServiceConfigsRequest request);
  $async.Future<$14.Service> getServiceConfig($grpc.ServiceCall call, $12.GetServiceConfigRequest request);
  $async.Future<$14.Service> createServiceConfig($grpc.ServiceCall call, $12.CreateServiceConfigRequest request);
  $async.Future<$1.Operation> submitConfigSource($grpc.ServiceCall call, $12.SubmitConfigSourceRequest request);
  $async.Future<$12.ListServiceRolloutsResponse> listServiceRollouts($grpc.ServiceCall call, $12.ListServiceRolloutsRequest request);
  $async.Future<$13.Rollout> getServiceRollout($grpc.ServiceCall call, $12.GetServiceRolloutRequest request);
  $async.Future<$1.Operation> createServiceRollout($grpc.ServiceCall call, $12.CreateServiceRolloutRequest request);
  $async.Future<$12.GenerateConfigReportResponse> generateConfigReport($grpc.ServiceCall call, $12.GenerateConfigReportRequest request);
}
