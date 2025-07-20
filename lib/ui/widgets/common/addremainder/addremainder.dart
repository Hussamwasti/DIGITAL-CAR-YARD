import 'package:digitalcaryard/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import '../../../common/customwidget/button_helper.dart';
import '../../../common/customwidget/text_helper.dart';
import '../../../common/customwidget/text_view_helper.dart';
import '../../../common/ui_helpers.dart';
import '../btn/btn.dart';
import 'addremainder_model.dart';

class AddRemainder extends StackedView<AddremainderModel> {
  const AddRemainder({super.key});

  @override
  Widget builder(
    BuildContext context,
    AddremainderModel viewModel,
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
                          'Add Remainder',
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

  Widget form(AddremainderModel viewModel, BuildContext context) {
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              text_helper(
                data: "Add Remainder",
                fontWeight: FontWeight.bold,
                size: getResponsiveLargeFontSize(context),
                fontFamily: "Saira-BlackItalic",
              ),
              verticalSpaceTiny(context),
              text_view_helper(
                hint: "Enter Title",
                prefix: Icon(
                  Iconsax.edit_2,
                  color: Color(0xFF00CCFF),
                  size: getResponsiveMediumFontSize(context),
                ),
                controller: viewModel.title,
              ),
              text_view_helper(
                hint: "Enter Description",
                prefix: Icon(
                  Iconsax.note_text,
                  color: Color(0xFF00CCFF),
                  size: getResponsiveMediumFontSize(context),
                ),
                controller: viewModel.des,
              ),
              text_view_helper(
                hint: "Enter Frequency in days",
                prefix: Icon(
                  Iconsax.calendar_1,
                  color: Color(0xFF00CCFF),
                  size: getResponsiveMediumFontSize(context),
                ),
                formatter: [FilteringTextInputFormatter.allow(getRegExpInt())],
                controller: viewModel.freq,
              ),
              verticalSpaceSmall(context),
              Padding(
                padding: EdgeInsets.all(
                    screenWidthFraction(context, dividedBy: 100)),
                child: InkWell(
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                      builder: (context, child) {
                        return Theme(
                          data: ThemeData.light().copyWith(
                            colorScheme: ColorScheme.dark(
                              primary: customBlueColor,
                              onPrimary: Colors.white,
                            ),
                            dialogBackgroundColor: Colors.white,
                          ),
                          child: child!,
                        );
                      },
                    );
                    if (pickedDate != null) {
                      viewModel.date.text =
                          pickedDate.toString().substring(0, 10);
                      viewModel.notifyListeners();
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(
                        screenWidthFraction(context, dividedBy: 100)),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.7,
                        color: const Color(0xFF00CCFF).withOpacity(0.5),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Iconsax.calendar,
                          color: Color(0xFF00CCFF),
                          size: getResponsiveMediumLargeFontSize(context),
                        ),
                        horizontalSpaceSmall(context),
                        text_helper(
                          color: customBlueColor,
                          data: viewModel.date.text.isEmpty
                              ? "Select Date"
                              : viewModel.date.text,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              verticalSpaceSmall(context),
              verticalSpaceSmall(context),
              button_helper(
                onPress: () => viewModel.addDetails(context),
                width: screenWidth(context),
                child: text_helper(
                  data: "Add Remainder  →",
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              verticalSpaceMedium(context),
            ],
          ),
        ),
      ),
    );
  }

  @override
  AddremainderModel viewModelBuilder(BuildContext context) =>
      AddremainderModel();
}
