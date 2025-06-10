import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:trans_app/provider/google_auth_provider.dart';

class FileStreamingRestSttClient {
  final GoogleAuthProvider authProvider;
  final List<int> _authBuffer = [];

  Timer? _recognizeTimer;

  FileStreamingRestSttClient(this.authProvider);

  void startStreaming({
    required void Function(String recognizedText) onRecognized,
  }) async {
    print('[FileStreamingRestSttClient] start called');

    _recognizeTimer = Timer.periodic(Duration(seconds: 5), (_) async {
      if (_authBuffer.isEmpty) return;

      print('[FileStreamingRestSttClient] Sending ${_authBuffer.length}');

      final result = await _sendRecognizedRequest(
        Uint8List.fromList(_authBuffer),
      );

      if (result != null && result.isNotEmpty) {
        onRecognized(result);
      }

      _authBuffer.clear();
    });
  }

  void sendAudioChunk(Uint8List data) {
    _authBuffer.addAll(data);
  }

  Future<void> stopStreaming() async {
    _recognizeTimer?.cancel();
    _recognizeTimer = null;

    if (_authBuffer.isNotEmpty) {
      final result = await _sendRecognizedRequest(
        Uint8List.fromList(_authBuffer),
      );
      if (result != null && result.isNotEmpty) {
        print('Final recognized text: $result');
      }
      _authBuffer.clear();
    }
  }

  Future<String?> _sendRecognizedRequest(Uint8List pcmData) async {
    try {
      final credentials = await authProvider.getAccessCredentials();
      final token = credentials.accessToken.data;

      final base64Audio = base64Encode(pcmData);
      print('[MicStreamingResSttClient] PCM data lenth: ${pcmData.length}');

      final requestBody = jsonEncode({
        'config': {
          'encoding': 'LINEAR16',
          'sampleRateHertz': 16000,
          'languageCode': 'ko-KR',
        },
        'audio': {'content': base64Audio},
      });

      final response = await http.post(
        Uri.parse('https://speech.googleapis.com/v1/speech:recognize'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: requestBody,
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        if (jsonResponse['results'] != null &&
            jsonResponse['results'].isNotEmpty) {
          final firstAlternative =
              jsonResponse['results'][0]['alternatives'][0];
          final transcript = firstAlternative['transcript'];
          print('Recognized text: $transcript');
          return transcript;
        } else {
          print('jsonRes: $jsonResponse');
          print('No recognition result');
        }
      } else {
        print(
          'Recognize request failed: ${response.statusCode} ${response.body}',
        );
      }
    } catch (err) {
      print('Exception during recognize request: $err');
    }

    return null;
  }
}
