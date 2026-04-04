import 'package:flutter/material.dart';

class AppTheme {
  // Your brand colors — change these to match your style!
  static const Color primaryColor = Color(0xFF6C63FF);
  static const Color accentColor = Color(0xFF03DAC6);
  static const Color darkBg = Color(0xFF0F0F0F);
  static const Color darkSurface = Color(0xFF1C1C1E);

  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          brightness: Brightness.light,
        ),
        fontFamily: 'Inter', // Add to pubspec.yaml from Google Fonts
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: false,
        ),
        cardTheme: CardThemeData(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: Colors.grey.shade200),
          ),
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: darkBg,
        fontFamily: 'Inter',
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: darkBg,
          centerTitle: false,
        ),
        cardTheme: CardThemeData(
          color: darkSurface,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      );
}
