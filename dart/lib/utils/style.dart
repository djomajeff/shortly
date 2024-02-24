import 'package:flutter/material.dart';
import 'utils.dart';

class AppColors {
  static final primary = const HSLColor.fromAHSL(1.0, 180, .66, .49).toColor();
  static final accent = const HSLColor.fromAHSL(1.0, 257, .27, .26).toColor();
  static final secondary = const HSLColor.fromAHSL(1.0, 0, .87, .67).toColor();
  static final grayShade2 = const HSLColor.fromAHSL(1.0, 0, .0, .75).toColor();
  static const success = Colors.green;
  static final grayShade1 =
      const HSLColor.fromAHSL(1.0, 257, .7, .63).toColor();
  static final grayShade3 =
      const HSLColor.fromAHSL(1.0, 255, .11, .22).toColor();
  static final grayShade4 =
      const HSLColor.fromAHSL(1.0, 260, .8, .14).toColor();
}

class _TextTheme {
  static TextStyle get headerH1 => const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get headerH2 => const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get headerH3 => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get headerH4 => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get bodyLarge => const TextStyle(
        fontSize: 16,
      );

  static TextStyle get bodyMedium => const TextStyle(
        fontSize: 14,
      );

  static TextStyle get bodySmall => const TextStyle(
        fontSize: 10,
      );
}

final _baseTheme = ThemeData.light();

final ligthBaseTheme = _baseTheme.copyWith(
  textTheme: _baseTheme.textTheme
      .copyWith(
        headlineLarge: _TextTheme.headerH1,
        headlineMedium: _TextTheme.headerH2,
        headlineSmall: _TextTheme.headerH3,
        displayLarge: _TextTheme.headerH4,
        bodyLarge: _TextTheme.bodyLarge,
        bodyMedium: _TextTheme.bodyMedium,
        bodySmall: _TextTheme.bodySmall,
      )
      .apply(
        fontFamily: kPoppins,
      ),
);
