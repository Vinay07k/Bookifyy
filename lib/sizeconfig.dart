import 'package:flutter/material.dart';

class ScreenSize {
  static double screenHeight = 0;
  static double screenWidth = 0;

  static intialize(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top +
            MediaQuery.of(context).padding.bottom);

    screenWidth = MediaQuery.of(context).size.width;
  }
}

double getRelativeHeight(double percentage) =>
    percentage * ScreenSize.screenHeight;

double getRelativeWidht(double percentage) =>
    percentage * ScreenSize.screenWidth;
