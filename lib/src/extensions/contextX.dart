import 'package:flutter/material.dart';

extension ContextX on BuildContext {
  // Returns the MediaQuery
  MediaQueryData get mq => MediaQuery.of(this);

  /// Returns if Orientation is landscape
  bool get isLandscape => mq.orientation == Orientation.landscape;

  /// Returns same as MediaQuery.of(context).size
  Size get sp => mq.size;

  /// Returns same as MediaQuery.of(context).size.width
  double get wp => sp.width;

  /// Returns same as MediaQuery.of(context).height
  double get hp => sp.height;

  // percent height
  double percentWpx(num value) => (wp * value) / 100.0;
  double percentHpx(num value) => (hp * value) / 100.0;

  //get theme
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  bool get isDark => theme.brightness == Brightness.dark;
}
