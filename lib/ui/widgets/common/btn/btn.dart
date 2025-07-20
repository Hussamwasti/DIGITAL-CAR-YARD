import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../common/ui_helpers.dart';
import 'btn_model.dart';

class Btn extends StackedView<BtnModel> {
  final String buttonId;
  final String? title;
  final VoidCallback function;
  final Color? buttonColor;
  final Color? splashColor;
  final Color? borderColor;
  final Color? shadowColor;
  final Color? hoverColor;
  final Icon? icon;
  const Btn({
    Key? key,
    required this.buttonId,
    this.title,
    required this.function,
    this.buttonColor,
    this.splashColor,
    this.borderColor,
    this.shadowColor,
    this.hoverColor,
    this.icon,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BtnModel viewModel,
    Widget? child,
  ) {
    const Color defaultButtonColor = Color(0xFF1E1E2F);
    final buttonColor1 = buttonColor ?? defaultButtonColor;
    const Color defaultSplashColor = Color(0xFF1E8EDA);
    final splashColor1 = splashColor ?? defaultSplashColor;
    const Color defaultBorderColor = Color(0xFF00CCFF);
    final borderColor1 = borderColor ?? defaultBorderColor;
    const Color defaultBorderShadowColor = Color(0xFF00CCFF);
    final borderShadowColor1 = shadowColor ?? defaultBorderShadowColor;
    const Color defaultHoverColor = Color(0xff1E8EDA);
    final hoverColor1 = hoverColor ?? defaultHoverColor;

    return InkWell(
      onTap: function,
      borderRadius: BorderRadius.circular(10),
      splashColor: splashColor1.withOpacity(0.2),
      child: MouseRegion(
        onHover: (_) => viewModel.setHover(true),
        onExit: (_) => viewModel.setHover(false),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth(context) < 800
                ? screenWidthFraction(context, dividedBy: 100)
                : screenWidthFraction(context, dividedBy: 50),
            vertical: screenWidth(context) < 800
                ? screenHeightFraction(context, dividedBy: 1000)
                : screenHeightFraction(context, dividedBy: 60),
          ),
          decoration: BoxDecoration(
            color: viewModel.isHovered ? hoverColor1 : buttonColor1,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: borderColor1,
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: borderShadowColor1.withOpacity(0.15),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: Row(
              children: [
                icon ?? const SizedBox(),
                title != null
                    ? Text(
                        title!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: getResponsiveFontSize(context,
                              fontSize: (screenWidth(context) < 800 ? 12 : 12)),
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.5,
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  BtnModel viewModelBuilder(BuildContext context) => BtnModel();
}
