import 'dart:async';

import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart' as stt;
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:trans_app/service/sst_queue.dart';

class PreacherScreen extends StatefulWidget {
  const PreacherScreen({super.key});

  @override
  State<PreacherScreen> createState() => _PreacherScreenState();
}

class _PreacherScreenState extends State<PreacherScreen> {
  final stt.SpeechToText _speech = stt.SpeechToText();
  final TextEditingController _controller = TextEditingController();
  final Duration _inactivityDuration = Duration(seconds: 15);
  final Duration _silenceDurationThreshold = Duration(seconds: 1);
  final List<String> _lastTranslatedTextList = [];
  final TranslationQueue _translationQueue = TranslationQueue();
  final double _silenceThreshold = 1.2;

  DateTime? _lastSoundTime;
  Timer? _silenceTimer;
  Timer? _inactivityTimer;
  String _lastInputText = '';
  String _text = '';
  String _log = '';
  double _currentSoundLevel = 0.0;
  bool _isListening = false;
  bool _shouldKeepListening = true;

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
            SizedBox(height: 12),
            LinearProgressIndicator(
              value: _currentSoundLevel / 10.0,
              minHeight: 10,
              backgroundColor: Colors.grey[300],
              color: Colors.green,
            ),
            ElevatedButton(
              onPressed: () {
                if (_lastInputText.isNotEmpty) {
                  _appendLog('수동 문장 처리 실행 : $_lastInputText');
                  _handleFinalizedInput(_lastInputText);
                }
              },
              child: Text('수동 번역'),
            ),
            Text(_text),
            Expanded(child: SingleChildScrollView(child: SelectableText(_log))),
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
              if (!_shouldKeepListening) return;
              await _speech.cancel();
              await Future.delayed(Duration(milliseconds: 300));
              if (!_speech.isListening) {
                _startListening();
              }
              break;
          }
        },
        onError: (error) async {
          _appendLog('stt error : $error');
          print('[listening error] : $error');

          await _speech.cancel();
          _inactivityTimer?.cancel();

          Future.delayed(Duration(microseconds: 300), () {
            if (_shouldKeepListening && !_isListening) {
              _appendLog('error 후 stt 재시작');
              _startListening();
            }
          });
        },
      );

      if (available) {
        setState(() {
          _isListening = true;
          _shouldKeepListening = true;
        });
        _startListening();
      }
    }
  }

  void _onSoundLevelChange(double level) {
    setState(() {
      _currentSoundLevel = level.clamp(0.0, 10.0);
    });

    final now = DateTime.now();
    if (level > _silenceThreshold) {
      _lastSoundTime = now;
      _silenceTimer?.cancel();
    } else {
      final silenceTime = now.difference(_lastSoundTime ?? now);
      if (silenceTime > _silenceDurationThreshold) {
        if (_silenceTimer == null || !_silenceTimer!.isActive) {
          _silenceTimer = Timer(Duration(milliseconds: 200), () {
            _appendLog('문장 감지 -> 문장 종료 처리');
            _handleFinalizedInput(_lastInputText);
          });
        }
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
        if (_shouldKeepListening) _startListening();
      });
    });
  }

  void _startListening() {
    if (_speech.isListening) {
      _appendLog('stt가 이미 작동 중입니다.다시 시작하지 않습니다');
      return;
    }

    _appendLog('Stt start listening');

    _speech.listen(
      pauseFor: Duration(hours: 1),
      listenFor: Duration(hours: 1),
      onResult: _handleSttResult,
      onSoundLevelChange: _onSoundLevelChange,
      localeId: 'ko_KR',
      listenOptions: stt.SpeechListenOptions(
        partialResults: true,
        cancelOnError: false,
        listenMode: stt.ListenMode.dictation,
        autoPunctuation: true,
      ),
    );
  }

  void _stopListenging() {
    _shouldKeepListening = false;
    _speech.cancel();
    _inactivityTimer?.cancel();
    setState(() => _isListening = false);
  }

  Future<void> _handleSttResult(stt.SpeechRecognitionResult result) async {
    final inputText = result.recognizedWords.trim();

    if (inputText.isEmpty) {
      _appendLog('inputText is empty');
      return;
    }

    if (inputText == _lastInputText) {
      _appendLog('inputText : $inputText');
      return;
    }

    _lastInputText = inputText;

    _resetInactivityTimer();

    if (result.finalResult) {
      _appendLog('finalresult로 문장 종료 감지');
      _handleFinalizedInput(inputText);
    }
  }

  void _handleFinalizedInput(String inputText) {
    final sentence = inputText.trim();
    if (sentence.isEmpty || _lastTranslatedTextList.contains(sentence)) return;

    _lastTranslatedTextList.add(sentence);
    if (_lastTranslatedTextList.length > 30) {
      _lastTranslatedTextList.removeRange(0, 10);
    }

    _translationQueue.add(sentence, _onTranslationUpdate, _appendLog);
  }

  void _onTranslationUpdate(String value) {
    setState(() {
      _text = value;
    });
  }

  void _appendLog(String message) {
    setState(() {
      _log += '$message\n';
    });
  }
}
