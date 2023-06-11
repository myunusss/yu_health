import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      background: Colors.white,
    ),
    useMaterial3: true,
    fontFamily: 'DMSans',
    brightness: Brightness.light,
  );
}
