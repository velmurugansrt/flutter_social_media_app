import 'package:flutter/material.dart';
import 'dart:ui';

class AppWidgetSize {
// Default properties
  static double uiWidthpx = 375; // Minumum screen width Ratio as per the UI/UX
  static double uiHeightpx =
      667; // Minumum screen height  Ratio as per the UI/UX
  static double scaleWidth = 1;

// Initial dimension size
  static double bodyPadding = 16;
  static double dimen_1 = 1;
  static double dimen_2 = 2;
  static double dimen_3 = 3;
  static double dimen_4 = 4;
  static double dimen_5 = 5;
  static double dimen_6 = 6;
  static double dimen_7 = 7;
  static double dimen_8 = 8;
  static double dimen_9 = 9;
  static double dimen_10 = 10;
  static double dimen_11 = 11;
  static double dimen_12 = 12;
  static double dimen_13 = 13;
  static double dimen_14 = 14;
  static double dimen_15 = 15;
  static double dimen_16 = 16;
  static double dimen_17 = 17;
  static double dimen_18 = 18;
  static double dimen_19 = 19;
  static double dimen_20 = 20;
  static double dimen_24 = 24;
  static double dimen_25 = 25;
  static double dimen_30 = 30;
  static double dimen_32 = 32;
  static double dimen_35 = 35;
  static double dimen_40 = 40;
  static double dimen_45 = 45;
  static double dimen_48 = 48;
  static double dimen_50 = 50;
  static double dimen_60 = 60;
  static double dimen_70 = 70;
  static double dimen_80 = 80;
  static double dimen_90 = 90;
  static double dimen_100 = 100;
  static double dimen_110 = 110;
  static double dimen_120 = 120;
  static double dimen_130 = 130;
  static double dimen_140 = 140;
  static double dimen_150 = 150;
  static double dimen_200 = 200;
  static double dimen_250 = 250;

// FONT SIZE CONFIG

  static double headline6Size = 16;
  static double captionSize = 14;
  static double headline5Size = 16;
  static double subtitle1Size = 14;
  static double bodyText2Size = 12;
  static double bodyText1Size = 10;
  static double headline4Size = 16;
  static double headline3Size = 14;
  static double headline2Size = 12;
  static double headline1Size = 10;
  static double fontSize15 = 15;
  static double fontSize24 = 24;
  static double fontSize8 = 8;

  static double inputSize = 16;
  static double inputLabelSize = 14;
  static double buttonTextSize = 14;

  static double bigTextSize = 18;
  static double textSize = 16;
  static double smallTextSize = 13;

  static const double buttonHeight = 45;
  static BorderRadius buttonBorderRadius = BorderRadius.circular(8);

  static double smallLoaderWidgetSize = 60;

  static double safeAreaSpace = 0;

// SCREEN SIZE CONFIG
  static initSetSize() async {
    final double screenWidth = MediaQueryData.fromWindow(window).size.width;
    if (screenWidth != 0.0) {
      scaleWidth = screenWidth / uiWidthpx;

      headline6Size = getSize(headline6Size);
      captionSize = getSize(captionSize);
      headline5Size = getSize(headline5Size);
      subtitle1Size = getSize(subtitle1Size);
      bodyText2Size = getSize(bodyText2Size);
      bodyText1Size = getSize(bodyText1Size);
      headline4Size = getSize(headline4Size);
      headline3Size = getSize(headline3Size);
      headline2Size = getSize(headline2Size);
      headline1Size = getSize(headline1Size);
      bigTextSize = getSize(bigTextSize);
      textSize = getSize(textSize);
      smallTextSize = getSize(smallTextSize);

      fontSize15 = getSize(fontSize15);
      fontSize24 = getSize(fontSize24);
      fontSize8 = getSize(fontSize8);

      inputSize = getSize(inputSize);
      inputLabelSize = getSize(inputLabelSize);
      buttonTextSize = getSize(buttonTextSize);

      bigTextSize = getSize(bigTextSize);
      textSize = getSize(textSize);
      smallTextSize = getSize(smallTextSize);

      bodyPadding = getSize(bodyPadding);

      dimen_1 = getSize(1);
      dimen_2 = getSize(2);
      dimen_3 = getSize(3);
      dimen_4 = getSize(4);
      dimen_5 = getSize(5);
      dimen_6 = getSize(6);
      dimen_7 = getSize(7);
      dimen_8 = getSize(8);
      dimen_9 = getSize(9);
      dimen_10 = getSize(10);
      dimen_11 = getSize(11);
      dimen_12 = getSize(12);
      dimen_13 = getSize(13);
      dimen_14 = getSize(14);
      dimen_15 = getSize(15);
      dimen_16 = getSize(16);
      dimen_17 = getSize(17);
      dimen_18 = getSize(18);
      dimen_19 = getSize(19);
      dimen_20 = getSize(20);
      dimen_24 = getSize(24);
      dimen_25 = getSize(25);
      dimen_30 = getSize(30);
      dimen_32 = getSize(32);
      dimen_35 = getSize(35);
      dimen_40 = getSize(40);
      dimen_45 = getSize(45);
      dimen_48 = getSize(48);
      dimen_50 = getSize(50);
      dimen_60 = getSize(60);
      dimen_70 = getSize(70);
      dimen_80 = getSize(80);
      dimen_90 = getSize(90);
      dimen_100 = getSize(100);
      dimen_110 = getSize(110);
      dimen_120 = getSize(120);
      dimen_130 = getSize(130);
      dimen_140 = getSize(140);
      dimen_150 = getSize(150);
      dimen_200 = getSize(200);
      dimen_250 = getSize(250);
      smallLoaderWidgetSize = getSize(smallLoaderWidgetSize);
    }
  }

  static double getSize(double size) {
    return size * scaleWidth;
  }

  static Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double screenHeight(BuildContext context, {double dividedBy = 1}) {
    return (screenSize(context).height - safeAreaSpace) / dividedBy;
  }

  static double screenWidth(BuildContext context, {double dividedBy = 1}) {
    return screenSize(context).width / dividedBy;
  }

  static double fullWidth(BuildContext context) {
    return screenWidth(context, dividedBy: 1);
  }

  static double halfWidth(BuildContext context) {
    return screenWidth(context, dividedBy: 2);
  }

  static double fullHeight(BuildContext context) {
    return screenHeight(context, dividedBy: 1);
  }

  static double halfHeight(BuildContext context) {
    return screenHeight(context, dividedBy: 2);
  }

  static double quaterHeight(BuildContext context) {
    return screenHeight(context, dividedBy: 3);
  }

  static double getSizeforverySmallScreen() {
    return 320.0;
  }

  static double getSizeforSmallScreen() {
    return 360.0;
  }

  static double getSizeforlargeScreen() {
    return 375.0;
  }

  static double getSizeforverylargeScreen() {
    return 414.0;
  }

  //sample devices iPhone SE,iPhone 5s,iPhone 5, iPhone 5c,nexus one,nexus S
  static bool verysmallScreen(BuildContext context) {
    return screenWidth(context) == getSizeforverySmallScreen();
  }

  //sample device motto E5,nexus 5
  static bool smallScreen(BuildContext context) {
    return screenWidth(context) == getSizeforSmallScreen();
  }

  //sample device iPhone 6s,iPhone 7,nexus 6P,pixel,pixel 2,iPhone 11 pro
  static bool largeScreen(BuildContext context) {
    return screenWidth(context) == getSizeforlargeScreen();
  }

  //sample device iPhone 11 pro max nexus 2
  static bool verylargeScreen(BuildContext context) {
    return screenWidth(context) == getSizeforverylargeScreen();
  }

  static bool extralargeScreen(BuildContext context) {
    return screenWidth(context) > 600;
  }

  static void setSafeAreaSpace(BuildContext context) {}
}
