import 'dart:async';

import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Container(
        color: theme.scaffoldBackgroundColor,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Transform.translate(
              offset: const Offset(0, 30),
              child: Image.asset(
                'lib/assets/wave_icon_noback.png',
                width: 150,
                fit: BoxFit.contain,
                alignment: Alignment.bottomCenter,
              ),
            ),
            const Text(
              'Bridging voices flowing grace',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                height: 1,
              ),
            ),
            const SizedBox(height: 100),
            const CircularProgressIndicator(),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
