import 'dart:async';
import 'dart:io';

import 'package:grpc/grpc.dart';
import 'package:trans_app/generated/google/cloud/speech/v1/cloud_speech.pbgrpc.dart';

class FileStreamingStt {
  late final ClientChannel _channel;
  late final SpeechClient _stub;

  FileStreamingStt() {
    _channel = ClientChannel(
      'speech.googleapis.com',
      port: 443,
      options: const ChannelOptions(credentials: ChannelCredentials.secure()),
    );
    _stub = SpeechClient(_channel);
  }

  Future<void> streamRecognizeFromPcmFile({
    required String pcmFilePath,
    required void Function(String recognizedText) onTextRecognized,
  }) async {
    print('Start StreamingRecognize for file: $pcmFilePath');

    final requestStream = StreamController<StreamingRecognizeRequest>();

    final responseStream = _stub.streamingRecognize(
      requestStream.stream,
      options: CallOptions(
        metadata: {'x-goog-api-key': 'AIzaSyC3F8r5Z1hA8ZWH8atk7oN8MPQdfP9odB8'},
      ),
    );
    requestStream.add(
      StreamingRecognizeRequest(streamingConfig: _buildStreamingConfig()),
    );

    final pcmFile = File(pcmFilePath);
    final audioStream = pcmFile.openRead();

    await for (final chunk in audioStream) {
      requestStream.add(StreamingRecognizeRequest(audioContent: chunk));
      await Future.delayed(const Duration(milliseconds: 50));
    }

    print('All audio chunks sent. Closing request stream...');
    await requestStream.close();

    print('Waiting for response...');
    await for (final response in responseStream) {
      for (var result in response.results) {
        if (result.alternatives.isNotEmpty) {
          final transcript = result.alternatives.first.transcript;
          print('Recognized text: $transcript');
          onTextRecognized(transcript);
        }
      }
    }

    print('StreamingRecognize complete.');
  }

  StreamingRecognitionConfig _buildStreamingConfig() {
    return StreamingRecognitionConfig(
      config: RecognitionConfig(
        encoding: RecognitionConfig_AudioEncoding.LINEAR16,
        sampleRateHertz: 16000,
        languageCode: 'ko-KR',
      ),
      interimResults: true,
      singleUtterance: false,
    );
  }

  Future<void> shutdown() async {
    print('shutting down gRPC channel...');
    await _channel.shutdown();
  }
}
