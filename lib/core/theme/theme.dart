import 'package:flutter/material.dart';

final Color ivory = const Color(0xFFF3EEE2);
final Color green = const Color(0xFF225D42);

final ThemeData neembaTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: ivory,
  primaryColor: green,
  colorScheme: ColorScheme.light(
    primary: green,
    onPrimary: Colors.white,
    surface: ivory,
    onSurface: green,
    secondary: green,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: ivory,
    iconTheme: IconThemeData(color: green),
    titleTextStyle: TextStyle(
      color: green,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    elevation: 0,
  ),
  iconTheme: IconThemeData(color: green),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: green),
    bodyMedium: TextStyle(color: green),
    bodySmall: TextStyle(color: green),
    titleLarge: TextStyle(color: green, fontWeight: FontWeight.bold),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: ivory,
      backgroundColor: green,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),
);
