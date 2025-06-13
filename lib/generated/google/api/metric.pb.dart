//
//  Generated code. Do not modify.
//  source: google/api/metric.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../protobuf/duration.pb.dart' as $23;
import 'label.pb.dart' as $37;
import 'launch_stage.pbenum.dart' as $24;
import 'metric.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'metric.pbenum.dart';

/// Additional annotations that can be used to guide the usage of a metric.
class MetricDescriptor_MetricDescriptorMetadata extends $pb.GeneratedMessage {
  factory MetricDescriptor_MetricDescriptorMetadata({
  @$core.Deprecated('This field is deprecated.')
    $24.LaunchStage? launchStage,
    $23.Duration? samplePeriod,
    $23.Duration? ingestDelay,
    $core.Iterable<MetricDescriptor_MetricDescriptorMetadata_TimeSeriesResourceHierarchyLevel>? timeSeriesResourceHierarchyLevel,
  }) {
    final result = create();
    if (launchStage != null) result.launchStage = launchStage;
    if (samplePeriod != null) result.samplePeriod = samplePeriod;
    if (ingestDelay != null) result.ingestDelay = ingestDelay;
    if (timeSeriesResourceHierarchyLevel != null) result.timeSeriesResourceHierarchyLevel.addAll(timeSeriesResourceHierarchyLevel);
    return result;
  }

  MetricDescriptor_MetricDescriptorMetadata._();

  factory MetricDescriptor_MetricDescriptorMetadata.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory MetricDescriptor_MetricDescriptorMetadata.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MetricDescriptor.MetricDescriptorMetadata', package: const $pb.PackageName(_omitMessageNames ? '' : 'google.api'), createEmptyInstance: create)
    ..e<$24.LaunchStage>(1, _omitFieldNames ? '' : 'launchStage', $pb.PbFieldType.OE, defaultOrMaker: $24.LaunchStage.LAUNCH_STAGE_UNSPECIFIED, valueOf: $24.LaunchStage.valueOf, enumValues: $24.LaunchStage.values)
    ..aOM<$23.Duration>(2, _omitFieldNames ? '' : 'samplePeriod', subBuilder: $23.Duration.create)
    ..aOM<$23.Duration>(3, _omitFieldNames ? '' : 'ingestDelay', subBuilder: $23.Duration.create)
    ..pc<MetricDescriptor_MetricDescriptorMetadata_TimeSeriesResourceHierarchyLevel>(4, _omitFieldNames ? '' : 'timeSeriesResourceHierarchyLevel', $pb.PbFieldType.KE, valueOf: MetricDescriptor_MetricDescriptorMetadata_TimeSeriesResourceHierarchyLevel.valueOf, enumValues: MetricDescriptor_MetricDescriptorMetadata_TimeSeriesResourceHierarchyLevel.values, defaultEnumValue: MetricDescriptor_MetricDescriptorMetadata_TimeSeriesResourceHierarchyLevel.TIME_SERIES_RESOURCE_HIERARCHY_LEVEL_UNSPECIFIED)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MetricDescriptor_MetricDescriptorMetadata clone() => MetricDescriptor_MetricDescriptorMetadata()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MetricDescriptor_MetricDescriptorMetadata copyWith(void Function(MetricDescriptor_MetricDescriptorMetadata) updates) => super.copyWith((message) => updates(message as MetricDescriptor_MetricDescriptorMetadata)) as MetricDescriptor_MetricDescriptorMetadata;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MetricDescriptor_MetricDescriptorMetadata create() => MetricDescriptor_MetricDescriptorMetadata._();
  @$core.override
  MetricDescriptor_MetricDescriptorMetadata createEmptyInstance() => create();
  static $pb.PbList<MetricDescriptor_MetricDescriptorMetadata> createRepeated() => $pb.PbList<MetricDescriptor_MetricDescriptorMetadata>();
  @$core.pragma('dart2js:noInline')
  static MetricDescriptor_MetricDescriptorMetadata getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MetricDescriptor_MetricDescriptorMetadata>(create);
  static MetricDescriptor_MetricDescriptorMetadata? _defaultInstance;

  /// Deprecated. Must use the
  /// [MetricDescriptor.launch_stage][google.api.MetricDescriptor.launch_stage]
  /// instead.
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  $24.LaunchStage get launchStage => $_getN(0);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  set launchStage($24.LaunchStage value) => $_setField(1, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  $core.bool hasLaunchStage() => $_has(0);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(1)
  void clearLaunchStage() => $_clearField(1);

  /// The sampling period of metric data points. For metrics which are written
  /// periodically, consecutive data points are stored at this time interval,
  /// excluding data loss due to errors. Metrics with a higher granularity have
  /// a smaller sampling period.
  @$pb.TagNumber(2)
  $23.Duration get samplePeriod => $_getN(1);
  @$pb.TagNumber(2)
  set samplePeriod($23.Duration value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasSamplePeriod() => $_has(1);
  @$pb.TagNumber(2)
  void clearSamplePeriod() => $_clearField(2);
  @$pb.TagNumber(2)
  $23.Duration ensureSamplePeriod() => $_ensure(1);

  /// The delay of data points caused by ingestion. Data points older than this
  /// age are guaranteed to be ingested and available to be read, excluding
  /// data loss due to errors.
  @$pb.TagNumber(3)
  $23.Duration get ingestDelay => $_getN(2);
  @$pb.TagNumber(3)
  set ingestDelay($23.Duration value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasIngestDelay() => $_has(2);
  @$pb.TagNumber(3)
  void clearIngestDelay() => $_clearField(3);
  @$pb.TagNumber(3)
  $23.Duration ensureIngestDelay() => $_ensure(2);

  /// The scope of the timeseries data of the metric.
  @$pb.TagNumber(4)
  $pb.PbList<MetricDescriptor_MetricDescriptorMetadata_TimeSeriesResourceHierarchyLevel> get timeSeriesResourceHierarchyLevel => $_getList(3);
}

/// Defines a metric type and its schema. Once a metric descriptor is created,
/// deleting or altering it stops data collection and makes the metric type's
/// existing data unusable.
class MetricDescriptor extends $pb.GeneratedMessage {
  factory MetricDescriptor({
    $core.String? name,
    $core.Iterable<$37.LabelDescriptor>? labels,
    MetricDescriptor_MetricKind? metricKind,
    MetricDescriptor_ValueType? valueType,
    $core.String? unit,
    $core.String? description,
    $core.String? displayName,
    $core.String? type,
    MetricDescriptor_MetricDescriptorMetadata? metadata,
    $24.LaunchStage? launchStage,
    $core.Iterable<$core.String>? monitoredResourceTypes,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (labels != null) result.labels.addAll(labels);
    if (metricKind != null) result.metricKind = metricKind;
    if (valueType != null) result.valueType = valueType;
    if (unit != null) result.unit = unit;
    if (description != null) result.description = description;
    if (displayName != null) result.displayName = displayName;
    if (type != null) result.type = type;
    if (metadata != null) result.metadata = metadata;
    if (launchStage != null) result.launchStage = launchStage;
    if (monitoredResourceTypes != null) result.monitoredResourceTypes.addAll(monitoredResourceTypes);
    return result;
  }

  MetricDescriptor._();

  factory MetricDescriptor.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory MetricDescriptor.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MetricDescriptor', package: const $pb.PackageName(_omitMessageNames ? '' : 'google.api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..pc<$37.LabelDescriptor>(2, _omitFieldNames ? '' : 'labels', $pb.PbFieldType.PM, subBuilder: $37.LabelDescriptor.create)
    ..e<MetricDescriptor_MetricKind>(3, _omitFieldNames ? '' : 'metricKind', $pb.PbFieldType.OE, defaultOrMaker: MetricDescriptor_MetricKind.METRIC_KIND_UNSPECIFIED, valueOf: MetricDescriptor_MetricKind.valueOf, enumValues: MetricDescriptor_MetricKind.values)
    ..e<MetricDescriptor_ValueType>(4, _omitFieldNames ? '' : 'valueType', $pb.PbFieldType.OE, defaultOrMaker: MetricDescriptor_ValueType.VALUE_TYPE_UNSPECIFIED, valueOf: MetricDescriptor_ValueType.valueOf, enumValues: MetricDescriptor_ValueType.values)
    ..aOS(5, _omitFieldNames ? '' : 'unit')
    ..aOS(6, _omitFieldNames ? '' : 'description')
    ..aOS(7, _omitFieldNames ? '' : 'displayName')
    ..aOS(8, _omitFieldNames ? '' : 'type')
    ..aOM<MetricDescriptor_MetricDescriptorMetadata>(10, _omitFieldNames ? '' : 'metadata', subBuilder: MetricDescriptor_MetricDescriptorMetadata.create)
    ..e<$24.LaunchStage>(12, _omitFieldNames ? '' : 'launchStage', $pb.PbFieldType.OE, defaultOrMaker: $24.LaunchStage.LAUNCH_STAGE_UNSPECIFIED, valueOf: $24.LaunchStage.valueOf, enumValues: $24.LaunchStage.values)
    ..pPS(13, _omitFieldNames ? '' : 'monitoredResourceTypes')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MetricDescriptor clone() => MetricDescriptor()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MetricDescriptor copyWith(void Function(MetricDescriptor) updates) => super.copyWith((message) => updates(message as MetricDescriptor)) as MetricDescriptor;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MetricDescriptor create() => MetricDescriptor._();
  @$core.override
  MetricDescriptor createEmptyInstance() => create();
  static $pb.PbList<MetricDescriptor> createRepeated() => $pb.PbList<MetricDescriptor>();
  @$core.pragma('dart2js:noInline')
  static MetricDescriptor getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MetricDescriptor>(create);
  static MetricDescriptor? _defaultInstance;

  /// The resource name of the metric descriptor.
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  /// The set of labels that can be used to describe a specific
  /// instance of this metric type. For example, the
  /// `appengine.googleapis.com/http/server/response_latencies` metric
  /// type has a label for the HTTP response code, `response_code`, so
  /// you can look at latencies for successful responses or just
  /// for responses that failed.
  @$pb.TagNumber(2)
  $pb.PbList<$37.LabelDescriptor> get labels => $_getList(1);

  /// Whether the metric records instantaneous values, changes to a value, etc.
  /// Some combinations of `metric_kind` and `value_type` might not be supported.
  @$pb.TagNumber(3)
  MetricDescriptor_MetricKind get metricKind => $_getN(2);
  @$pb.TagNumber(3)
  set metricKind(MetricDescriptor_MetricKind value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasMetricKind() => $_has(2);
  @$pb.TagNumber(3)
  void clearMetricKind() => $_clearField(3);

  /// Whether the measurement is an integer, a floating-point number, etc.
  /// Some combinations of `metric_kind` and `value_type` might not be supported.
  @$pb.TagNumber(4)
  MetricDescriptor_ValueType get valueType => $_getN(3);
  @$pb.TagNumber(4)
  set valueType(MetricDescriptor_ValueType value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasValueType() => $_has(3);
  @$pb.TagNumber(4)
  void clearValueType() => $_clearField(4);

  /// The units in which the metric value is reported. It is only applicable
  /// if the `value_type` is `INT64`, `DOUBLE`, or `DISTRIBUTION`. The `unit`
  /// defines the representation of the stored metric values.
  ///
  /// Different systems might scale the values to be more easily displayed (so a
  /// value of `0.02kBy` _might_ be displayed as `20By`, and a value of
  /// `3523kBy` _might_ be displayed as `3.5MBy`). However, if the `unit` is
  /// `kBy`, then the value of the metric is always in thousands of bytes, no
  /// matter how it might be displayed.
  ///
  /// If you want a custom metric to record the exact number of CPU-seconds used
  /// by a job, you can create an `INT64 CUMULATIVE` metric whose `unit` is
  /// `s{CPU}` (or equivalently `1s{CPU}` or just `s`). If the job uses 12,005
  /// CPU-seconds, then the value is written as `12005`.
  ///
  /// Alternatively, if you want a custom metric to record data in a more
  /// granular way, you can create a `DOUBLE CUMULATIVE` metric whose `unit` is
  /// `ks{CPU}`, and then write the value `12.005` (which is `12005/1000`),
  /// or use `Kis{CPU}` and write `11.723` (which is `12005/1024`).
  ///
  /// The supported units are a subset of [The Unified Code for Units of
  /// Measure](https://unitsofmeasure.org/ucum.html) standard:
  ///
  /// **Basic units (UNIT)**
  ///
  /// * `bit`   bit
  /// * `By`    byte
  /// * `s`     second
  /// * `min`   minute
  /// * `h`     hour
  /// * `d`     day
  /// * `1`     dimensionless
  ///
  /// **Prefixes (PREFIX)**
  ///
  /// * `k`     kilo    (10^3)
  /// * `M`     mega    (10^6)
  /// * `G`     giga    (10^9)
  /// * `T`     tera    (10^12)
  /// * `P`     peta    (10^15)
  /// * `E`     exa     (10^18)
  /// * `Z`     zetta   (10^21)
  /// * `Y`     yotta   (10^24)
  ///
  /// * `m`     milli   (10^-3)
  /// * `u`     micro   (10^-6)
  /// * `n`     nano    (10^-9)
  /// * `p`     pico    (10^-12)
  /// * `f`     femto   (10^-15)
  /// * `a`     atto    (10^-18)
  /// * `z`     zepto   (10^-21)
  /// * `y`     yocto   (10^-24)
  ///
  /// * `Ki`    kibi    (2^10)
  /// * `Mi`    mebi    (2^20)
  /// * `Gi`    gibi    (2^30)
  /// * `Ti`    tebi    (2^40)
  /// * `Pi`    pebi    (2^50)
  ///
  /// **Grammar**
  ///
  /// The grammar also includes these connectors:
  ///
  /// * `/`    division or ratio (as an infix operator). For examples,
  ///          `kBy/{email}` or `MiBy/10ms` (although you should almost never
  ///          have `/s` in a metric `unit`; rates should always be computed at
  ///          query time from the underlying cumulative or delta value).
  /// * `.`    multiplication or composition (as an infix operator). For
  ///          examples, `GBy.d` or `k{watt}.h`.
  ///
  /// The grammar for a unit is as follows:
  ///
  ///     Expression = Component { "." Component } { "/" Component } ;
  ///
  ///     Component = ( [ PREFIX ] UNIT | "%" ) [ Annotation ]
  ///               | Annotation
  ///               | "1"
  ///               ;
  ///
  ///     Annotation = "{" NAME "}" ;
  ///
  /// Notes:
  ///
  /// * `Annotation` is just a comment if it follows a `UNIT`. If the annotation
  ///    is used alone, then the unit is equivalent to `1`. For examples,
  ///    `{request}/s == 1/s`, `By{transmitted}/s == By/s`.
  /// * `NAME` is a sequence of non-blank printable ASCII characters not
  ///    containing `{` or `}`.
  /// * `1` represents a unitary [dimensionless
  ///    unit](https://en.wikipedia.org/wiki/Dimensionless_quantity) of 1, such
  ///    as in `1/s`. It is typically used when none of the basic units are
  ///    appropriate. For example, "new users per day" can be represented as
  ///    `1/d` or `{new-users}/d` (and a metric value `5` would mean "5 new
  ///    users). Alternatively, "thousands of page views per day" would be
  ///    represented as `1000/d` or `k1/d` or `k{page_views}/d` (and a metric
  ///    value of `5.3` would mean "5300 page views per day").
  /// * `%` represents dimensionless value of 1/100, and annotates values giving
  ///    a percentage (so the metric values are typically in the range of 0..100,
  ///    and a metric value `3` means "3 percent").
  /// * `10^2.%` indicates a metric contains a ratio, typically in the range
  ///    0..1, that will be multiplied by 100 and displayed as a percentage
  ///    (so a metric value `0.03` means "3 percent").
  @$pb.TagNumber(5)
  $core.String get unit => $_getSZ(4);
  @$pb.TagNumber(5)
  set unit($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasUnit() => $_has(4);
  @$pb.TagNumber(5)
  void clearUnit() => $_clearField(5);

  /// A detailed description of the metric, which can be used in documentation.
  @$pb.TagNumber(6)
  $core.String get description => $_getSZ(5);
  @$pb.TagNumber(6)
  set description($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasDescription() => $_has(5);
  @$pb.TagNumber(6)
  void clearDescription() => $_clearField(6);

  /// A concise name for the metric, which can be displayed in user interfaces.
  /// Use sentence case without an ending period, for example "Request count".
  /// This field is optional but it is recommended to be set for any metrics
  /// associated with user-visible concepts, such as Quota.
  @$pb.TagNumber(7)
  $core.String get displayName => $_getSZ(6);
  @$pb.TagNumber(7)
  set displayName($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasDisplayName() => $_has(6);
  @$pb.TagNumber(7)
  void clearDisplayName() => $_clearField(7);

  /// The metric type, including its DNS name prefix. The type is not
  /// URL-encoded. All user-defined metric types have the DNS name
  /// `custom.googleapis.com` or `external.googleapis.com`. Metric types should
  /// use a natural hierarchical grouping. For example:
  ///
  ///     "custom.googleapis.com/invoice/paid/amount"
  ///     "external.googleapis.com/prometheus/up"
  ///     "appengine.googleapis.com/http/server/response_latencies"
  @$pb.TagNumber(8)
  $core.String get type => $_getSZ(7);
  @$pb.TagNumber(8)
  set type($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasType() => $_has(7);
  @$pb.TagNumber(8)
  void clearType() => $_clearField(8);

  /// Optional. Metadata which can be used to guide usage of the metric.
  @$pb.TagNumber(10)
  MetricDescriptor_MetricDescriptorMetadata get metadata => $_getN(8);
  @$pb.TagNumber(10)
  set metadata(MetricDescriptor_MetricDescriptorMetadata value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasMetadata() => $_has(8);
  @$pb.TagNumber(10)
  void clearMetadata() => $_clearField(10);
  @$pb.TagNumber(10)
  MetricDescriptor_MetricDescriptorMetadata ensureMetadata() => $_ensure(8);

  /// Optional. The launch stage of the metric definition.
  @$pb.TagNumber(12)
  $24.LaunchStage get launchStage => $_getN(9);
  @$pb.TagNumber(12)
  set launchStage($24.LaunchStage value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasLaunchStage() => $_has(9);
  @$pb.TagNumber(12)
  void clearLaunchStage() => $_clearField(12);

  /// Read-only. If present, then a [time
  /// series][google.monitoring.v3.TimeSeries], which is identified partially by
  /// a metric type and a
  /// [MonitoredResourceDescriptor][google.api.MonitoredResourceDescriptor], that
  /// is associated with this metric type can only be associated with one of the
  /// monitored resource types listed here.
  @$pb.TagNumber(13)
  $pb.PbList<$core.String> get monitoredResourceTypes => $_getList(10);
}

/// A specific metric, identified by specifying values for all of the
/// labels of a [`MetricDescriptor`][google.api.MetricDescriptor].
class Metric extends $pb.GeneratedMessage {
  factory Metric({
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? labels,
    $core.String? type,
  }) {
    final result = create();
    if (labels != null) result.labels.addEntries(labels);
    if (type != null) result.type = type;
    return result;
  }

  Metric._();

  factory Metric.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory Metric.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Metric', package: const $pb.PackageName(_omitMessageNames ? '' : 'google.api'), createEmptyInstance: create)
    ..m<$core.String, $core.String>(2, _omitFieldNames ? '' : 'labels', entryClassName: 'Metric.LabelsEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('google.api'))
    ..aOS(3, _omitFieldNames ? '' : 'type')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Metric clone() => Metric()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Metric copyWith(void Function(Metric) updates) => super.copyWith((message) => updates(message as Metric)) as Metric;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Metric create() => Metric._();
  @$core.override
  Metric createEmptyInstance() => create();
  static $pb.PbList<Metric> createRepeated() => $pb.PbList<Metric>();
  @$core.pragma('dart2js:noInline')
  static Metric getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Metric>(create);
  static Metric? _defaultInstance;

  /// The set of label values that uniquely identify this metric. All
  /// labels listed in the `MetricDescriptor` must be assigned values.
  @$pb.TagNumber(2)
  $pb.PbMap<$core.String, $core.String> get labels => $_getMap(0);

  /// An existing metric type, see
  /// [google.api.MetricDescriptor][google.api.MetricDescriptor]. For example,
  /// `custom.googleapis.com/invoice/paid/amount`.
  @$pb.TagNumber(3)
  $core.String get type => $_getSZ(1);
  @$pb.TagNumber(3)
  set type($core.String value) => $_setString(1, value);
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(3)
  void clearType() => $_clearField(3);
}


const $core.bool _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
