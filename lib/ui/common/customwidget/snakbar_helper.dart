// ignore_for_file: non_constant_identifier_names

import 'package:digitalcaryard/ui/common/app_colors.dart';
import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> show_snackbar(
  BuildContext context,
  String text, [
  Color? borderColor,
]) {
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;

  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Center(
        child: Text(
          text,
          style: TextStyle(
            color: unselectedColor,
            fontSize: screenWidth * 0.02,
            fontWeight: FontWeight.w300,
            letterSpacing: 0.5,
            fontFamily: "SourceSans3",
          ),
        ),
      ),
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(
          color: borderColor ?? const Color(0xFF00CCFF),
          width: 1.3,
        ),
      ),
      backgroundColor: const Color(0xFF1E1E2F),
      elevation: 0,
      margin: EdgeInsets.symmetric(
        vertical: screenHeight * 0.012,
        horizontal: screenWidth * 0.235,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.08,
        vertical: screenHeight * 0.018,
      ),
    ),
  );
}

Widget displaySimpleProgress(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;

  return Center(
    child: CircularProgressIndicator(
      strokeWidth: screenWidth * 0.004,
    ),
  );
}

void displayProgress(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: Center(
          child: CircularProgressIndicator(
            strokeWidth: screenWidth * 0.004,
          ),
        ),
      );
    },
  );
}

void hideProgress(BuildContext context) {
  Navigator.pop(context);
}
