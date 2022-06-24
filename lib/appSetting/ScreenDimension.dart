import 'package:flutter/material.dart';

class SD {
  static late MediaQueryData mediaQueryData;
  static late double screenHeight;
  static late double screenWidth;
  static late Orientation orientation;

  init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    screenHeight = mediaQueryData.size.height;
    screenWidth = mediaQueryData.size.width;
    orientation = mediaQueryData.orientation;
  }

  double PropHeight(double value) {
    return (value / 812) * SD.screenHeight;
  }

  double PropWidth(double value) {
    return (value / 375) * SD.screenWidth;
  }
}
