import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trans_app/interfaces/word_emitter.dart';
import 'package:trans_app/provider/provider.dart';
import 'package:trans_app/screen/animation/mic_wave_bar.dart';

class MicScreem extends ConsumerStatefulWidget {
  const MicScreem({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MicScreemState();
}

class _MicScreemState extends ConsumerState<MicScreem> {
  double _soundLevel = 0.0;
  bool _isListening = false;

  void toggleListening(WordEmitter emitter) {
    setState(() {
      if (_isListening) {
        emitter.stop();
        setState(() {
          _isListening = false;
        });
      } else {
        emitter.start(
          (word) {
            ref.read(wordQueueProvider).addWord(word);
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
    return Scaffold(
      appBar: AppBar(title: Text('마이크 입력')),
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
            ],
          ),
        ),
      ),
    );
  }
}
