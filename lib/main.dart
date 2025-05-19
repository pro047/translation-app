import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trans_app/screen/church_auth_qr.dart';
import 'package:trans_app/screen/role_selection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {'/role-selection': (context) => RoleSelectionScreen()},
      home: ChurchAuthScreen(),
    );
  }
}
