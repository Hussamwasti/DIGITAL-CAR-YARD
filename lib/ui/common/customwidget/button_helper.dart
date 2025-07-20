// ignore_for_file: must_be_immutable, camel_case_types

import 'package:flutter/material.dart';

import '../ui_helpers.dart';

class button_helper extends StatelessWidget {
  button_helper({
    super.key,
    required this.onPress,
    this.color = const Color(0xFF00CCFF),
    this.margin,
    this.width,
    this.height,
    this.responsiveWidthFactor = 0.1,
    required this.child,
    this.borderColor = const Color(0xFF00CCFF),
    this.textColor = Colors.white,
  });

  final Function onPress;
  final Color color;
  final EdgeInsetsDirectional? margin;
  final double? width;
  final double? height;
  final double responsiveWidthFactor;
  final Widget child;
  final Color borderColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final double buttonWidth = width ?? screenWidth * responsiveWidthFactor;
    final double buttonHeight = height ?? screenHeight * 0.07;
    final double fontSize = screenWidth * 0.035;
    return Container(
      height: screenWidth < 800
          ? screenHeightFraction(context, dividedBy: 30)
          : screenHeightFraction(context, dividedBy: 15),
      width: screenWidth < 800
          ? screenWidthFraction(context, dividedBy: 8)
          : screenWidthFraction(context, dividedBy: 10),
      child: InkWell(
        onTap: () => onPress(),
        borderRadius: BorderRadius.circular(buttonHeight / 2),
        child: Container(
          height: buttonHeight,
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColor,
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: borderColor.withOpacity(0.40),
                blurRadius: 6,
                offset: const Offset(3, 3),
              ),
            ],
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(buttonHeight / 2)),
          ),
          child: Center(
            child: DefaultTextStyle(
              style: TextStyle(
                color: textColor,
                fontFamily: "SourceSans3",
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
