import 'dart:async';

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
  final Duration _inactivityDuration = Duration(seconds: 15);
  final List<String> _lastTranslatedTextList = [];

  Timer? _inactivityTimer;
  String _lastInputText = '';
  String _text = '';
  String _log = '';
  bool _isListening = false;
  bool _shouldKeepListenging = true;

  @override
  void dispose() {
    _controller.dispose();
    _speech.stop();
    _inactivityTimer?.cancel();
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
              onPressed: _toggleListen,
              label: Text(_isListening ? '듣는 중...' : '마이크 시작'),
              icon: Icon(_isListening ? Icons.mic : Icons.mic_none),
            ),
            ElevatedButton(
              onPressed: _hanldeManualInput,
              child: Text('직접 입력 -> 번역 / 업로드'),
            ),
            Text(_text),
            Expanded(child: SingleChildScrollView(child: SelectableText(_log))),
            TextField(
              controller: _controller,
              decoration: InputDecoration(hintText: '텍스트 입력'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _toggleListen() async {
    if (_isListening) {
      _stopListenging();
    } else {
      bool available = await _speech.initialize(
        onStatus: (status) async {
          _appendLog('Stt status: $status');
          print('STT status: $status');

          switch (status) {
            case 'done':
            case 'notListening':
              if (!_shouldKeepListenging) return;
              await _speech.cancel();
              Future.delayed(Duration(milliseconds: 200)).then((_) {
                if (!_speech.isListening) _startListening();
              });
              break;
          }
        },
        onError: (error) async {
          _appendLog('stt error : $error');
          print('[listening error] : $error');

          await _speech.cancel();
          _inactivityTimer?.cancel();

          Future.delayed(Duration(microseconds: 300), () {
            if (!_shouldKeepListenging && !_isListening) {
              _appendLog('error 후 stt 재시작');
              _startListening();
            }
          });
        },
      );

      if (available) {
        setState(() {
          _isListening = true;
          _shouldKeepListenging = true;
        });
        _startListening();
      }
    }
  }

  void _resetInactivityTimer() {
    _inactivityTimer?.cancel();
    _inactivityTimer = Timer(_inactivityDuration, () {
      _appendLog('유휴 상태 감지됨 - stt 재시작 시도');
      if (_speech.isListening) {
        _speech.stop();
      }
      Future.delayed(Duration(milliseconds: 200), () {
        if (_shouldKeepListenging) _startListening();
      });
    });
  }

  void _appendLog(String message) {
    setState(() {
      _log += '$message\n';
    });
  }

  void _startListening() {
    if (_speech.isListening) {
      _appendLog('stt가 이미 작동 중입니다.다시 시작하지 않습니다');
      return;
    }

    _appendLog('Stt start listening');

    _speech.listen(
      pauseFor: Duration(seconds: 10),
      listenFor: Duration(minutes: 5),
      onResult: _handleSttResult,
      localeId: 'ko_KR',
      listenOptions: stt.SpeechListenOptions(
        partialResults: true,
        cancelOnError: true,
        listenMode: stt.ListenMode.dictation,
        autoPunctuation: true,
      ),
    );
  }

  void _stopListenging() {
    _shouldKeepListenging = false;
    _speech.cancel();
    _inactivityTimer?.cancel();
    setState(() => _isListening = false);
  }

  Future<void> _handleSttResult(stt.SpeechRecognitionResult result) async {
    final inputText = result.recognizedWords.trim();
    if (inputText.isEmpty || inputText == _lastInputText) return;
    _lastInputText = inputText;

    _resetInactivityTimer();

    final sentenceRegex = RegExp(r'[^.!?]+[.!?]');
    final matches = sentenceRegex.allMatches(inputText).toList();
    if (matches.isEmpty) return;

    final lastSentence = matches.last.group(0)!.trim();

    if (_lastTranslatedTextList.contains(lastSentence)) return;

    _updatedText('번역 중입니다');

    final stopwatch = Stopwatch()..start();

    try {
      final translated = await DeeplService.translateKotoEn(lastSentence);
      await FirebaseService.uploadTranslatedText(translated);
      stopwatch.stop();

      _updatedText('$translated\n 처리 시간 : ${stopwatch.elapsedMilliseconds}ms');

      _lastTranslatedTextList.add(lastSentence);

      if (_lastTranslatedTextList.length > 30) {
        _lastTranslatedTextList.removeRange(0, 10);
      }
      print('전체 처리 시간 : ${stopwatch.elapsedMilliseconds}ms');
      print('STT trnaslation ok, Firebase upload: $translated');
    } catch (err) {
      _appendLog('result err : $err');
      print('translation error / upload err : $err');
    }
  }

  void _updatedText(String value) {
    setState(() {
      _text = value;
    });
  }

  Future<void> _hanldeManualInput() async {
    final input = _controller.text.trim();
    if (input.isEmpty) return;

    final translated = await DeeplService.translateKotoEn(input);
    await FirebaseService.uploadTranslatedText(translated);

    print('Text translation ok, Firebase upload: $translated');
  }
}
