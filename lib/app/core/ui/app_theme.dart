import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const MaterialColor _primarySwatch = MaterialColor(0xFF0066B0, {
    50: Color(0XFFe6f0f7),
    100: Color(0XFFcce0ef),
    200: Color(0XFF99c2df),
    300: Color(0XFF66a3d0),
    400: Color(0XFF3385c0),
    500: Color(0xFF0066B0),
    600: Color(0XFF00528d),
    700: Color(0XFF003d6a),
    800: Color(0XFF002946),
    900: Color(0XFF001423),
  });

  static final ThemeData theme = ThemeData(
    primarySwatch: _primarySwatch,
    primaryColor: const Color(0xFF0066B0),
    primaryColorLight: const Color(0xFF219FFF),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      labelStyle: TextStyle(color: Colors.grey),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      )),
    ),
  );
}
