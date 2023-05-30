import 'package:flutter/material.dart';
import 'package:flutter_starter/src/ui/config/dimension/dimension_desktop.dart';
import 'package:flutter_starter/src/ui/config/dimension/dimension_mobile.dart';
import 'package:flutter_starter/src/ui/config/dimension/dimension_tablet.dart';
import 'package:flutter_starter/src/ui/config/dimension/dimension_watch.dart';
import 'package:flutter_starter/src/ui/config/dimension/dimensions.dart';

/// Class to initialize calculation for responsiveness
/// must be called when the app is started
class AppConfig {
  AppConfig({
    this.designScreenWidth = 392, //pixel 4 emulator
    this.designScreenHeight = 781, //pixel 4 emulator
    this.desktopChangePoint = 900,
    this.tabletChangePoint = 650,
    this.watchChangePoint = 300,
  });

  final double desktopChangePoint;

  final double tabletChangePoint;

  final double watchChangePoint;

  /// the value of [screen width] of design given by [designer]
  int designScreenWidth;

  /// the value of [screen height] of design given by [designer]
  int designScreenHeight;

  /// [width] of current device
  static double _screenWidth = 1.0;

  /// [height] of current device
  static double _screenHeight = 1.0;

  /// value to initialize [fontSize]
  static double textMultiplier = 1.0;

  /// value to initialize [image sizes]
  static double imageSizeMultiplier = 1.0;

  /// value to initialize [height] values
  static double heightMultiplier = 1.0;

  /// value to initialize [width] values
  static double widthMultiplier = 1.0;

  /// value to get information about [orientation]
  static bool isPortrait = true;

  /// value to get information about [portrait] in in [mobile] or [not]
  static bool isMobilePortrait = false;

  static DeviceType deviceType = DeviceType.mobile;

  static BaseDimension dimen = BaseDimension();

  /// the method to initialize [SizeConfig] for responsive calculation
  void init(BuildContext context, BoxConstraints constraints,
      Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
      isPortrait = true;
      if (_screenWidth < 450) {
        isMobilePortrait = true;
      }
    } else {
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
      isPortrait = false;
      isMobilePortrait = false;
    }

    imageSizeMultiplier = heightMultiplier = _screenHeight / designScreenHeight;
    widthMultiplier = textMultiplier = _screenWidth / designScreenWidth;

    if (_screenWidth >= desktopChangePoint) {
      // this is desktop
      deviceType = DeviceType.desktop;
      dimen = DextopDimension();
    } else if (_screenWidth < desktopChangePoint &&
        _screenWidth >= tabletChangePoint) {
      //this is tablet
      deviceType = DeviceType.tablet;
      dimen = TabletDimension();
    } else if (_screenWidth < tabletChangePoint &&
        _screenWidth >= watchChangePoint) {
      //this is mobile
      deviceType = DeviceType.mobile;
      dimen = MobileDimension();
    } else if (_screenWidth < watchChangePoint) {
      // this is watch
      deviceType = DeviceType.watch;
      dimen = WatchDimension();
    }
  }

  // device types
  static bool get isMobile => deviceType == DeviceType.mobile;
  static bool get isTablet => deviceType == DeviceType.tablet;
  static bool get isWatch => deviceType == DeviceType.watch;
  static bool get isDesktop => deviceType == DeviceType.desktop;
}

enum DeviceType { mobile, watch, tablet, desktop }
