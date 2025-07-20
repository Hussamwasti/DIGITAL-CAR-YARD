import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../common/apihelper/apihelper.dart';
import '../../../common/app_colors.dart';
import '../../../common/customwidget/button_helper.dart';
import '../../../common/customwidget/snakbar_helper.dart';
import '../../../common/customwidget/text_helper.dart';
import '../../../common/ui_helpers.dart';
import '../usercard/usercard.dart';
import 'users_model.dart';

class Users extends StackedView<UsersModel> {
  const Users({super.key});

  @override
  Widget builder(
    BuildContext context,
    UsersModel viewModel,
    Widget? child,
  ) {
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
                'All Users',
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
        Expanded(
          child: FutureBuilder(
            future: ApiHelper.allUsers(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.toString() == '[]') {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.warning_amber_rounded,
                          color: red,
                          size: getResponsiveMassiveFontSize(context),
                        ),
                        text_helper(
                          data: "No User!",
                          size: getResponsiveMediumFontSize(context),
                        ),
                      ],
                    ),
                  );
                } else {
                  return SingleChildScrollView(
                    child: GridView.builder(
                      itemCount: snapshot.data.length,
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidthFraction(context, dividedBy: 40),
                        vertical: screenHeightFraction(context, dividedBy: 20),
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: screenWidth(context) < 800 ? 2 : 4,
                        crossAxisSpacing:
                            screenWidthFraction(context, dividedBy: 20),
                        mainAxisSpacing:
                            screenHeightFraction(context, dividedBy: 40),
                        childAspectRatio: 0.63,
                      ),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final user = snapshot.data[index];
                        return UserCard(user: user);
                      },
                    ),
                  );
                }
              } else if (snapshot.hasError) {
                return Icon(
                  Icons.error,
                  size: getResponsiveLargeFontSize(context),
                );
              } else {
                return displaySimpleProgress(context);
              }
            },
          ),
        ),
      ],
    );
  }

  @override
  UsersModel viewModelBuilder(
    BuildContext context,
  ) =>
      UsersModel();
}
