import 'package:flutter/material.dart';

class Constants {
  static const Color backgroundColor = Color(0xffD9D9D9);
  static const Color appBarColor = Color(0xff34536A);
  static const Color buttonColor = Color(0xffFF6A5E);
  static const Color buttonSecondaryColor = Color(0xff465B54);
  static const Color buttonShadowColor = Color(0xff151513);
  static const Color selectedChipColor = Color(0xff60809C);
  static const Color selectedChipTextColor = Color(0xffFFFFFF);
  static const Color deSelectedChipColor = Color(0xffE1E6EF);
  static const Color deSelectedChipTextColor = Color(0xff373B3F);
  static const Color deSelectedChipBorderColor = Color(0xffC9CED7);

  static const double tinySpace = 2;
  static const double smallSpace = 4;
  static const double mediumSpace = 8;
  static const double largeSpace = 16;
  static const double xLargeSpace = 20;
  static const double xxLargeSpace = 24;
  static const double giantSpace = 32;

  static const SizedBox tinyVerticalSpacer = SizedBox(height: tinySpace);
  static const SizedBox smallVerticalSpacer = SizedBox(height: smallSpace);
  static const SizedBox mediumVerticalSpacer = SizedBox(height: mediumSpace);
  static const SizedBox largeVerticalSpacer = SizedBox(height: largeSpace);
  static const SizedBox giantVerticalSpacer = SizedBox(height: giantSpace);

  static const SizedBox tinyHorizontalSpacer = SizedBox(width: tinySpace);
  static const SizedBox smallHorizontalSpacer = SizedBox(width: smallSpace);
  static const SizedBox mediumHorizontalSpacer = SizedBox(width: mediumSpace);
  static const SizedBox largeHorizontalSpacer = SizedBox(width: largeSpace);
  static const SizedBox giantHorizontalSpacer = SizedBox(width: giantSpace);

  static const EdgeInsetsDirectional tinyPadding =
      EdgeInsetsDirectional.all(tinySpace);
  static const EdgeInsetsDirectional smallPadding =
      EdgeInsetsDirectional.all(smallSpace);
  static const EdgeInsetsDirectional mediumPadding =
      EdgeInsetsDirectional.all(mediumSpace);
  static const EdgeInsetsDirectional largePadding =
      EdgeInsetsDirectional.all(largeSpace);
  static const EdgeInsetsDirectional giantPadding =
      EdgeInsetsDirectional.all(giantSpace);

  static const boldTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
}
