import 'package:digitalcaryard/ui/common/app_colors.dart';
import 'package:digitalcaryard/ui/common/customwidget/text_helper.dart';
import 'package:digitalcaryard/ui/common/customwidget/text_view_helper.dart';
import 'package:digitalcaryard/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import '../../../common/customwidget/button_helper.dart';
import 'login_viewmodel.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({super.key});

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: ResponsiveBuilder(
          builder: (context, sizingInformation) {
            if (sizingInformation.deviceScreenType ==
                DeviceScreenType.desktop) {
              return Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          "assets/Digital Card Yard Logo.png",
                          width: screenWidthCustom(context, 0.25),
                          height: screenWidthCustom(context, 0.20),
                        ),
                        text_helper(
                          fontFamily: "Ethnocentric",
                          data: "Digital Car Yard",
                          size: getResponsiveFontSize(context, fontSize: 25),
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )
                      ],
                    ),
                    horizontalSpaceLarge(context),
                    horizontalSpaceLarge(context),
                    SizedBox(
                      width: screenWidthCustom(context, 0.4),
                      child: form(viewModel, context, true),
                    ),
                  ],
                ),
              );
            }

            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/Digital Card Yard Logo.png",
                        width: screenWidthCustom(context, 0.25),
                        height: screenWidthCustom(context, 0.25),
                      ),
                      text_helper(
                        fontFamily: "Ethnocentric",
                        data: "Digital Car Yard",
                        size: getResponsiveFontSize(context, fontSize: 40),
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )
                    ],
                  ),
                  verticalSpaceMedium(context),
                  form(viewModel, context, false)
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget form(LoginViewModel viewModel, BuildContext context, bool isDesktop) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        isDesktop
            ? screenWidthFraction(context, dividedBy: 60)
            : screenWidthFraction(context, dividedBy: 10),
        screenHeightFraction(context, dividedBy: 10),
        isDesktop
            ? screenWidthFraction(context, dividedBy: 60)
            : screenWidthFraction(context, dividedBy: 10),
        screenHeightFraction(context, dividedBy: 30),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height - (isDesktop ? 280 : 220),
        padding: EdgeInsets.only(
          left: isDesktop
              ? screenWidthFraction(context, dividedBy: 60)
              : screenWidthFraction(context, dividedBy: 30),
          right: isDesktop
              ? screenWidthFraction(context, dividedBy: 60)
              : screenWidthFraction(context, dividedBy: 30),
        ),
        margin: EdgeInsets.fromLTRB(
          isDesktop
              ? screenWidthFraction(context, dividedBy: 60)
              : screenWidthFraction(context, dividedBy: 30),
          screenHeightFraction(context, dividedBy: 3000),
          isDesktop
              ? screenWidthFraction(context, dividedBy: 60)
              : screenWidthFraction(context, dividedBy: 30),
          screenHeightFraction(context, dividedBy: 20),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white24,
          border: Border.all(
            color: const Color(0xFF00CCFF), // Aqua border
            width: 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF00CCFF).withOpacity(0.15),
              // blurRadius: 10,
              // offset: const Offset(5, 5),
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              verticalSpaceMedium(context),
              text_helper(
                data: "Login",
                fontWeight: FontWeight.bold,
                size: getResponsiveFontSize(context,
                    fontSize: (isDesktop ? 20 : 50)),
                fontFamily: "Saira-BlackItalic",
              ),
              verticalSpaceMedium(context),
              text_view_helper(
                padding: EdgeInsetsDirectional.only(
                  start: isDesktop
                      ? screenWidthFraction(context, dividedBy: 100)
                      : screenWidthFraction(context, dividedBy: 30),
                  end: isDesktop
                      ? screenWidthFraction(context, dividedBy: 100)
                      : screenWidthFraction(context, dividedBy: 30),
                  top: isDesktop
                      ? screenWidthFraction(context, dividedBy: 80)
                      : screenWidthFraction(context, dividedBy: 40),
                ),
                hint: "Email",
                size: getResponsiveFontSize(context,
                    fontSize: (isDesktop ? 12 : 30)),
                prefix: Icon(
                  Iconsax.message,
                  color: Color(0xFF00CCFF),
                  size: getResponsiveFontSize(context,
                      fontSize: (isDesktop ? 15 : 35)),
                ),
                controller: viewModel.email,
              ),
              text_view_helper(
                padding: EdgeInsetsDirectional.only(
                  start: isDesktop
                      ? screenWidthFraction(context, dividedBy: 100)
                      : screenWidthFraction(context, dividedBy: 30),
                  end: isDesktop
                      ? screenWidthFraction(context, dividedBy: 100)
                      : screenWidthFraction(context, dividedBy: 30),
                  top: isDesktop
                      ? screenWidthFraction(context, dividedBy: 80)
                      : screenWidthFraction(context, dividedBy: 30),
                ),
                hint: "Password",
                size: getResponsiveFontSize(context,
                    fontSize: (isDesktop ? 12 : 30)),
                prefix: Icon(
                  Iconsax.password_check,
                  color: Color(0xFF00CCFF),
                  size: getResponsiveFontSize(context,
                      fontSize: (isDesktop ? 15 : 35)),
                ),
                obscure: true,
                controller: viewModel.password,
              ),
              verticalSpaceLarge(context),
              Padding(
                padding: EdgeInsets.only(
                  right: isDesktop
                      ? screenWidthFraction(context, dividedBy: 60)
                      : screenWidthFraction(context, dividedBy: 30),
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () => viewModel.forgetpassword(context),
                    child: text_helper(
                      data: "Forgot Password?",
                      size: getResponsiveFontSize(context,
                          fontSize: (isDesktop ? 8 : 20)),
                      fontFamily: "SourceSans3",
                      textDecoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              verticalSpaceMassive(context),
              button_helper(
                width: screenWidthFraction(context,
                    dividedBy: (isDesktop ? 10 : 6)),
                onPress: () => viewModel.login(context),
                child: text_helper(
                  size: getResponsiveFontSize(context,
                      fontSize: (isDesktop ? 10 : 25)),
                  data: "Login  →",
                  fontWeight: FontWeight.bold,
                ),
              ),
              verticalSpaceMassive(context),
              InkWell(
                onTap: () => viewModel.singup(),
                child: text_helper(
                  size: getResponsiveFontSize(context,
                      fontSize: (isDesktop ? 8 : 20)),
                  data: "Don't Have Account? Sign Up!",
                  fontFamily: "SourceSans3",
                ),
              ),
              verticalSpaceTiny(context),
            ],
          ),
        ),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
