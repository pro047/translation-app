import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;

class SentenceQueueManager {
  static final instance = SentenceQueueManager._();
  SentenceQueueManager._();

  final Queue<String> _queue = Queue();
  bool _isProcessing = false;

  void enqueue(String sentence) {
    _queue.add(sentence);
    _process();
  }

  void _process() async {
    if (_isProcessing) return;
    _isProcessing = true;

    while (_queue.isNotEmpty) {
      final sentence = _queue.removeFirst();
      try {
        final translated = await _sendToProxy(sentence);
        await _handleResult(translated);
      } catch (err) {
        print('번역 실패 : $err');
      }
    }

    _isProcessing = false;
  }

  Future<String> _sendToProxy(String text) async {
    final response = await http.post(
      Uri.parse(''),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'text': text, 'targetLang': 'EN'}),
    );
    final data = jsonDecode(response.body);
    return data['translations'][0]['text'];
  }

  Future<void> _handleResult(String translatedText) async {
    print('번역 완료 : $translatedText');
  }
}
