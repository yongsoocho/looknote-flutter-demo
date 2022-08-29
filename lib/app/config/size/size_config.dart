import 'package:flutter/material.dart';

class SizeConfig {
  factory SizeConfig() => _instance;
  SizeConfig._();

  static final SizeConfig _instance = SizeConfig._();


  late MediaQueryData _mediaQueryData;
  late double keyboardHeight;
  late double screenWidth;
  late double screenHeight;
  late double safeAreaWidth;
  late double safeAreaHeight;
  late double blockSizeHorizontal;
  late double blockSizeVertical;
  late double _safeAreaHorizontal;
  late double _safeAreaVertical;
  late double safeBlockHorizontal;
  late double safeBlockVertical;
  double? profileDrawerWidth;
  late double refHeight;
  late double refWidth;
  late double bottomSafeArea;
  late double topSafeArea;

  final appBarHeight = AppBar().preferredSize.height;

  Future<void> init(BuildContext context) async {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    refHeight = 1450;
    refWidth = 670;
    bottomSafeArea = MediaQuery.of(context).padding.bottom;
    topSafeArea = MediaQuery.of(context).padding.top;
    keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    if (screenHeight < 1200) {
      blockSizeHorizontal = screenWidth / 100;
      blockSizeVertical = screenHeight / 100;

      _safeAreaHorizontal =
          _mediaQueryData.padding.left + _mediaQueryData.padding.right;
      _safeAreaVertical =
          _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
      safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
      safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;

      safeAreaWidth = screenWidth - _safeAreaHorizontal;
      safeAreaHeight = screenHeight - _safeAreaVertical;
    } else {
      blockSizeHorizontal = screenWidth / 120;
      blockSizeVertical = screenHeight / 120;

      _safeAreaHorizontal =
          _mediaQueryData.padding.left + _mediaQueryData.padding.right;
      _safeAreaVertical =
          _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
      safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 120;
      safeBlockVertical = (screenHeight - _safeAreaVertical) / 120;

      safeAreaWidth = screenWidth - _safeAreaHorizontal;
      safeAreaHeight = screenHeight - _safeAreaVertical;
    }
  }

  double getWidthRatio(double val) {
    double res = (val / refWidth) * 100;
    double widthRatio = res * blockSizeHorizontal;

    return widthRatio;
  }

  double getHeightRatio(double val) {
    double res = (val / refHeight) * 100;
    double heightRatio = res * blockSizeVertical;
    return heightRatio;
  }

  double getFontRatio(double val) {
    double res = (val / refWidth) * 100;
    double fontRatio = 0.0;
    if (screenWidth < screenHeight) {
      fontRatio = res * safeBlockHorizontal;
    } else {
      fontRatio = res * safeBlockVertical;
    }

    return fontRatio;
  }
}

extension SizeUtils on num {
  double get toWidth => SizeConfig().getWidthRatio(toDouble());
  double get toHeight => SizeConfig().getHeightRatio(toDouble());
  double get toFont => SizeConfig().getFontRatio(toDouble());
}
