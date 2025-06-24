import 'dart:convert';

import 'package:http/http.dart' as http;

class RestApiService {
  static const String _baseUrl = 'https://2efe-220-124-99-7.ngrok-free.app';

  Future<Map<String, dynamic>> startTranslation(String youtubeUrl) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/start-translation'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'youtubeUrl': youtubeUrl}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to start translation: ${response.body}');
    }
  }

  Future<void> stopTranslation(String sessionId) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/stop-translation'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'sessionId': sessionId}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to stop translation: ${response.body}');
    }
  }
}
