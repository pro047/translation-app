//
//  Generated code. Do not modify.
//  source: google/cloud/speech/v1/cloud_speech.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// The encoding of the audio data sent in the request.
///
/// All encodings support only 1 channel (mono) audio, unless the
/// `audio_channel_count` and `enable_separate_recognition_per_channel` fields
/// are set.
///
/// For best results, the audio source should be captured and transmitted using
/// a lossless encoding (`FLAC` or `LINEAR16`). The accuracy of the speech
/// recognition can be reduced if lossy codecs are used to capture or transmit
/// audio, particularly if background noise is present. Lossy codecs include
/// `MULAW`, `AMR`, `AMR_WB`, `OGG_OPUS`, `SPEEX_WITH_HEADER_BYTE`, `MP3`,
/// and `WEBM_OPUS`.
///
/// The `FLAC` and `WAV` audio file formats include a header that describes the
/// included audio content. You can request recognition for `WAV` files that
/// contain either `LINEAR16` or `MULAW` encoded audio.
/// If you send `FLAC` or `WAV` audio file format in
/// your request, you do not need to specify an `AudioEncoding`; the audio
/// encoding format is determined from the file header. If you specify
/// an `AudioEncoding` when you send  send `FLAC` or `WAV` audio, the
/// encoding configuration must match the encoding described in the audio
/// header; otherwise the request returns an
/// [google.rpc.Code.INVALID_ARGUMENT][google.rpc.Code.INVALID_ARGUMENT] error
/// code.
class RecognitionConfig_AudioEncoding extends $pb.ProtobufEnum {
  /// Not specified.
  static const RecognitionConfig_AudioEncoding ENCODING_UNSPECIFIED = RecognitionConfig_AudioEncoding._(0, _omitEnumNames ? '' : 'ENCODING_UNSPECIFIED');
  /// Uncompressed 16-bit signed little-endian samples (Linear PCM).
  static const RecognitionConfig_AudioEncoding LINEAR16 = RecognitionConfig_AudioEncoding._(1, _omitEnumNames ? '' : 'LINEAR16');
  /// `FLAC` (Free Lossless Audio
  /// Codec) is the recommended encoding because it is
  /// lossless--therefore recognition is not compromised--and
  /// requires only about half the bandwidth of `LINEAR16`. `FLAC` stream
  /// encoding supports 16-bit and 24-bit samples, however, not all fields in
  /// `STREAMINFO` are supported.
  static const RecognitionConfig_AudioEncoding FLAC = RecognitionConfig_AudioEncoding._(2, _omitEnumNames ? '' : 'FLAC');
  /// 8-bit samples that compand 14-bit audio samples using G.711 PCMU/mu-law.
  static const RecognitionConfig_AudioEncoding MULAW = RecognitionConfig_AudioEncoding._(3, _omitEnumNames ? '' : 'MULAW');
  /// Adaptive Multi-Rate Narrowband codec. `sample_rate_hertz` must be 8000.
  static const RecognitionConfig_AudioEncoding AMR = RecognitionConfig_AudioEncoding._(4, _omitEnumNames ? '' : 'AMR');
  /// Adaptive Multi-Rate Wideband codec. `sample_rate_hertz` must be 16000.
  static const RecognitionConfig_AudioEncoding AMR_WB = RecognitionConfig_AudioEncoding._(5, _omitEnumNames ? '' : 'AMR_WB');
  /// Opus encoded audio frames in Ogg container
  /// ([OggOpus](https://wiki.xiph.org/OggOpus)).
  /// `sample_rate_hertz` must be one of 8000, 12000, 16000, 24000, or 48000.
  static const RecognitionConfig_AudioEncoding OGG_OPUS = RecognitionConfig_AudioEncoding._(6, _omitEnumNames ? '' : 'OGG_OPUS');
  /// Although the use of lossy encodings is not recommended, if a very low
  /// bitrate encoding is required, `OGG_OPUS` is highly preferred over
  /// Speex encoding. The [Speex](https://speex.org/)  encoding supported by
  /// Cloud Speech API has a header byte in each block, as in MIME type
  /// `audio/x-speex-with-header-byte`.
  /// It is a variant of the RTP Speex encoding defined in
  /// [RFC 5574](https://tools.ietf.org/html/rfc5574).
  /// The stream is a sequence of blocks, one block per RTP packet. Each block
  /// starts with a byte containing the length of the block, in bytes, followed
  /// by one or more frames of Speex data, padded to an integral number of
  /// bytes (octets) as specified in RFC 5574. In other words, each RTP header
  /// is replaced with a single byte containing the block length. Only Speex
  /// wideband is supported. `sample_rate_hertz` must be 16000.
  static const RecognitionConfig_AudioEncoding SPEEX_WITH_HEADER_BYTE = RecognitionConfig_AudioEncoding._(7, _omitEnumNames ? '' : 'SPEEX_WITH_HEADER_BYTE');
  /// MP3 audio. MP3 encoding is a Beta feature and only available in
  /// v1p1beta1. Support all standard MP3 bitrates (which range from 32-320
  /// kbps). When using this encoding, `sample_rate_hertz` has to match the
  /// sample rate of the file being used.
  static const RecognitionConfig_AudioEncoding MP3 = RecognitionConfig_AudioEncoding._(8, _omitEnumNames ? '' : 'MP3');
  /// Opus encoded audio frames in WebM container
  /// ([OggOpus](https://wiki.xiph.org/OggOpus)). `sample_rate_hertz` must be
  /// one of 8000, 12000, 16000, 24000, or 48000.
  static const RecognitionConfig_AudioEncoding WEBM_OPUS = RecognitionConfig_AudioEncoding._(9, _omitEnumNames ? '' : 'WEBM_OPUS');

  static const $core.List<RecognitionConfig_AudioEncoding> values = <RecognitionConfig_AudioEncoding> [
    ENCODING_UNSPECIFIED,
    LINEAR16,
    FLAC,
    MULAW,
    AMR,
    AMR_WB,
    OGG_OPUS,
    SPEEX_WITH_HEADER_BYTE,
    MP3,
    WEBM_OPUS,
  ];

  static final $core.List<RecognitionConfig_AudioEncoding?> _byValue = $pb.ProtobufEnum.$_initByValueList(values, 9);
  static RecognitionConfig_AudioEncoding? valueOf($core.int value) =>  value < 0 || value >= _byValue.length ? null : _byValue[value];

  const RecognitionConfig_AudioEncoding._(super.value, super.name);
}

/// Use case categories that the audio recognition request can be described
/// by.
class RecognitionMetadata_InteractionType extends $pb.ProtobufEnum {
  /// Use case is either unknown or is something other than one of the other
  /// values below.
  static const RecognitionMetadata_InteractionType INTERACTION_TYPE_UNSPECIFIED = RecognitionMetadata_InteractionType._(0, _omitEnumNames ? '' : 'INTERACTION_TYPE_UNSPECIFIED');
  /// Multiple people in a conversation or discussion. For example in a
  /// meeting with two or more people actively participating. Typically
  /// all the primary people speaking would be in the same room (if not,
  /// see PHONE_CALL)
  static const RecognitionMetadata_InteractionType DISCUSSION = RecognitionMetadata_InteractionType._(1, _omitEnumNames ? '' : 'DISCUSSION');
  /// One or more persons lecturing or presenting to others, mostly
  /// uninterrupted.
  static const RecognitionMetadata_InteractionType PRESENTATION = RecognitionMetadata_InteractionType._(2, _omitEnumNames ? '' : 'PRESENTATION');
  /// A phone-call or video-conference in which two or more people, who are
  /// not in the same room, are actively participating.
  static const RecognitionMetadata_InteractionType PHONE_CALL = RecognitionMetadata_InteractionType._(3, _omitEnumNames ? '' : 'PHONE_CALL');
  /// A recorded message intended for another person to listen to.
  static const RecognitionMetadata_InteractionType VOICEMAIL = RecognitionMetadata_InteractionType._(4, _omitEnumNames ? '' : 'VOICEMAIL');
  /// Professionally produced audio (eg. TV Show, Podcast).
  static const RecognitionMetadata_InteractionType PROFESSIONALLY_PRODUCED = RecognitionMetadata_InteractionType._(5, _omitEnumNames ? '' : 'PROFESSIONALLY_PRODUCED');
  /// Transcribe spoken questions and queries into text.
  static const RecognitionMetadata_InteractionType VOICE_SEARCH = RecognitionMetadata_InteractionType._(6, _omitEnumNames ? '' : 'VOICE_SEARCH');
  /// Transcribe voice commands, such as for controlling a device.
  static const RecognitionMetadata_InteractionType VOICE_COMMAND = RecognitionMetadata_InteractionType._(7, _omitEnumNames ? '' : 'VOICE_COMMAND');
  /// Transcribe speech to text to create a written document, such as a
  /// text-message, email or report.
  static const RecognitionMetadata_InteractionType DICTATION = RecognitionMetadata_InteractionType._(8, _omitEnumNames ? '' : 'DICTATION');

  static const $core.List<RecognitionMetadata_InteractionType> values = <RecognitionMetadata_InteractionType> [
    INTERACTION_TYPE_UNSPECIFIED,
    DISCUSSION,
    PRESENTATION,
    PHONE_CALL,
    VOICEMAIL,
    PROFESSIONALLY_PRODUCED,
    VOICE_SEARCH,
    VOICE_COMMAND,
    DICTATION,
  ];

  static final $core.List<RecognitionMetadata_InteractionType?> _byValue = $pb.ProtobufEnum.$_initByValueList(values, 8);
  static RecognitionMetadata_InteractionType? valueOf($core.int value) =>  value < 0 || value >= _byValue.length ? null : _byValue[value];

  const RecognitionMetadata_InteractionType._(super.value, super.name);
}

/// Enumerates the types of capture settings describing an audio file.
class RecognitionMetadata_MicrophoneDistance extends $pb.ProtobufEnum {
  /// Audio type is not known.
  static const RecognitionMetadata_MicrophoneDistance MICROPHONE_DISTANCE_UNSPECIFIED = RecognitionMetadata_MicrophoneDistance._(0, _omitEnumNames ? '' : 'MICROPHONE_DISTANCE_UNSPECIFIED');
  /// The audio was captured from a closely placed microphone. Eg. phone,
  /// dictaphone, or handheld microphone. Generally if there speaker is within
  /// 1 meter of the microphone.
  static const RecognitionMetadata_MicrophoneDistance NEARFIELD = RecognitionMetadata_MicrophoneDistance._(1, _omitEnumNames ? '' : 'NEARFIELD');
  /// The speaker if within 3 meters of the microphone.
  static const RecognitionMetadata_MicrophoneDistance MIDFIELD = RecognitionMetadata_MicrophoneDistance._(2, _omitEnumNames ? '' : 'MIDFIELD');
  /// The speaker is more than 3 meters away from the microphone.
  static const RecognitionMetadata_MicrophoneDistance FARFIELD = RecognitionMetadata_MicrophoneDistance._(3, _omitEnumNames ? '' : 'FARFIELD');

  static const $core.List<RecognitionMetadata_MicrophoneDistance> values = <RecognitionMetadata_MicrophoneDistance> [
    MICROPHONE_DISTANCE_UNSPECIFIED,
    NEARFIELD,
    MIDFIELD,
    FARFIELD,
  ];

  static final $core.List<RecognitionMetadata_MicrophoneDistance?> _byValue = $pb.ProtobufEnum.$_initByValueList(values, 3);
  static RecognitionMetadata_MicrophoneDistance? valueOf($core.int value) =>  value < 0 || value >= _byValue.length ? null : _byValue[value];

  const RecognitionMetadata_MicrophoneDistance._(super.value, super.name);
}

/// The original media the speech was recorded on.
class RecognitionMetadata_OriginalMediaType extends $pb.ProtobufEnum {
  /// Unknown original media type.
  static const RecognitionMetadata_OriginalMediaType ORIGINAL_MEDIA_TYPE_UNSPECIFIED = RecognitionMetadata_OriginalMediaType._(0, _omitEnumNames ? '' : 'ORIGINAL_MEDIA_TYPE_UNSPECIFIED');
  /// The speech data is an audio recording.
  static const RecognitionMetadata_OriginalMediaType AUDIO = RecognitionMetadata_OriginalMediaType._(1, _omitEnumNames ? '' : 'AUDIO');
  /// The speech data originally recorded on a video.
  static const RecognitionMetadata_OriginalMediaType VIDEO = RecognitionMetadata_OriginalMediaType._(2, _omitEnumNames ? '' : 'VIDEO');

  static const $core.List<RecognitionMetadata_OriginalMediaType> values = <RecognitionMetadata_OriginalMediaType> [
    ORIGINAL_MEDIA_TYPE_UNSPECIFIED,
    AUDIO,
    VIDEO,
  ];

  static final $core.List<RecognitionMetadata_OriginalMediaType?> _byValue = $pb.ProtobufEnum.$_initByValueList(values, 2);
  static RecognitionMetadata_OriginalMediaType? valueOf($core.int value) =>  value < 0 || value >= _byValue.length ? null : _byValue[value];

  const RecognitionMetadata_OriginalMediaType._(super.value, super.name);
}

/// The type of device the speech was recorded with.
class RecognitionMetadata_RecordingDeviceType extends $pb.ProtobufEnum {
  /// The recording device is unknown.
  static const RecognitionMetadata_RecordingDeviceType RECORDING_DEVICE_TYPE_UNSPECIFIED = RecognitionMetadata_RecordingDeviceType._(0, _omitEnumNames ? '' : 'RECORDING_DEVICE_TYPE_UNSPECIFIED');
  /// Speech was recorded on a smartphone.
  static const RecognitionMetadata_RecordingDeviceType SMARTPHONE = RecognitionMetadata_RecordingDeviceType._(1, _omitEnumNames ? '' : 'SMARTPHONE');
  /// Speech was recorded using a personal computer or tablet.
  static const RecognitionMetadata_RecordingDeviceType PC = RecognitionMetadata_RecordingDeviceType._(2, _omitEnumNames ? '' : 'PC');
  /// Speech was recorded over a phone line.
  static const RecognitionMetadata_RecordingDeviceType PHONE_LINE = RecognitionMetadata_RecordingDeviceType._(3, _omitEnumNames ? '' : 'PHONE_LINE');
  /// Speech was recorded in a vehicle.
  static const RecognitionMetadata_RecordingDeviceType VEHICLE = RecognitionMetadata_RecordingDeviceType._(4, _omitEnumNames ? '' : 'VEHICLE');
  /// Speech was recorded outdoors.
  static const RecognitionMetadata_RecordingDeviceType OTHER_OUTDOOR_DEVICE = RecognitionMetadata_RecordingDeviceType._(5, _omitEnumNames ? '' : 'OTHER_OUTDOOR_DEVICE');
  /// Speech was recorded indoors.
  static const RecognitionMetadata_RecordingDeviceType OTHER_INDOOR_DEVICE = RecognitionMetadata_RecordingDeviceType._(6, _omitEnumNames ? '' : 'OTHER_INDOOR_DEVICE');

  static const $core.List<RecognitionMetadata_RecordingDeviceType> values = <RecognitionMetadata_RecordingDeviceType> [
    RECORDING_DEVICE_TYPE_UNSPECIFIED,
    SMARTPHONE,
    PC,
    PHONE_LINE,
    VEHICLE,
    OTHER_OUTDOOR_DEVICE,
    OTHER_INDOOR_DEVICE,
  ];

  static final $core.List<RecognitionMetadata_RecordingDeviceType?> _byValue = $pb.ProtobufEnum.$_initByValueList(values, 6);
  static RecognitionMetadata_RecordingDeviceType? valueOf($core.int value) =>  value < 0 || value >= _byValue.length ? null : _byValue[value];

  const RecognitionMetadata_RecordingDeviceType._(super.value, super.name);
}

/// Indicates the type of speech event.
class StreamingRecognizeResponse_SpeechEventType extends $pb.ProtobufEnum {
  /// No speech event specified.
  static const StreamingRecognizeResponse_SpeechEventType SPEECH_EVENT_UNSPECIFIED = StreamingRecognizeResponse_SpeechEventType._(0, _omitEnumNames ? '' : 'SPEECH_EVENT_UNSPECIFIED');
  /// This event indicates that the server has detected the end of the user's
  /// speech utterance and expects no additional speech. Therefore, the server
  /// will not process additional audio (although it may subsequently return
  /// additional results). The client should stop sending additional audio
  /// data, half-close the gRPC connection, and wait for any additional results
  /// until the server closes the gRPC connection. This event is only sent if
  /// `single_utterance` was set to `true`, and is not used otherwise.
  static const StreamingRecognizeResponse_SpeechEventType END_OF_SINGLE_UTTERANCE = StreamingRecognizeResponse_SpeechEventType._(1, _omitEnumNames ? '' : 'END_OF_SINGLE_UTTERANCE');
  /// This event indicates that the server has detected the beginning of human
  /// voice activity in the stream. This event can be returned multiple times
  /// if speech starts and stops repeatedly throughout the stream. This event
  /// is only sent if `voice_activity_events` is set to true.
  static const StreamingRecognizeResponse_SpeechEventType SPEECH_ACTIVITY_BEGIN = StreamingRecognizeResponse_SpeechEventType._(2, _omitEnumNames ? '' : 'SPEECH_ACTIVITY_BEGIN');
  /// This event indicates that the server has detected the end of human voice
  /// activity in the stream. This event can be returned multiple times if
  /// speech starts and stops repeatedly throughout the stream. This event is
  /// only sent if `voice_activity_events` is set to true.
  static const StreamingRecognizeResponse_SpeechEventType SPEECH_ACTIVITY_END = StreamingRecognizeResponse_SpeechEventType._(3, _omitEnumNames ? '' : 'SPEECH_ACTIVITY_END');
  /// This event indicates that the user-set timeout for speech activity begin
  /// or end has exceeded. Upon receiving this event, the client is expected to
  /// send a half close. Further audio will not be processed.
  static const StreamingRecognizeResponse_SpeechEventType SPEECH_ACTIVITY_TIMEOUT = StreamingRecognizeResponse_SpeechEventType._(4, _omitEnumNames ? '' : 'SPEECH_ACTIVITY_TIMEOUT');

  static const $core.List<StreamingRecognizeResponse_SpeechEventType> values = <StreamingRecognizeResponse_SpeechEventType> [
    SPEECH_EVENT_UNSPECIFIED,
    END_OF_SINGLE_UTTERANCE,
    SPEECH_ACTIVITY_BEGIN,
    SPEECH_ACTIVITY_END,
    SPEECH_ACTIVITY_TIMEOUT,
  ];

  static final $core.List<StreamingRecognizeResponse_SpeechEventType?> _byValue = $pb.ProtobufEnum.$_initByValueList(values, 4);
  static StreamingRecognizeResponse_SpeechEventType? valueOf($core.int value) =>  value < 0 || value >= _byValue.length ? null : _byValue[value];

  const StreamingRecognizeResponse_SpeechEventType._(super.value, super.name);
}


const $core.bool _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
