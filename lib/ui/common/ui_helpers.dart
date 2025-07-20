import 'dart:math';

import 'package:flutter/material.dart';

// Responsive sizes (percentage of screen height/width)
Widget horizontalSpaceTiny(BuildContext context) =>
    SizedBox(width: screenWidthFraction(context, dividedBy: 180));
Widget horizontalSpaceSmall(BuildContext context) =>
    SizedBox(width: screenWidthFraction(context, dividedBy: 130));
Widget horizontalSpaceMedium(BuildContext context) =>
    SizedBox(width: screenWidthFraction(context, dividedBy: 100));
Widget horizontalSpaceLarge(BuildContext context) =>
    SizedBox(width: screenWidthFraction(context, dividedBy: 50));

Widget verticalSpaceTiny(BuildContext context) =>
    SizedBox(height: screenHeightFraction(context, dividedBy: 380));
Widget verticalSpaceSmall(BuildContext context) =>
    SizedBox(height: screenHeightFraction(context, dividedBy: 280));
Widget verticalSpaceMedium(BuildContext context) =>
    SizedBox(height: screenHeightFraction(context, dividedBy: 180));
Widget verticalSpaceLarge(BuildContext context) =>
    SizedBox(height: screenHeightFraction(context, dividedBy: 80));
Widget verticalSpaceMassive(BuildContext context) =>
    SizedBox(height: screenHeightFraction(context, dividedBy: 40));

Widget spacedDivider(BuildContext context) => Column(
      children: <Widget>[
        verticalSpaceMedium(context),
        const Divider(color: Colors.blueGrey, height: 5.0),
        verticalSpaceMedium(context),
      ],
    );

Widget verticalSpace(BuildContext context, double heightFraction) =>
    SizedBox(height: screenHeight(context) * heightFraction);

// Screen Dimensions

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenWidthCustom(BuildContext context, double val) {
  return screenWidth(context) * val;
}

double screenHeightCustom(BuildContext context, double val) {
  return screenHeight(context) * val;
}

double screenHeightFraction(BuildContext context,
        {double dividedBy = 1, double offsetBy = 0, double max = 3000}) =>
    min((screenHeight(context) - offsetBy) / dividedBy, max);

double screenWidthFraction(BuildContext context,
        {double dividedBy = 1.0, double offsetBy = 0, double max = 3000}) =>
    min((screenWidth(context) - offsetBy) / dividedBy, max);

double halfScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 2);

double thirdScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 3);

double quarterScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 4);

// Responsive Font Sizes
double getResponsiveTinyFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 10, max: 11);

double getResponsiveLittleFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 12, max: 13);

double getResponsiveSmallFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 14, max: 15);

double getResponsiveSmallMediumFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 16, max: 17);

double getResponsiveMediumFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 18, max: 19);

double getResponsiveMediumLargeFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 20, max: 21);

double getResponsiveLargeFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 21, max: 31);

double getResponsiveExtraLargeFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 25);

double getResponsiveMassiveFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 30);

double getResponsiveFontSize(BuildContext context,
    {double? fontSize, double? max}) {
  max ??= 100;

  var responsiveSize = min(
      screenWidthFraction(context, dividedBy: 10) * ((fontSize ?? 100) / 100),
      max);

  return responsiveSize;
}

// RegEx
RegExp getRegExpInt() {
  return RegExp('[0-9]');
}

RegExp getRegExpstring() {
  return RegExp('[a-zA-Z ]');
}
