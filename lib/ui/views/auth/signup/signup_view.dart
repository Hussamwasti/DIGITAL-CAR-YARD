import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import '../../../common/app_colors.dart';
import '../../../common/customwidget/button_helper.dart';
import '../../../common/customwidget/text_helper.dart';
import '../../../common/customwidget/text_view_helper.dart';
import '../../../common/ui_helpers.dart';
import 'signup_viewmodel.dart';

class SignupView extends StackedView<SignupViewModel> {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignupViewModel viewModel,
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

  Widget form(SignupViewModel viewModel, BuildContext context, bool isDesktop) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        isDesktop
            ? screenWidthFraction(context, dividedBy: 60)
            : screenWidthFraction(context, dividedBy: 10),
        screenHeightFraction(context, dividedBy: 20),
        isDesktop
            ? screenWidthFraction(context, dividedBy: 60)
            : screenWidthFraction(context, dividedBy: 10),
        screenHeightFraction(context, dividedBy: 20),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height - (isDesktop ? 150 : 80),
        padding: EdgeInsets.only(
          left: isDesktop
              ? screenWidthFraction(context, dividedBy: 60)
              : screenWidthFraction(context, dividedBy: 30),
          right: isDesktop
              ? screenWidthFraction(context, dividedBy: 60)
              : screenWidthFraction(context, dividedBy: 30),
          top: isDesktop
              ? screenHeightFraction(context, dividedBy: 60)
              : screenHeightFraction(context, dividedBy: 30),
          bottom: isDesktop
              ? screenHeightFraction(context, dividedBy: 60)
              : screenHeightFraction(context, dividedBy: 30),
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
            ),
          ],
        ),
        child: Column(
          children: [
            text_helper(
              data: "Sign Up",
              fontWeight: FontWeight.bold,
              size: getResponsiveFontSize(context,
                  fontSize: (isDesktop ? 20 : 50)),
              fontFamily: "Saira-BlackItalic",
            ),
            verticalSpaceLarge(context),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      constraints: BoxConstraints(
                        minWidth: screenWidthCustom(context, 0.15),
                        maxWidth: screenWidthCustom(context, 0.9),
                      ),
                      padding: EdgeInsets.only(
                        left: isDesktop
                            ? screenWidthFraction(context, dividedBy: 60)
                            : screenWidthFraction(context, dividedBy: 30),
                        right: isDesktop
                            ? screenWidthFraction(context, dividedBy: 60)
                            : screenWidthFraction(context, dividedBy: 30),
                        top: isDesktop
                            ? screenHeightFraction(context, dividedBy: 90)
                            : screenHeightFraction(context, dividedBy: 90),
                        bottom: isDesktop
                            ? screenHeightFraction(context, dividedBy: 90)
                            : screenHeightFraction(context, dividedBy: 90),
                      ),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(100), // Fully circular
                        border: Border.all(
                          color: const Color(0xFF00CCFF),
                          width: 1.2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF00CCFF).withOpacity(0.15),
                          ),
                        ],
                      ),
                      child: Material(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(100),
                          onTap: () => viewModel.pickImage(),
                          child: viewModel.image == null
                              ? Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.person,
                                        color: Color(0xFF00CCFF),
                                        size: getResponsiveFontSize(context,
                                            fontSize: (isDesktop
                                                ? 50
                                                : 70)), // Larger icon
                                      ),
                                      Text(
                                        'Upload Your Image',
                                        style: TextStyle(
                                            fontSize: getResponsiveFontSize(
                                                context,
                                                fontSize:
                                                    (isDesktop ? 12 : 27)),
                                            color: Color(0xFF00CCFF),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.network(
                                    viewModel.imageUrl!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    verticalSpaceLarge(context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        cat(context, viewModel, " User ", "User Type",
                            isDesktop),
                        cat(context, viewModel, "Seller", "Seller Type",
                            isDesktop),
                      ],
                    ),
                    verticalSpaceTiny(context),
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
                      hint: "Name",
                      size: getResponsiveFontSize(context,
                          fontSize: (isDesktop ? 12 : 30)),
                      prefix: Icon(
                        Iconsax.profile_2user,
                        color: Color(0xFF00CCFF),
                        size: getResponsiveFontSize(context,
                            fontSize: (isDesktop ? 15 : 35)),
                      ),
                      controller: viewModel.name,
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
                      hint: "Number",
                      size: getResponsiveFontSize(context,
                          fontSize: (isDesktop ? 12 : 30)),
                      prefix: Icon(
                        Iconsax.call,
                        color: Color(0xFF00CCFF),
                        size: getResponsiveFontSize(context,
                            fontSize: (isDesktop ? 15 : 35)),
                      ),
                      maxLength: 11,
                      textInputType: TextInputType.phone,
                      formatter: [
                        FilteringTextInputFormatter.allow(getRegExpInt())
                      ],
                      controller: viewModel.number,
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
                      controller: viewModel.pass,
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
                      hint: "Confirm Password",
                      size: getResponsiveFontSize(context,
                          fontSize: (isDesktop ? 12 : 30)),
                      prefix: Icon(
                        Iconsax.password_check,
                        color: Color(0xFF00CCFF),
                        size: getResponsiveFontSize(context,
                            fontSize: (isDesktop ? 15 : 35)),
                      ),
                      obscure: true,
                      controller: viewModel.conpass,
                    ),
                    verticalSpaceMassive(context),
                    button_helper(
                      width: screenWidthFraction(context,
                          dividedBy: (isDesktop ? 10 : 6)),
                      onPress: () => viewModel.signup(context),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          text_helper(
                            size: getResponsiveFontSize(context,
                                fontSize: (isDesktop ? 10 : 25)),
                            data: "Sign Up →",
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                    verticalSpaceMassive(context),
                    InkWell(
                      onTap: () => viewModel.login(),
                      child: text_helper(
                        size: getResponsiveFontSize(context,
                            fontSize: (isDesktop ? 8 : 20)),
                        data: "Already Have Account?",
                        fontFamily: "SourceSans3",
                      ),
                    ),
                    verticalSpaceTiny(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cat(BuildContext context, SignupViewModel viewModel, String title,
      String type, bool isDesktop) {
    return Expanded(
      child: InkWell(
        onTap: () {
          viewModel.type = type;
          viewModel.notifyListeners();
        },
        child: Container(
          padding: EdgeInsets.only(
            left: isDesktop
                ? screenWidthFraction(context, dividedBy: 60)
                : screenWidthFraction(context, dividedBy: 30),
            right: isDesktop
                ? screenWidthFraction(context, dividedBy: 60)
                : screenWidthFraction(context, dividedBy: 30),
            top: isDesktop
                ? screenHeightFraction(context, dividedBy: 60)
                : screenHeightFraction(context, dividedBy: 60),
            bottom: isDesktop
                ? screenHeightFraction(context, dividedBy: 60)
                : screenHeightFraction(context, dividedBy: 60),
          ),
          margin: EdgeInsets.fromLTRB(
            isDesktop
                ? screenWidthFraction(context, dividedBy: 60)
                : screenWidthFraction(context, dividedBy: 30),
            screenHeightFraction(context, dividedBy: 100),
            isDesktop
                ? screenWidthFraction(context, dividedBy: 60)
                : screenWidthFraction(context, dividedBy: 30),
            screenHeightFraction(context, dividedBy: 100),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: viewModel.type == type
                  ? const Color(0xFF00CCFF)
                  : unselectedColor,
              width: 1.5,
            ),
            // boxShadow: [
            //   BoxShadow(
            //     color: viewModel.type == type
            //         ? const Color(0xFF00CCFF).withOpacity(0.3)
            //         : Colors.transparent,
            //     blurRadius: 6,
            //     offset: const Offset(0, 3),
            //   )
            // ],
            color: const Color(0xFF1E1E2F),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                type == "User Type" ? Icons.person : Icons.store,
                color: viewModel.type == type
                    ? const Color(0xFF00CCFF)
                    : unselectedColor,
                size: getResponsiveFontSize(context,
                    fontSize: (isDesktop ? 20 : 50)),
              ),
              verticalSpaceTiny(context),
              Text(
                title,
                style: TextStyle(
                  color: viewModel.type == type
                      ? const Color(0xFF00CCFF)
                      : Colors.white60,
                  fontWeight: FontWeight.bold,
                  fontSize: getResponsiveFontSize(context,
                      fontSize: (isDesktop ? 12 : 30)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  SignupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignupViewModel();
}
