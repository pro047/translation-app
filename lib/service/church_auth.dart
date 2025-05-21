import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ChurchAuthService {
  static Future<void> verifyChurchcode(
    BuildContext context,
    String code,
  ) async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('churches').get();

    if (!context.mounted) return;

    if (snapshot.exists) {
      Navigator.pushReplacementNamed(context, '/role-selection');
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('인증 실패'),
          content: Text('해당 교회 코드는 등록되지 않았습니다'),
        ),
      );
    }
  }
}
