import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import '../../../common/customwidget/button_helper.dart';
import '../../../common/customwidget/text_helper.dart';
import '../../../common/customwidget/text_view_helper.dart';
import '../../../common/ui_helpers.dart';
import 'addproduct_model.dart';

class AddProduct extends StackedView<AddproductModel> {
  const AddProduct({super.key});

  @override
  Widget builder(
    BuildContext context,
    AddproductModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: ResponsiveBuilder(
          builder: (context, sizingInformation) {
            if (sizingInformation.deviceScreenType ==
                DeviceScreenType.desktop) {
              return Column(
                children: [
                  // Header Section
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
                          'Sell Product',
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
                              width:
                                  screenWidthFraction(context, dividedBy: 200),
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
                  // Main Content
                  Expanded(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                  width: screenWidthFraction(context,
                                      dividedBy: 100)),
                              Image.asset(
                                "assets/Digital Card Yard Logo.png",
                                width:
                                    screenWidthFraction(context, dividedBy: 4),
                                height:
                                    screenWidthFraction(context, dividedBy: 5),
                              ),
                              text_helper(
                                fontFamily: "Ethnocentric",
                                data: "Digital Car Yard",
                                size: getResponsiveExtraLargeFontSize(context),
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )
                            ],
                          ),
                          SizedBox(
                              width:
                                  screenWidthFraction(context, dividedBy: 45)),
                          SizedBox(
                            width: screenWidthFraction(context, dividedBy: 2.4),
                            child: form(viewModel, context),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }

            // Mobile View
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
                        width: screenWidthFraction(context, dividedBy: 3),
                        height: screenWidthFraction(context, dividedBy: 3),
                      ),
                      text_helper(
                        fontFamily: "Ethnocentric",
                        data: "Digital Car Yard",
                        size: getResponsiveLargeFontSize(context),
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )
                    ],
                  ),
                  SizedBox(
                      height: screenHeightFraction(context, dividedBy: 20)),
                  form(viewModel, context)
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget form(AddproductModel viewModel, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidthFraction(context, dividedBy: 85),
        vertical: screenHeightFraction(context, dividedBy: 60),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidthFraction(context, dividedBy: 60),
          vertical: screenHeightFraction(context, dividedBy: 60),
        ),
        margin: EdgeInsets.symmetric(
          horizontal: screenWidthFraction(context, dividedBy: 105),
          vertical: screenHeightFraction(context, dividedBy: 60),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white24,
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
        child: Column(
          children: [
            text_helper(
              data: "Product Details",
              fontWeight: FontWeight.bold,
              size: getResponsiveLargeFontSize(context),
              fontFamily: "Saira-BlackItalic",
            ),
            SizedBox(height: screenHeightFraction(context, dividedBy: 100)),
            SizedBox(
              height: screenHeightFraction(context, dividedBy: 1.8),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Image Upload Section
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(
                          screenWidthFraction(context, dividedBy: 100)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: const Color(0xFF00CCFF).withOpacity(0.3),
                          width: 1.2,
                        ),
                      ),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () => viewModel.pickImages(),
                            child: (viewModel.images ?? []).isEmpty
                                ? Column(
                                    children: [
                                      Icon(
                                        Iconsax.camera,
                                        size: getResponsiveMassiveFontSize(
                                            context),
                                        color: const Color(0xFF00CCFF),
                                      ),
                                      SizedBox(
                                          height: screenHeightFraction(context,
                                              dividedBy: 100)),
                                      text_helper(
                                        data: "Add Product Photos",
                                        color: const Color(0xFF00CCFF),
                                        size:
                                            getResponsiveTinyFontSize(context),
                                      ),
                                    ],
                                  )
                                : Wrap(
                                    children: viewModel.imageUrls!
                                        .map((e) => Padding(
                                              padding: EdgeInsets.all(
                                                  screenWidthFraction(context,
                                                      dividedBy: 1000)),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.network(
                                                  e,
                                                  width: screenWidthFraction(
                                                      context,
                                                      dividedBy: 5),
                                                  height: screenWidthFraction(
                                                      context,
                                                      dividedBy: 5),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                  ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                        height: screenHeightFraction(context, dividedBy: 30)),

                    // Product Information Section
                    _buildSection(
                      context,
                      title: "Product Information",
                      subtitle: "(All fields are required)",
                      children: [
                        text_view_helper(
                          hint: "Enter Title",
                          prefix: Icon(
                            Iconsax.tag,
                            color: Color(0xFF00CCFF),
                            size: getResponsiveSmallFontSize(context),
                          ),
                          controller: viewModel.title,
                        ),
                        text_view_helper(
                          hint: "Enter Price",
                          textInputType: TextInputType.number,
                          formatter: [
                            FilteringTextInputFormatter.allow(getRegExpInt()),
                          ],
                          prefix: Icon(
                            Iconsax.dollar_circle,
                            color: Color(0xFF00CCFF),
                            size: getResponsiveSmallFontSize(context),
                          ),
                          controller: viewModel.price,
                        ),
                        text_view_helper(
                          hint: "Enter Description",
                          prefix: Icon(
                            Iconsax.note_text,
                            color: Color(0xFF00CCFF),
                            size: getResponsiveSmallFontSize(context),
                          ),
                          controller: viewModel.des,
                        ),
                      ],
                    ),
                    SizedBox(
                        height: screenHeightFraction(context, dividedBy: 100)),

                    // Submit Button
                    button_helper(
                      onPress: () => viewModel.adddetails(context),
                      width: screenWidth(context),
                      child: text_helper(
                        data: "Post Product →",
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                        height: screenHeightFraction(context, dividedBy: 100)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required String subtitle,
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(screenWidthFraction(context, dividedBy: 70)),
      margin:
          EdgeInsets.only(bottom: screenHeightFraction(context, dividedBy: 30)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: const Color(0xFF00CCFF).withOpacity(0.3),
          width: 1.2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text_helper(
            data: title,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            size: getResponsiveMediumFontSize(context),
          ),
          SizedBox(height: screenHeightFraction(context, dividedBy: 100)),
          text_helper(
            data: subtitle,
            color: Colors.white70,
            size: getResponsiveLittleFontSize(context),
          ),
          SizedBox(height: screenHeightFraction(context, dividedBy: 30)),
          ...children,
        ],
      ),
    );
  }

  @override
  AddproductModel viewModelBuilder(BuildContext context) => AddproductModel();
}
