// ignore_for_file: must_be_immutable, camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ui_helpers.dart';

class text_helper extends StatelessWidget {
  text_helper({
    super.key,
    required this.data,
    this.color,
    this.size,
    this.fontWeight = FontWeight.normal,
    this.textDecoration,
    this.textAlign = TextAlign.center,
    this.fontFamily = "SourceSans3",
    this.overflow,
    this.maxLines,
  });

  String data;
  Color? color;
  double? size;
  FontWeight fontWeight;
  TextDecoration? textDecoration;
  TextAlign textAlign;
  String fontFamily;
  TextOverflow? overflow;
  int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: overflow,
      maxLines: maxLines,
      data,
      style: customStyle(color, size ?? getResponsiveSmallFontSize(context),
          context, fontWeight, textDecoration, fontFamily),
      textAlign: textAlign,
    );
  }

  static TextStyle customStyle(
      Color? color,
      double? size,
      BuildContext context,
      FontWeight fontWeight,
      TextDecoration? textDecoration,
      String? fontFamily) {
    return TextStyle(
        color: color,
        decoration: textDecoration,
        fontSize: MediaQuery.of(context).size.width > 800
            ? getResponsiveFontSize(context, fontSize: size) * 1
            : getResponsiveFontSize(context, fontSize: size) * 1.3,
        fontWeight: fontWeight,
        fontFamily: fontFamily);
  }
}
