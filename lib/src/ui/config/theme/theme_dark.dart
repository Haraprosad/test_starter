import 'package:flutter/material.dart';
import 'package:flutter_starter/src/extensions/app_config.dart';
import 'package:flutter_starter/src/ui/config/theme/text_styles.dart';

class ThemeDark {
  static ThemeData get theme => ThemeData.dark().copyWith(
        buttonColor: Colors.red,
        iconTheme: IconThemeData(color: Colors.white),
        bannerTheme: MaterialBannerThemeData(
          backgroundColor: Colors.amber,
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.grey[900],
        ),
        splashColor: Colors.grey[900],
        textTheme: TextTheme(
          headline5: AppTextStyles.getDefaultFontStyle(
            fontSize: AppConfig.dimen.defaultFontSize,
          ),
          bodyText1: AppTextStyles.getDefaultFontStyle(
            fontSize: AppConfig.dimen.defaultFontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      );
}
