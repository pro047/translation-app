import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:trans_app/data/dto/transcript_data.dart';
import 'package:trans_app/interfaces/youtube_word_emitter.dart';
import 'package:trans_app/provider/provider.dart';
import 'package:trans_app/service/api/firebase_service.dart';
import 'package:trans_app/service/api/rest_api_service.dart';

class StreamScreen extends ConsumerStatefulWidget {
  const StreamScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StreamScreenState();
}

class _StreamScreenState extends ConsumerState<StreamScreen> {
  final apiService = RestApiService();
  final FlutterTts _tts = FlutterTts();
  final List<String> _spokenTexts = [];
  final List<String> _ttsQueue = [];

  late final DatabaseReference _textRef;

  TextEditingController _youtubeUrlController = TextEditingController();
  StreamSubscription<DatabaseEvent>? _subscription;
  String _currentText = '대기 중';
  String _currentSessionId = '';
  bool _isSpeaking = false;
  bool _isListening = false;
  bool _isTranslate = false;

  void toggleListening(YoutubeWordEmitter emitter) async {
    if (_isListening) {
      try {
        await apiService.stopTranslation(_currentSessionId);
      } catch (err) {
        print('------Error stopping translation: $err');
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('번역 실패')));
      }

      emitter.stop();

      setState(() {
        _isListening = false;
        _isTranslate = false;
        _currentSessionId = '';
      });
    } else {
      setState(() {
        _isListening = true;
        _isTranslate = true;
      });
      try {
        final result = await apiService.startTranslation(
          _youtubeUrlController.text.trim(),
        );
        final webSocketUrl = result['websocketUrl'];
        final sessionId = result['sessionId'];
        _currentSessionId = sessionId;

        emitter.start((TranscriptData data) {
          ref.read(transQueueManagerProvider);
          onTranscript(data);
        }, websocketUrl: webSocketUrl);

        print('Started translation with sessionId: $sessionId');
      } catch (err) {
        print('-----Error starting translation: $err');
        setState(() {
          _isListening = false;
          _isTranslate = false;
        });
      }
    }
  }

  void onTranscript(TranscriptData data) {
    final manager = ref.read(transcriptManagerProvider);
    final queue = ref.read(transQueueProvider);
    manager.addToTransQueue(data, queue);
  }

  @override
  void initState() {
    super.initState();
    FirebaseService.clearDatabase();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeTtsWithLang();
      _listenToFirebase();
    });
  }

  void _initializeTtsWithLang() {
    final targetLang = ref.read(targetLangProvider);
    final langCode = targetLang == 'EN' ? 'en-US' : 'ko-KR';
    _initializeTts(langCode);
  }

  Future<void> _initializeTts(String langcode) async {
    try {
      await _tts.setLanguage(langcode);
      await _tts.setSpeechRate(0.5);
      _tts.setCompletionHandler(() {
        _isSpeaking = false;
        _trySpeakNext();
      });
    } catch (err) {
      print('[tts] init error: $err');
    }
  }

  void _listenToFirebase() {
    _textRef = FirebaseDatabase.instance.ref('translatedText');
    _subscription = _textRef.onChildAdded.listen((event) {
      final newData = event.snapshot.value?.toString();
      if (newData != null && !_spokenTexts.contains(newData)) {
        _spokenTexts.add(newData);
        _enqueueAndSpeak(newData);
      }
    });
  }

  void _enqueueAndSpeak(String text) {
    _ttsQueue.add(text);
    _trySpeakNext();
  }

  void _trySpeakNext() {
    if (_isSpeaking || _ttsQueue.isEmpty) return;

    final nextText = _ttsQueue.removeAt(0);
    _isSpeaking = true;
    _currentText = nextText;
    setState(() {});
    _tts.speak(_currentText);
  }

  @override
  void dispose() {
    _tts.stop();
    _isSpeaking = false;
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final emitter = ref.read(streamWebSocketWordEmitterProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Youtube')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  SizedBox(height: 150),
                  Column(
                    children: [
                      _isTranslate
                          ? Column(
                              children: [
                                Text('번역 중...'),
                                Text(_youtubeUrlController.text),
                              ],
                            )
                          : Column(
                              children: [
                                Text('유튜브 링크를 입력해주세요'),
                                SizedBox(height: 30),
                                TextField(
                                  controller: _youtubeUrlController,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blueAccent,
                                        width: 2.0,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blueAccent,
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                      SizedBox(height: 30),
                      SizedBox(
                        width: 150,
                        height: 80,
                        child: ElevatedButton(
                          onPressed: () => toggleListening(emitter),
                          child: Center(
                            child: _isListening
                                ? Text(
                                    '번역 중지',
                                    style: TextStyle(color: Colors.white),
                                  )
                                : Text(
                                    '번역하기',
                                    style: TextStyle(color: Colors.white),
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        _currentText,
                        style: TextStyle(fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 40),
                      Text(
                        '읽은 문장 수 ${_spokenTexts.length}',
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                      Divider(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
