import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:trans_app/service/api/firebase_service.dart';

class ListenerScreen extends StatefulWidget {
  const ListenerScreen({super.key});

  @override
  State<ListenerScreen> createState() => _ListenerScreenState();
}

class _ListenerScreenState extends State<ListenerScreen> {
  final FlutterTts _tts = FlutterTts();
  final List<String> _spokenTexts = [];
  final List<String> _ttsQueue = [];

  String _currentText = '대기 중';
  bool _isSpeaking = false;

  late StreamSubscription<DatabaseEvent> _subscription;
  late DatabaseReference _textRef;

  @override
  void initState() {
    super.initState();
    FirebaseService.clearDatabase();
    _initializeTts();
    _listenToFirebase();
  }

  void _initializeTts() async {
    await _tts.setLanguage("en-US");
    await _tts.setSpeechRate(0.5);
    _tts.setCompletionHandler(() {
      _isSpeaking = false;
      _trySpeakNext();
    });
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
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('청중 Listener')),
      body: Center(
        child: Column(
          children: [
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
      ),
    );
  }
}
