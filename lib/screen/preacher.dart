import 'dart:async';

import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart' as stt;
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:trans_app/service/queues/translation_queue.dart';
import 'package:trans_app/service/queues/word_queue_manager.dart';

class PreacherScreen extends StatefulWidget {
  const PreacherScreen({super.key});

  @override
  State<PreacherScreen> createState() => _PreacherScreenState();
}

class _PreacherScreenState extends State<PreacherScreen> {
  final stt.SpeechToText _speech = stt.SpeechToText();
  final TextEditingController _controller = TextEditingController();
  final ScrollController _logController = ScrollController();
  final Duration _inactivityDuration = Duration(seconds: 15);
  final Duration _silenceDurationThreshold = Duration(seconds: 1);
  final double _silenceThreshold = 1.2;

  late final WordQueueManager _wordQueueManager;

  DateTime? _lastSoundTime;
  Timer? _silenceTimer;
  Timer? _inactivityTimer;
  String _lastInputText = '';
  String _text = '';
  String _log = '';
  String _translatinQueueState = '';
  double _currentSoundLevel = 0.0;
  bool _isListening = false;
  bool _shouldKeepListening = true;

  void _updateQueueDisplay() {
    final pending = TranslationQueue.instance.pending;
    final newState = pending.isEmpty
        ? 'trnaslationQueue Empty'
        : 'queue : ${pending.join(' | ')}';

    if (_translatinQueueState != newState) {
      setState(() {
        _translatinQueueState = newState;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _wordQueueManager = WordQueueManager(
      onUpdate: _onTranslationUpdate,
      onLog: _appendLog,
    );
  }

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
                }
              },
              child: Text('수동 번역'),
            ),
            Text(_text),
            Expanded(
              child: SingleChildScrollView(
                controller: _logController,
                child: Container(
                  padding: EdgeInsets.all(5),
                  color: Colors.grey[300],
                  child: Text(_log, style: TextStyle(fontSize: 14)),
                ),
              ),
            ),
            SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              color: Colors.grey[200],
              child: Text(
                _translatinQueueState,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
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
          _appendLog('[STT status]: $status');

          if (!_shouldKeepListening) {
            _appendLog('[status on not lisenting]');
            return;
          }

          switch (status) {
            case 'done':
            case 'notListening':
              if (_isListening) {
                setState(() {
                  _isListening = false;
                });
              }

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

    _appendLog('[Stt start listening]');

    setState(() {
      _isListening = true;
    });

    _speech.listen(
      pauseFor: Duration(seconds: 10),
      listenFor: Duration(minutes: 5),
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

    if (!result.finalResult && inputText == _lastInputText) return;

    _lastInputText = inputText;

    _wordQueueManager.updateFromRecognition(inputText, forceComplete: true);

    _resetInactivityTimer();

    if (result.finalResult) {
      _appendLog(
        '[finalResult] : ${result.finalResult}, [inputText] : $inputText',
      );
      _wordQueueManager.updateFromRecognition(inputText, forceComplete: true);
    }
  }

  void _onTranslationUpdate(String value) {
    _text = value;
    _appendLog('번역 결과 업데이트 됨: \n $value');
    setState(() {});
  }

  void _appendLog(String message) {
    _log += '$message\n';

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _logController.jumpTo(_logController.position.maxScrollExtent);
    });
    _updateQueueDisplay();
  }
}
