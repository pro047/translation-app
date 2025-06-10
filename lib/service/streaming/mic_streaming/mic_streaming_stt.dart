import 'dart:async';
import 'dart:typed_data';

import 'package:grpc/grpc.dart';
import 'package:trans_app/generated/google/cloud/speech/v1/cloud_speech.pbgrpc.dart';
import 'package:trans_app/provider/google_auth_provider.dart';

class MicStreamingSttClient {
  late final ClientChannel _channel;
  late final SpeechClient _stub;
  StreamController<StreamingRecognizeRequest>? _requestStreamController;

  MicStreamingSttClient() {
    _channel = ClientChannel(
      'speech.googleapis.com',
      port: 443,
      options: const ChannelOptions(credentials: ChannelCredentials.secure()),
    );
    _stub = SpeechClient(_channel);
  }

  Future<void> startStreaming({
    required void Function(String recognizedText) onRecognized,
  }) async {
    final authProvider = GoogleAuthProvider('lib/assets/google_auth.json');
    final credentials = await authProvider.getAccessCredentials();
    final token = credentials.accessToken.data;

    print('[MicStreamingSttClient] startStreaming called');
    print('token $token');
    _requestStreamController = StreamController<StreamingRecognizeRequest>();
    final responseStream = _stub.streamingRecognize(
      _requestStreamController!.stream,
      options: CallOptions(metadata: {'Authorization': 'Bearer $token'}),
    );

    _requestStreamController!.add(
      StreamingRecognizeRequest(streamingConfig: _buildStreamingConfig()),
    );

    responseStream.listen(
      (response) {
        print('[MicStreamingSttClient] responseStream.listen triggerd');
        for (var result in response.results) {
          if (result.alternatives.isNotEmpty) {
            final transcript = result.alternatives.first.transcript;
            print('Recognized text : $transcript');

            onRecognized(transcript);
          }
        }
      },
      onDone: () {
        print('[MicStreamingSttClient] responseStream closed');
      },
      onError: (error) {
        print('[MicStreamingSttClient] responseStream error: $error');
      },
    );
  }

  void sendAudioChunk(Uint8List data) {
    // print('receive chunk!');
    if (_requestStreamController != null &&
        !_requestStreamController!.isClosed) {
      _requestStreamController!.add(
        StreamingRecognizeRequest(audioContent: data),
      );
    }
  }

  Future<void> stopStreaming() async {
    await _requestStreamController?.close();
    _requestStreamController = null;
  }

  Future<void> shutdown() async {
    await _channel.shutdown();
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
}
