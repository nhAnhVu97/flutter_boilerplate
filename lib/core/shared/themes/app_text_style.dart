import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._();

  static final headline1 = _TextStyle(_toStyle(size: 32, height: 1.2));
  static final headline2 = _TextStyle(_toStyle(size: 28, height: 1.5));
  static final headline3 = _TextStyle(_toStyle(size: 24, height: 1.4));
  static final headline4 = _TextStyle(_toStyle(size: 20, height: 1.2));
  static final body1 = _TextStyle(_toStyle(size: 16, height: 1.4));
  static final body2 = _TextStyle(_toStyle(size: 14, height: 1.5));
  static final caption = _TextStyle(_toStyle(size: 10, height: 1.4));
  static final eyebrow1 = _TextStyle(_toStyle(size: 14, height: 1.2));
  static final eyebrow2 = _TextStyle(_toStyle(size: 10, height: 1.4));
  static final hyperlink1 = _TextStyle(_toStyle(size: 16, height: 1.44));
  static final hyperlink2 = _TextStyle(_toStyle(size: 14, height: 1));
  static final error1 = _TextStyle(_toStyle(size: 16, height: 1.4));
  static final error2 = _TextStyle(_toStyle(size: 10, height: 1.4));

  static TextStyle _toStyle({
    required double size,
    required double height,
    String? family = 'Roboto',
    Color? color = Colors.white,
    TextDecoration? decoration,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontFamily: family,
      color: color,
      fontSize: size,
      height: height,
      fontWeight: FontWeight.w400,
      decoration: decoration,
      letterSpacing: letterSpacing,
    );
  }
}

class _TextStyle extends TextStyle {
  _TextStyle(TextStyle style)
      : super(
          color: style.color,
          backgroundColor: style.backgroundColor,
          fontFamily: style.fontFamily,
          fontSize: style.fontSize,
          fontWeight: style.fontWeight,
          fontStyle: style.fontStyle,
          letterSpacing: style.letterSpacing,
          wordSpacing: style.wordSpacing,
          textBaseline: style.textBaseline,
          height: style.height,
          leadingDistribution: style.leadingDistribution,
          locale: style.locale,
          foreground: style.foreground,
          background: style.background,
          shadows: style.shadows,
          fontFeatures: style.fontFeatures,
          decoration: style.decoration,
          decorationColor: style.decorationColor,
          decorationStyle: style.decorationStyle,
          decorationThickness: style.decorationThickness,
          debugLabel: style.debugLabel,
          overflow: style.overflow,
        );
  _TextStyle get black => _TextStyle(copyWith(color: Colors.black));
  _TextStyle get white => _TextStyle(copyWith(color: Colors.white));
  _TextStyle get gray => _TextStyle(copyWith(color: Colors.grey));
  _TextStyle get success => _TextStyle(copyWith(color: Colors.greenAccent));
  _TextStyle get error => _TextStyle(copyWith(color: Colors.redAccent));
  _TextStyle get link => _TextStyle(copyWith(color: Colors.purple));
  _TextStyle get bold => _TextStyle(copyWith(fontWeight: FontWeight.bold));
  _TextStyle get medium => _TextStyle(copyWith(fontWeight: FontWeight.w500));
  _TextStyle get light => _TextStyle(copyWith(fontWeight: FontWeight.w300));
  _TextStyle get underline => _TextStyle(copyWith(decoration: TextDecoration.underline));
  _TextStyle get lineThrough => _TextStyle(copyWith(decoration: TextDecoration.lineThrough));
  _TextStyle get overline => _TextStyle(copyWith(decoration: TextDecoration.overline));
}
