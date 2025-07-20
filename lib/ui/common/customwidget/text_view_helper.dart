import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../app_colors.dart';

class text_view_helper extends StatelessWidget {
  text_view_helper({
    super.key,
    required this.hint,
    required this.controller,
    this.size,
    this.hintColor,
    this.textColor,
    this.fontWeight = FontWeight.w500,
    this.obscure = false,
    this.textInputType = TextInputType.text,
    this.maxLines = 1,
    this.maxLength,
    this.padding = const EdgeInsetsDirectional.all(8),
    this.prefix,
    this.suffix,
    this.onChange,
    this.onSubmit,
    this.formatter = const [],
    this.isError = false,
  });

  String hint;
  double? size;
  Color? hintColor, textColor;
  bool obscure;
  FontWeight fontWeight;
  int? maxLines, maxLength;
  TextInputType textInputType;
  TextEditingController controller;
  EdgeInsetsDirectional padding;
  final Function(String)? onChange;
  final Function(String)? onSubmit;
  List<TextInputFormatter> formatter;
  Widget? prefix, suffix;
  final bool isError;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final responsiveFontSize = size ?? screenWidth * 0.012;
    final radius = screenWidth * 0.07;
    final contentVertical = screenHeight * 0.01;
    final contentHorizontal = screenWidth * 0.03;

    return Padding(
      padding: padding,
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType,
        style: TextStyle(
          color: textColor ?? Colors.white,
          fontSize: responsiveFontSize,
          fontWeight: fontWeight,
          letterSpacing: 0.5,
        ),
        cursorColor: const Color(0xFF00CCFF),
        cursorWidth: screenWidth * 0.0015,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(
            vertical: contentVertical,
            horizontal: contentHorizontal,
          ),
          hintText: hint,
          hintStyle: TextStyle(
            color: hintColor ?? Colors.white60,
            fontSize: responsiveFontSize,
            fontWeight: FontWeight.w500,
          ),
          prefixIcon: prefix,
          suffix: suffix,
          filled: true,
          fillColor: const Color(0xFF1E1E2F),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: isError ? Colors.red : const Color(0xFF00CCFF),
              width: 1.2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: isError ? Colors.red : unselectedColor,
              width: 1.2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: isError ? Colors.red : const Color(0xFF00CCFF),
              width: 1.2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.2,
            ),
          ),
          counterText: "",
        ),
        inputFormatters: formatter,
        obscureText: obscure,
        maxLines: maxLines,
        maxLength: maxLength,
        onFieldSubmitted: onSubmit != null ? (value) => onSubmit!(value) : null,
        onChanged: onChange != null ? (value) => onChange!(value) : null,
      ),
    );
  }
}
