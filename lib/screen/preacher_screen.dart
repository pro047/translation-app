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

  @override
  Widget build(BuildContext context) {
    final log = ref.watch(logProvider);
    final emitter = ref.read(preacherSttEmitterProvider);

    return Scaffold(
      appBar: AppBar(title: Text('설교자 Preacher')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              SizedBox(height: 200),
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    if (_isListening) {
                      emitter.stop();
                      _isListening = false;
                    } else {
                      emitter.start((word) {
                        ref.read(wordQueueProvider).addWord(word);
                      });
                      _isListening = true;
                    }
                  });
                },
                label: Text(_isListening ? '듣는 중..' : '마이크 시작'),
                icon: Icon(_isListening ? Icons.mic : Icons.mic_none),
              ),
              SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
