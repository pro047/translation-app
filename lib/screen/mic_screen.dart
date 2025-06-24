import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trans_app/interfaces/word_emitter.dart';
import 'package:trans_app/provider/provider.dart';
import 'package:trans_app/screen/animation/mic_wave_bar.dart';

class MicScreen extends ConsumerStatefulWidget {
  const MicScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MicScreenState();
}

class _MicScreenState extends ConsumerState<MicScreen> {
  double _soundLevel = 0.0;
  bool _isListening = false;
  List<String> confirmedSentences = [];

  void toggleLang(WidgetRef ref) {
    final currentTarget = ref.read(targetLangProvider);
    currentTarget == 'EN'
        ? (
            ref.read(sourceLangProvider.notifier).state = 'EN',
            ref.read(targetLangProvider.notifier).state = 'KO',
          )
        : (
            ref.read(sourceLangProvider.notifier).state = 'KO',
            ref.read(targetLangProvider.notifier).state = 'EN',
          );
  }

  void toggleListening(WordEmitter emitter) {
    setState(() {
      if (_isListening) {
        emitter.stop();
        setState(() {
          _isListening = false;
        });
      } else {
        emitter.start(
          (data) {
            ref.read(wordQueueProvider).add(data);
          },
          onSoundLevel: (level) {
            setState(() {
              _soundLevel = level;
            });
          },
          // localeId: ref.read(sourceLangProvider) == 'KO' ? 'ko_KR' : 'en_US',
        );
        setState(() {
          _isListening = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final emitter = ref.read(webSocketWordEmitterProvider);

    final currentTarget = ref.watch(targetLangProvider);
    final log = ref.watch(logProvider);

    final directText = currentTarget == 'EN' ? '한국어 → 영어' : '영어 → 한국어';

    return Scaffold(
      appBar: AppBar(title: Text('설교자 Preacher')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              SizedBox(height: 200),
              SizedBox(
                width: 80,
                height: 80,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    MicWaveBar(soundLevel: _soundLevel),
                    InkWell(
                      onTap: () => toggleListening(emitter),
                      borderRadius: BorderRadius.circular(999),
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: _isListening
                              ? Colors.redAccent
                              : Colors.blueAccent,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Icon(
                          _isListening ? Icons.mic : Icons.mic_none,
                          size: 36,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(16),
                  child: Text(log, style: TextStyle(fontSize: 16)),
                ),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  ref.read(logProvider.notifier).state = currentTarget;
                  toggleLang(ref);
                },
                child: Text('언어 바꾸기'),
              ),
              SizedBox(height: 10),
              Text(directText),
              // ElevatedButton(
              //   onPressed: () async {
              //     final hlsUrl = Constants.hlsUrl;
              //     await extractAudioStream(hlsUrl);
              //   },
              //   child: const Text('Extract Audio Stream'),
              // ),
              // ElevatedButton(
              //   onPressed: () async {
              //     final hlsUrl = Constants.hlsUrl;
              //     final pcmFilePath = await extractAudioStream(hlsUrl);

              //     final sttClient = FileStreamingRestSttClient(
              //       GoogleAuthProvider('lib/assets/google_auth.json'),
              //     );

              //     sttClient.startStreaming(
              //       onRecognized: (recognizedText) {
              //         recognizedText.split(' ').forEach((word) {
              //           ref.read(wordQueueProvider).addWord(word);
              //         });
              //       },
              //     );

              // final pcmStream = File(pcmFilePath).openRead();

              // await for (final chunk in pcmStream) {
              //   final pcmBytes = Uint8List.fromList(chunk);
              //   sttClient.sendAudioChunk(pcmBytes);
              //   await Future.delayed(Duration(milliseconds: 100));
              // }

              // await sttClient.stopStreaming();
              // },
              // child: Text('STT 테스트 실행'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
