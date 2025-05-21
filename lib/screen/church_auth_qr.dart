import 'package:flutter/material.dart';
import 'package:trans_app/service/qr_scanner.dart';
import 'package:trans_app/service/church_auth.dart';

class ChurchAuthScreen extends StatefulWidget {
  const ChurchAuthScreen({super.key});

  @override
  State<ChurchAuthScreen> createState() => _ChurchAuthScreenState();
}

class _ChurchAuthScreenState extends State<ChurchAuthScreen> {
  final TextEditingController _codeController = TextEditingController();

  void _scanQrCode() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => QrScannerScreen()),
    );

    if (result is String) {
      ChurchAuthService.verifyChurchcode(context, result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('인증')),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Text(
              '교회 QR을 스캔하거나\n인증 코드를 입력해주세요',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: _scanQrCode,
              label: Text('QR 코드 스캔'),
              icon: Icon(Icons.qr_code_scanner),
            ),
            SizedBox(height: 30),
            TextField(
              controller: _codeController,
              decoration: InputDecoration(
                labelText: '코드 직접 입력',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                final code = _codeController.text.trim();
                ChurchAuthService.verifyChurchcode(context, code);
              },
              child: Text('확인'),
            ),
          ],
        ),
      ),
    );
  }
}
