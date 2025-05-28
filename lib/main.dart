import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trans_app/screen/church_auth_qr.dart';
import 'package:trans_app/screen/role_selection.dart';
import 'package:trans_app/service/api/translation_service.dart';

void main() async {
  final result = await TranslationService.translate('하나님은 당신을 사랑하십니다');
  print(result);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {'/role-selection': (context) => RoleSelectionScreen()},
      home: ChurchAuthScreen(),
    );
  }
}
