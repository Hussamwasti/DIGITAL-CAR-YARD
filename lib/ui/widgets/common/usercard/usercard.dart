import 'package:cached_network_image/cached_network_image.dart';
import 'package:digitalcaryard/ui/widgets/common/usercard/usercard_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../common/apihelper/apihelper.dart';
import '../../../common/app_colors.dart';
import '../../../common/customwidget/button_helper.dart';
import '../../../common/customwidget/snakbar_helper.dart';
import '../../../common/customwidget/text_helper.dart';
import '../../../common/ui_helpers.dart';

class UserCard extends StackedView<UserCardModel> {
  final dynamic user;
  const UserCard({required this.user, super.key});

  @override
  Widget builder(BuildContext context, UserCardModel viewModel, Widget? child) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: screenHeightFraction(context, dividedBy: 80),
        horizontal: screenWidthFraction(context, dividedBy: 100),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: screenWidthFraction(context, dividedBy: 150),
        vertical: screenHeightFraction(context, dividedBy: 150),
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E2F),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF00CCFF).withOpacity(0.3),
          width: 1.2,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Avatar
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFF00CCFF).withOpacity(0.5),
                  width: 1.2,
                ),
                borderRadius: BorderRadius.circular(14),
              ),
              child: CachedNetworkImage(
                imageUrl: user["img"] ?? '',
                imageBuilder: (context, imageProvider) => Container(
                  height: screenHeightFraction(context, dividedBy: 3),
                  width: screenWidthFraction(context, dividedBy: 1.8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => displaySimpleProgress(context),
                errorWidget: (context, url, error) => Icon(
                  Icons.error,
                  color: Colors.red,
                  size: getResponsiveLargeFontSize(context),
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeightFraction(context, dividedBy: 80)),

          // User Info
          text_helper(
            data: user['name'] ?? 'No Name',
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
            maxLines: 1,
            size: getResponsiveMediumFontSize(context),
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: screenHeightFraction(context, dividedBy: 200)),
          text_helper(
            data: user['email'] ?? 'No Email',
            fontWeight: FontWeight.bold,
            color: Colors.green,
            maxLines: 1,
            size: getResponsiveLittleFontSize(context),
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: screenHeightFraction(context, dividedBy: 200)),
          text_helper(
            data: user['number'] ?? 'No Number',
            fontWeight: FontWeight.bold,
            color: Colors.white70,
            maxLines: 1,
            size: getResponsiveLittleFontSize(context),
            overflow: TextOverflow.ellipsis,
          ),

          SizedBox(height: screenHeightFraction(context, dividedBy: 100)),

          // Delete Button
          button_helper(
            width: screenWidthFraction(context, dividedBy: 3),
            borderColor: Colors.red,
            color: Colors.red,
            onPress: () => viewModel.showDeleteDialog(context, user['_id']),
            child: Text(
              "Delete",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "SourceSans3",
                fontWeight: FontWeight.bold,
                fontSize: getResponsiveSmallFontSize(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  UserCardModel viewModelBuilder(BuildContext context) => UserCardModel();
}
