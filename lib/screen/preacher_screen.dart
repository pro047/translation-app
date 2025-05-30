import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trans_app/provider.dart';

class PreacherSttScreen extends ConsumerStatefulWidget {
  const PreacherSttScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PreacherSttScreenState();
}

class _PreacherSttScreenState extends ConsumerState<PreacherSttScreen> {
  String _log = '';
  bool _isListening = false;

  void _appendLog(String message) {
    setState(() {
      _log += '$message\n';
    });
  }

  @override
  Widget build(BuildContext context) {
    final log = ref.watch(logProvider);
    final maxWords = ref.watch(maxWordsProvider);
    final maxLen = ref.watch(maxLenProvider);
    final emitter = ref.read(preacherSttEmitterProvider);

    return Scaffold(
      appBar: AppBar(title: Text('설교자 Preacher')),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  if (_isListening) {
                    emitter.stop();
                    _isListening = false;
                    _appendLog('리스닝 중지');
                  } else {
                    emitter.start((word) {
                      ref.read(wordQueueProvider).addWord(word);
                      _appendLog("단어 감지: $word");
                    });
                    _isListening = true;
                    _appendLog('리스닝 시작');
                  }
                });
              },
              label: Text(_isListening ? '듣는 중..' : '마이크 시작'),
              icon: Icon(_isListening ? Icons.mic : Icons.mic_none),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Text('Max Words: $maxWords'),
                Expanded(
                  child: Slider(
                    value: maxWords.toDouble(),
                    min: 1,
                    max: 10,
                    divisions: 9,
                    label: '$maxWords',
                    onChanged: (val) =>
                        ref.read(maxWordsProvider.notifier).state = val.toInt(),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text('Max Length: $maxLen'),
                Expanded(
                  child: Slider(
                    value: maxLen.toDouble(),
                    min: 10,
                    max: 200,
                    divisions: 19,
                    label: '$maxLen',
                    onChanged: (val) {
                      ref.read(maxLenProvider.notifier).state = val.toInt();
                      _appendLog('now MaxLen : ${val.toInt()}');
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(5),
                  color: Colors.grey[300],
                  child: Text(log, style: TextStyle(fontSize: 14)),
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(5),
                  color: Colors.grey[300],
                  child: Text(_log, style: TextStyle(fontSize: 14)),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(logProvider.notifier).state = '';
              },
              child: Text('clear log'),
            ),
          ],
        ),
      ),
    );
  }
}
