import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../common/apihelper/apihelper.dart';
import '../../../common/app_colors.dart';
import '../../../common/customwidget/button_helper.dart';
import '../../../common/customwidget/snakbar_helper.dart';
import '../../../common/customwidget/text_helper.dart';
import '../../../common/ui_helpers.dart';

class UserCardModel extends BaseViewModel {
  Future<void> showDeleteDialog(BuildContext context, String userId) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: appbarBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: customBlueColor,
              width: 1.2,
            ),
          ),
          title: text_helper(
            color: Colors.red,
            data: "DELETE USER",
            fontWeight: FontWeight.bold,
            size: getResponsiveMediumLargeFontSize(context),
          ),
          content: text_helper(data: "Are you sure?"),
          actions: [
            button_helper(
              onPress: () => Navigator.pop(context),
              child: text_helper(data: "No"),
            ),
            button_helper(
              borderColor: Colors.red,
              color: Colors.red,
              onPress: () async {
                displayProgress(context);
                await ApiHelper.deleteUser(userId);
                hideProgress(context);
                notifyListeners();
                Navigator.pop(context);
              },
              child: text_helper(data: "Yes"),
            ),
          ],
        );
      },
    );
  }
}
