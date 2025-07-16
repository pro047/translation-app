import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trans_app/screen/mode_selection_screen.dart';
import 'package:trans_app/screen/role_selection.dart';
import 'package:trans_app/screen/splash_page.dart';
import 'package:trans_app/service/foreground/init_task.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:trans_app/core/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  FlutterForegroundTask.initCommunicationPort();
  await initForegroundTask();

  await dotenv.load(fileName: '.env');

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: neembaTheme,
      routes: {
        '/': (context) => const SplashPage(),
        '/home': (context) => const RoleSelectionScreen(),
      },
    );
  }
}
