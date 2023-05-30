import 'package:flutter/material.dart';

abstract class BaseColor {}

class ColorConstantDark implements BaseColor {
  static const Color primary = Color(0xff9e1d61);
}

class ColorConstantLight implements BaseColor {
  static const Color primary = Color(0xff9e1d61);
}

class ColorConstants {
  static BaseColor get instance {
    return ColorConstantDark();
  }
}
