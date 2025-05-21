import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ListenerScreen extends StatefulWidget {
  const ListenerScreen({super.key});

  @override
  State<ListenerScreen> createState() => _ListenerScreenState();
}

class _ListenerScreenState extends State<ListenerScreen> {
  final FlutterTts _tts = FlutterTts();
  late StreamSubscription<DatabaseEvent> _subscription;
  late DatabaseReference _textRef;

  String _translatedText = '대기 중';

  final _ttsQueue = TTSQueueManager();
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    _tts.setLanguage("en-US");
    _tts.setSpeechRate(0.5);

    _ttsQueue.setTts(_tts);

    _textRef = FirebaseDatabase.instance.ref('translatedText/text');

    _subscription = _textRef.onValue.listen((DatabaseEvent event) async {
      final data = event.snapshot.value;
      if (data != null || mounted) {
        final text = data.toString();
        setState(() {
          _translatedText = text;
        });

        _ttsQueue.addText(text);
      }
    });
  }

  @override
  void dispose() {
    _ttsQueue.dispose();
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
              _translatedText,
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            Divider(),
            Text('입력 후 말해보기'),
            TextField(
              controller: _controller,
              decoration: InputDecoration(hintText: '문장 입력'),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
                final input = _controller.text.trim();
                if (input.isEmpty) return;
              },
              child: Text('입력한 문장 읽기'),
            ),
          ],
        ),
      ),
    );
  }
}

class TTSQueueManager {
  FlutterTts? _tts;
  final List<String> _queue = [];
  bool _isSpeaking = false;
  String? _lastQueueText;

  void setTts(FlutterTts tts) {
    _tts = tts;
    _tts!.setCompletionHandler(() {
      _isSpeaking = false;
      _speakNext();
    });
  }

  void addText(String text) {
    if (text == _lastQueueText) return;
    _lastQueueText = text;
    _queue.add(text);
    if (!_isSpeaking) {
      _speakNext();
    }
  }

  void _speakNext() {
    if (_queue.isEmpty) return;

    final text = _queue.removeAt(0);
    _isSpeaking = true;
    _tts!.speak(text);
  }

  void dispose() {
    _tts!.stop();
    _queue.clear();
  }
}
