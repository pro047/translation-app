import 'package:flutter/material.dart';

class MicWaveBar extends StatelessWidget {
  final double soundLevel;
  const MicWaveBar({super.key, required this.soundLevel});

  @override
  Widget build(BuildContext context) {
    final scale = 1.0 + (soundLevel / 100.0 * 0.5);
    final opacity = (soundLevel / 100.0).clamp(0.2, 0.8);

    return AnimatedScale(
      scale: scale,
      duration: const Duration(milliseconds: 100),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue.withValues(alpha: opacity),
        ),
      ),
    );
  }
}
