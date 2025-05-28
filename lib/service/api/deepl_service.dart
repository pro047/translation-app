import 'dart:convert';

import 'package:http/http.dart' as http;

class DeeplService {
  static const _apiKey = '0e5ae8de-b25f-41a9-b62e-127fcfdcd803:fx';
  static const _url = 'https://api-free.deepl.com/v2/translate';

  static Future<String> translateKotoEn(String text) async {
    final response = await http.post(
      Uri.parse(_url),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'auth_key': _apiKey,
        'text': text,
        'source_lang': 'KO',
        'target_lang': 'EN',
      },
    );

    print('res code : ${response.statusCode}');
    print('res body : ${response.body}');

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      print('result : $result');
      final translations = result['translations'];
      if (translations != null && translations.isNotEmpty) {
        print('translations result : $translations');
        return translations[0]['text'];
      } else {
        throw Exception('no transltation result');
      }
    } else {
      throw Exception('번역 실패: ${response.body}');
    }
  }
}
