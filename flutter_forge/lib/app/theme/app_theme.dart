import 'package:flutter/material.dart';

final class AppTheme {
  static bool useMaterial3 = true;
  static Color colorSeed = const Color.fromARGB(255, 83, 27, 214);

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: useMaterial3,
      colorScheme: ColorScheme.fromSeed(seedColor: colorSeed),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorSeed,
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: useMaterial3,
      colorSchemeSeed: ColorScheme.fromSeed(seedColor: colorSeed).primary,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorSeed,
      ),
    );
  }
}
