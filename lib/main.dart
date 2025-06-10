import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trans_app/screen/role_selection.dart';
import 'package:trans_app/service/foreground/init_task.dart';
import 'package:trans_app/service/web_socket/web_socket.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  FlutterForegroundTask.initCommunicationPort();
  await initForegroundTask();

  WebSocketService().init();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xfff9fafb),
        primaryColor: Color(0xff3b82f6),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Color(0xff111827)),
          bodySmall: TextStyle(color: Color(0xff6b7280)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff3b82f6),
            foregroundColor: Colors.white,
            elevation: 10,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(12),
            ),
            fixedSize: Size(180, 60),
            textStyle: TextStyle(fontSize: 16, inherit: true),
          ),
        ),
        cardColor: Colors.white,
        dividerColor: Color(0xffe5e7eb),
      ),
      routes: {'/role-selection': (context) => RoleSelectionScreen()},
      home: RoleSelectionScreen(),
    );
  }
}
