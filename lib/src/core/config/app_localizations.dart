import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class AppLocalizations {
  // all supported locals
  static Locale englishLocale = const Locale('en', "US");
  static Locale bengaliLocale = const Locale('bn', "BD");

  static List<Locale> getSupportedLocals() {
    return [
      englishLocale,
      bengaliLocale,
    ];
  }

  // Local file path
  static String localPath = "assets/lang";

  // fallback locale
  static const Locale fallbackLocale = Locale('en');
  static const Locale startLocale = Locale('en');

  /// It changes the locale of the app.
  ///
  /// Args:
  ///   context (BuildContext): The BuildContext of the widget that you want to change the locale of.
  ///   language (Language): The language you want to change to.
  static void changeLocale(
    BuildContext context,
    Locale locale,
  ) {
    context.setLocale(locale);
  }

  /// `getDefaultLocale` returns the device locale if it's supported by the app, otherwise it returns
  /// the first locale in the list of supported locales
  ///
  /// Args:
  ///   context (BuildContext): The BuildContext of the widget.
  ///
  /// Returns:
  ///   The device locale.
  static Locale getDefaultLocale(BuildContext context) {
    return context.deviceLocale;
  }
}
