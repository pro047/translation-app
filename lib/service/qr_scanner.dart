import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:trans_app/service/church_auth.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({super.key});

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('QR 코드 스캔')),
      body: QRView(key: qrKey, onQRViewCreated: _onQRViewCreated),
    );
  }

  void _onQRViewCreated(QRViewController ctrl) {
    controller = ctrl;
    ctrl.scannedDataStream.listen((scanData) async {
      final code = scanData.code?.trim();
      if (code == null || code.isEmpty) return;

      await controller?.pauseCamera();

      if (!mounted) return;
      await ChurchAuthService.verifyChurchcode(context, code);
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
