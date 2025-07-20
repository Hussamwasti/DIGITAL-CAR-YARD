import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/ui_helpers.dart';
import '../home/content7.dart';
import 'about_viewmodel.dart';

class AboutView extends StackedView<AboutViewModel> {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AboutViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: screenHeightFraction(context, dividedBy: 6.5),
            padding: EdgeInsets.all(
              screenWidthFraction(context, dividedBy: 100),
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF0A0F25),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              border: Border(
                bottom: BorderSide(
                  color: const Color(0xFF00CCFF).withOpacity(0.5),
                  width: 1.5,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "assets/Digital Card Yard Logo.png",
                    width: screenWidthFraction(context, dividedBy: 15),
                    height: screenWidthFraction(context, dividedBy: 4),
                  ),
                ),
                Text(
                  'About Us',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: getResponsiveMassiveFontSize(context),
                    fontWeight: FontWeight.bold,
                    fontFamily: "Saira-BlackItalic",
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: getResponsiveLargeFontSize(context),
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    SizedBox(
                      width: screenWidthFraction(context, dividedBy: 200),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: screenWidthFraction(context, dividedBy: 1000),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0066FF), Color(0xFF00CCFF)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
          verticalSpaceLarge(context),
          verticalSpaceLarge(context),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 1200) {
                return DesktopHeaderContent7();
              } else if (constraints.maxWidth > 800 &&
                  constraints.maxWidth < 1200) {
                return DesktopHeaderContent7();
              } else {
                return MobileHeaderContent7();
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  AboutViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AboutViewModel();
}
