import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart' as stt;
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:trans_app/service/deepl_service.dart';
import 'package:trans_app/service/firebase_service.dart';

class PreacherScreen extends StatefulWidget {
  const PreacherScreen({super.key});

  @override
  State<PreacherScreen> createState() => _PreacherScreenState();
}

class _PreacherScreenState extends State<PreacherScreen> {
  final stt.SpeechToText _speech = stt.SpeechToText();
  final TextEditingController _controller = TextEditingController();
  bool _isListening = false;

  @override
  void dispose() {
    _controller.dispose();
    _speech.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('설교자 Preacher')),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: _togglelisten,
              label: Text(_isListening ? '듣는 중...' : '마이크 시작'),
              icon: Icon(_isListening ? Icons.mic : Icons.mic_none),
            ),
            ElevatedButton(
              onPressed: _hanldeManualInput,
              child: Text('직접 입력 -> 번역 / 업로드'),
            ),
            TextField(
              controller: _controller,
              decoration: InputDecoration(hintText: '텍스트 입력'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _togglelisten() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (status) => print('STT status: $status'),
        onError: (error) => print('STT error : $error'),
      );

      if (available) {
        setState(() => _isListening = true);
        _startListening();
      } else {
        setState(() => _isListening = false);
      }
    } else {
      _speech.stop();
      setState(() => _isListening = false);
    }
  }

  void _startListening() {
    _speech.listen(
      onResult: _handleSttResult,
      localeId: 'ko_KR',
      listenOptions: stt.SpeechListenOptions(
        partialResults: false,
        cancelOnError: true,
        listenMode: stt.ListenMode.dictation,
      ),
    );
  }

  Future<void> _handleSttResult(stt.SpeechRecognitionResult result) async {
    final inputText = result.recognizedWords.trim();
    if (inputText.isEmpty) return;

    final translated = await DeeplService.translateKotoEn(inputText);
    await FirebaseService.uploadTranslatedText(translated);

    print('STT trnaslation ok, Firebase upload: $translated');
  }

  Future<void> _hanldeManualInput() async {
    final input = _controller.text.trim();
    if (input.isEmpty) return;

    final translated = await DeeplService.translateKotoEn(input);
    await FirebaseService.uploadTranslatedText(translated);

    print('Text translation ok, Firebase upload: $translated');
  }
}
