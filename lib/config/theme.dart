import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {

  AppTheme(this._brightness);

  final Brightness _brightness;

  ThemeData get themeData {
    return ThemeData(brightness: _brightness).copyWith(
      colorScheme: _colorScheme,
      useMaterial3: true,
    );
  }

  ColorScheme get _colorScheme => ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor,
        brightness: _brightness,
      );
}