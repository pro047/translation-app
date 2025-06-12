import 'package:flutter/material.dart';
import 'package:trans_app/screen/role_selection.dart';
import 'package:trans_app/screen/stream_screen.dart';

class ModeSelectionScreen extends StatelessWidget {
  const ModeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: Theme.of(context).textTheme.copyWith(
          bodyLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '번역 방식을 선택해주세요\nPlease select Translation method',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => RoleSelectionScreen(),
                          ),
                        );
                      },
                      child: Text('마이크 Mic'),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => StreamScreen()),
                        );
                      },
                      child: Text('유튜브 Youtube'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
