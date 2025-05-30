import 'package:flutter/material.dart';
import 'package:trans_app/screen/listener.dart';
import 'package:trans_app/screen/preacher_screen.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '역할을 선택해주세요\nPlease select Your role',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => PreacherSttScreen()),
                );
              },
              child: Text('설교자\nPreacher'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ListenerScreen()),
                );
              },
              child: Text('청중\nListener'),
            ),
          ],
        ),
      ),
    );
  }
}
