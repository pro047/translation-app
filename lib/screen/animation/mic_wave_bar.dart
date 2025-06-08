import 'dart:math';

import 'package:flutter/material.dart';

class MicWaveBar extends StatefulWidget {
  final double soundLevel;
  const MicWaveBar({super.key, required this.soundLevel});

  @override
  State<MicWaveBar> createState() => _MicWaveBarState();
}

class _MicWaveBarState extends State<MicWaveBar> {
  @override
  Widget build(BuildContext context) {
    final scale = 1.0 + sin(widget.soundLevel / 100.0 * pi) * 0.8;
    final opacity = (widget.soundLevel / 100.0).clamp(0.2, 0.8);

    return AnimatedScale(
      scale: scale,
      duration: const Duration(milliseconds: 100),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.greenAccent.withValues(alpha: opacity),
        ),
      ),
    );
  }
}
