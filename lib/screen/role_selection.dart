import 'package:flutter/material.dart';
import 'package:trans_app/screen/listener.dart';
import 'package:trans_app/screen/mic_screen.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

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
                  '역할을 선택해주세요\nPlease select Role',
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
                          MaterialPageRoute(builder: (_) => MicScreen()),
                        );
                      },
                      child: Text('설교자 Preacher'),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => ListenerScreen()),
                        );
                      },
                      child: Text('청중 Listener'),
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
