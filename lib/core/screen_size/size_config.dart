import 'package:flutter/material.dart';

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;
  static late double scale;


  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
    scale = MediaQuery.of(context).devicePixelRatio;
  }
}

extension ResponsiveSize on num {
  double get h => (this / 853) * SizeConfig.screenHeight;

  double get w => (this / 393) * SizeConfig.screenWidth;

  double get sp => (this / 393) * SizeConfig.screenWidth;

  double get r => (this / 393) * SizeConfig.screenWidth;
}

double scaleImageSize(double pxSize, BuildContext context) {
  final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
  final imageSize = pxSize / devicePixelRatio;
  return imageSize;
}



