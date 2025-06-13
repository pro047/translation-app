//
//  Generated code. Do not modify.
//  source: google/rpc/error_details.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use errorInfoDescriptor instead')
const ErrorInfo$json = {
  '1': 'ErrorInfo',
  '2': [
    {'1': 'reason', '3': 1, '4': 1, '5': 9, '10': 'reason'},
    {'1': 'domain', '3': 2, '4': 1, '5': 9, '10': 'domain'},
    {'1': 'metadata', '3': 3, '4': 3, '5': 11, '6': '.google.rpc.ErrorInfo.MetadataEntry', '10': 'metadata'},
  ],
  '3': [ErrorInfo_MetadataEntry$json],
};

@$core.Deprecated('Use errorInfoDescriptor instead')
const ErrorInfo_MetadataEntry$json = {
  '1': 'MetadataEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `ErrorInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List errorInfoDescriptor = $convert.base64Decode(
    'CglFcnJvckluZm8SFgoGcmVhc29uGAEgASgJUgZyZWFzb24SFgoGZG9tYWluGAIgASgJUgZkb2'
    '1haW4SPwoIbWV0YWRhdGEYAyADKAsyIy5nb29nbGUucnBjLkVycm9ySW5mby5NZXRhZGF0YUVu'
    'dHJ5UghtZXRhZGF0YRo7Cg1NZXRhZGF0YUVudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbH'
    'VlGAIgASgJUgV2YWx1ZToCOAE=');

@$core.Deprecated('Use retryInfoDescriptor instead')
const RetryInfo$json = {
  '1': 'RetryInfo',
  '2': [
    {'1': 'retry_delay', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Duration', '10': 'retryDelay'},
  ],
};

/// Descriptor for `RetryInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List retryInfoDescriptor = $convert.base64Decode(
    'CglSZXRyeUluZm8SOgoLcmV0cnlfZGVsYXkYASABKAsyGS5nb29nbGUucHJvdG9idWYuRHVyYX'
    'Rpb25SCnJldHJ5RGVsYXk=');

@$core.Deprecated('Use debugInfoDescriptor instead')
const DebugInfo$json = {
  '1': 'DebugInfo',
  '2': [
    {'1': 'stack_entries', '3': 1, '4': 3, '5': 9, '10': 'stackEntries'},
    {'1': 'detail', '3': 2, '4': 1, '5': 9, '10': 'detail'},
  ],
};

/// Descriptor for `DebugInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List debugInfoDescriptor = $convert.base64Decode(
    'CglEZWJ1Z0luZm8SIwoNc3RhY2tfZW50cmllcxgBIAMoCVIMc3RhY2tFbnRyaWVzEhYKBmRldG'
    'FpbBgCIAEoCVIGZGV0YWls');

@$core.Deprecated('Use quotaFailureDescriptor instead')
const QuotaFailure$json = {
  '1': 'QuotaFailure',
  '2': [
    {'1': 'violations', '3': 1, '4': 3, '5': 11, '6': '.google.rpc.QuotaFailure.Violation', '10': 'violations'},
  ],
  '3': [QuotaFailure_Violation$json],
};

@$core.Deprecated('Use quotaFailureDescriptor instead')
const QuotaFailure_Violation$json = {
  '1': 'Violation',
  '2': [
    {'1': 'subject', '3': 1, '4': 1, '5': 9, '10': 'subject'},
    {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    {'1': 'api_service', '3': 3, '4': 1, '5': 9, '10': 'apiService'},
    {'1': 'quota_metric', '3': 4, '4': 1, '5': 9, '10': 'quotaMetric'},
    {'1': 'quota_id', '3': 5, '4': 1, '5': 9, '10': 'quotaId'},
    {'1': 'quota_dimensions', '3': 6, '4': 3, '5': 11, '6': '.google.rpc.QuotaFailure.Violation.QuotaDimensionsEntry', '10': 'quotaDimensions'},
    {'1': 'quota_value', '3': 7, '4': 1, '5': 3, '10': 'quotaValue'},
    {'1': 'future_quota_value', '3': 8, '4': 1, '5': 3, '9': 0, '10': 'futureQuotaValue', '17': true},
  ],
  '3': [QuotaFailure_Violation_QuotaDimensionsEntry$json],
  '8': [
    {'1': '_future_quota_value'},
  ],
};

@$core.Deprecated('Use quotaFailureDescriptor instead')
const QuotaFailure_Violation_QuotaDimensionsEntry$json = {
  '1': 'QuotaDimensionsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `QuotaFailure`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List quotaFailureDescriptor = $convert.base64Decode(
    'CgxRdW90YUZhaWx1cmUSQgoKdmlvbGF0aW9ucxgBIAMoCzIiLmdvb2dsZS5ycGMuUXVvdGFGYW'
    'lsdXJlLlZpb2xhdGlvblIKdmlvbGF0aW9ucxq5AwoJVmlvbGF0aW9uEhgKB3N1YmplY3QYASAB'
    'KAlSB3N1YmplY3QSIAoLZGVzY3JpcHRpb24YAiABKAlSC2Rlc2NyaXB0aW9uEh8KC2FwaV9zZX'
    'J2aWNlGAMgASgJUgphcGlTZXJ2aWNlEiEKDHF1b3RhX21ldHJpYxgEIAEoCVILcXVvdGFNZXRy'
    'aWMSGQoIcXVvdGFfaWQYBSABKAlSB3F1b3RhSWQSYgoQcXVvdGFfZGltZW5zaW9ucxgGIAMoCz'
    'I3Lmdvb2dsZS5ycGMuUXVvdGFGYWlsdXJlLlZpb2xhdGlvbi5RdW90YURpbWVuc2lvbnNFbnRy'
    'eVIPcXVvdGFEaW1lbnNpb25zEh8KC3F1b3RhX3ZhbHVlGAcgASgDUgpxdW90YVZhbHVlEjEKEm'
    'Z1dHVyZV9xdW90YV92YWx1ZRgIIAEoA0gAUhBmdXR1cmVRdW90YVZhbHVliAEBGkIKFFF1b3Rh'
    'RGltZW5zaW9uc0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgJUgV2YWx1ZT'
    'oCOAFCFQoTX2Z1dHVyZV9xdW90YV92YWx1ZQ==');

@$core.Deprecated('Use preconditionFailureDescriptor instead')
const PreconditionFailure$json = {
  '1': 'PreconditionFailure',
  '2': [
    {'1': 'violations', '3': 1, '4': 3, '5': 11, '6': '.google.rpc.PreconditionFailure.Violation', '10': 'violations'},
  ],
  '3': [PreconditionFailure_Violation$json],
};

@$core.Deprecated('Use preconditionFailureDescriptor instead')
const PreconditionFailure_Violation$json = {
  '1': 'Violation',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 9, '10': 'type'},
    {'1': 'subject', '3': 2, '4': 1, '5': 9, '10': 'subject'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
  ],
};

/// Descriptor for `PreconditionFailure`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List preconditionFailureDescriptor = $convert.base64Decode(
    'ChNQcmVjb25kaXRpb25GYWlsdXJlEkkKCnZpb2xhdGlvbnMYASADKAsyKS5nb29nbGUucnBjLl'
    'ByZWNvbmRpdGlvbkZhaWx1cmUuVmlvbGF0aW9uUgp2aW9sYXRpb25zGlsKCVZpb2xhdGlvbhIS'
    'CgR0eXBlGAEgASgJUgR0eXBlEhgKB3N1YmplY3QYAiABKAlSB3N1YmplY3QSIAoLZGVzY3JpcH'
    'Rpb24YAyABKAlSC2Rlc2NyaXB0aW9u');

@$core.Deprecated('Use badRequestDescriptor instead')
const BadRequest$json = {
  '1': 'BadRequest',
  '2': [
    {'1': 'field_violations', '3': 1, '4': 3, '5': 11, '6': '.google.rpc.BadRequest.FieldViolation', '10': 'fieldViolations'},
  ],
  '3': [BadRequest_FieldViolation$json],
};

@$core.Deprecated('Use badRequestDescriptor instead')
const BadRequest_FieldViolation$json = {
  '1': 'FieldViolation',
  '2': [
    {'1': 'field', '3': 1, '4': 1, '5': 9, '10': 'field'},
    {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    {'1': 'reason', '3': 3, '4': 1, '5': 9, '10': 'reason'},
    {'1': 'localized_message', '3': 4, '4': 1, '5': 11, '6': '.google.rpc.LocalizedMessage', '10': 'localizedMessage'},
  ],
};

/// Descriptor for `BadRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List badRequestDescriptor = $convert.base64Decode(
    'CgpCYWRSZXF1ZXN0ElAKEGZpZWxkX3Zpb2xhdGlvbnMYASADKAsyJS5nb29nbGUucnBjLkJhZF'
    'JlcXVlc3QuRmllbGRWaW9sYXRpb25SD2ZpZWxkVmlvbGF0aW9ucxqrAQoORmllbGRWaW9sYXRp'
    'b24SFAoFZmllbGQYASABKAlSBWZpZWxkEiAKC2Rlc2NyaXB0aW9uGAIgASgJUgtkZXNjcmlwdG'
    'lvbhIWCgZyZWFzb24YAyABKAlSBnJlYXNvbhJJChFsb2NhbGl6ZWRfbWVzc2FnZRgEIAEoCzIc'
    'Lmdvb2dsZS5ycGMuTG9jYWxpemVkTWVzc2FnZVIQbG9jYWxpemVkTWVzc2FnZQ==');

@$core.Deprecated('Use requestInfoDescriptor instead')
const RequestInfo$json = {
  '1': 'RequestInfo',
  '2': [
    {'1': 'request_id', '3': 1, '4': 1, '5': 9, '10': 'requestId'},
    {'1': 'serving_data', '3': 2, '4': 1, '5': 9, '10': 'servingData'},
  ],
};

/// Descriptor for `RequestInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestInfoDescriptor = $convert.base64Decode(
    'CgtSZXF1ZXN0SW5mbxIdCgpyZXF1ZXN0X2lkGAEgASgJUglyZXF1ZXN0SWQSIQoMc2VydmluZ1'
    '9kYXRhGAIgASgJUgtzZXJ2aW5nRGF0YQ==');

@$core.Deprecated('Use resourceInfoDescriptor instead')
const ResourceInfo$json = {
  '1': 'ResourceInfo',
  '2': [
    {'1': 'resource_type', '3': 1, '4': 1, '5': 9, '10': 'resourceType'},
    {'1': 'resource_name', '3': 2, '4': 1, '5': 9, '10': 'resourceName'},
    {'1': 'owner', '3': 3, '4': 1, '5': 9, '10': 'owner'},
    {'1': 'description', '3': 4, '4': 1, '5': 9, '10': 'description'},
  ],
};

/// Descriptor for `ResourceInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resourceInfoDescriptor = $convert.base64Decode(
    'CgxSZXNvdXJjZUluZm8SIwoNcmVzb3VyY2VfdHlwZRgBIAEoCVIMcmVzb3VyY2VUeXBlEiMKDX'
    'Jlc291cmNlX25hbWUYAiABKAlSDHJlc291cmNlTmFtZRIUCgVvd25lchgDIAEoCVIFb3duZXIS'
    'IAoLZGVzY3JpcHRpb24YBCABKAlSC2Rlc2NyaXB0aW9u');

@$core.Deprecated('Use helpDescriptor instead')
const Help$json = {
  '1': 'Help',
  '2': [
    {'1': 'links', '3': 1, '4': 3, '5': 11, '6': '.google.rpc.Help.Link', '10': 'links'},
  ],
  '3': [Help_Link$json],
};

@$core.Deprecated('Use helpDescriptor instead')
const Help_Link$json = {
  '1': 'Link',
  '2': [
    {'1': 'description', '3': 1, '4': 1, '5': 9, '10': 'description'},
    {'1': 'url', '3': 2, '4': 1, '5': 9, '10': 'url'},
  ],
};

/// Descriptor for `Help`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List helpDescriptor = $convert.base64Decode(
    'CgRIZWxwEisKBWxpbmtzGAEgAygLMhUuZ29vZ2xlLnJwYy5IZWxwLkxpbmtSBWxpbmtzGjoKBE'
    'xpbmsSIAoLZGVzY3JpcHRpb24YASABKAlSC2Rlc2NyaXB0aW9uEhAKA3VybBgCIAEoCVIDdXJs');

@$core.Deprecated('Use localizedMessageDescriptor instead')
const LocalizedMessage$json = {
  '1': 'LocalizedMessage',
  '2': [
    {'1': 'locale', '3': 1, '4': 1, '5': 9, '10': 'locale'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `LocalizedMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List localizedMessageDescriptor = $convert.base64Decode(
    'ChBMb2NhbGl6ZWRNZXNzYWdlEhYKBmxvY2FsZRgBIAEoCVIGbG9jYWxlEhgKB21lc3NhZ2UYAi'
    'ABKAlSB21lc3NhZ2U=');

