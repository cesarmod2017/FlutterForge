import 'package:flutter/material.dart';
import 'package:flutter_forge/app/theme/app_theme.dart';
import 'package:get/get.dart';

class ThemesController extends GetxController {
  // 1. define a RxThemeData to hold the current theme
  final Rx<ThemeData> _theme = _darkTheme.obs;

  // Light Theme
  static final ThemeData _lightTheme = AppTheme.light();

// Dark Theme #090810 #F3F3F3
  static final ThemeData _darkTheme = AppTheme.dark();
  // 2. create a getter for the current theme
  ThemeData get theme => _theme.value;

  // 3. create a toggleTheme method to switch themes
  void toggleTheme() {
    if (_theme.value == _lightTheme) {
      _theme.value = _darkTheme;
    } else {
      _theme.value = _lightTheme;
    }
    update();
  }
}
