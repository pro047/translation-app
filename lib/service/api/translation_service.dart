import 'dart:convert';

import 'package:http/http.dart' as http;

class TranslationService {
  static const _proxyUrl = 'https://proxy.jinseong0477.workers.dev';

  static Future<String?> translate(String sentence) async {
    try {
      final response = await http.post(
        Uri.parse(_proxyUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'text': sentence, 'targetLang': 'EN'}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final translations = data['translations'];
        if (translations is List && translations.isNotEmpty) {
          return translations[0]['text'] ?? '[번역 없음]';
        } else {
          print('번역 결과 없음: $data');
          return '[번역 결과 없음]';
        }
      } else {
        print('번역 실패 : ${response.statusCode}, ${response.body}');
        return '[번역 실패]';
      }
    } catch (err) {
      print('번역 오류 : $err');
      return null;
    }
  }
}
