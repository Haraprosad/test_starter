import 'package:flutter/material.dart';
import 'package:flutter_starter/src/extensions/extension.dart';

class AppTextStyles {
  static TextStyle getDefaultFontStyle({
    double fontSize = 35.0,
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
    String fontFamily = "",
  }) {
    return TextStyle(
      fontSize: fontSize.fontSize,
      color: color,
      fontWeight: fontWeight,
    );
  }
}
