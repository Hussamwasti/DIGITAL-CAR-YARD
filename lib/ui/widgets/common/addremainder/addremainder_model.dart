import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/app.locator.dart';
import '../../../../services/shareprefs_service.dart';
import '../../../common/apihelper/apihelper.dart';
import '../../../common/customwidget/snakbar_helper.dart';

class AddremainderModel extends BaseViewModel {
  final _sharedpref = locator<ShareprefsService>();

  TextEditingController title = TextEditingController();
  TextEditingController des = TextEditingController();
  TextEditingController freq = TextEditingController();
  TextEditingController date = TextEditingController();

  Future<void> addDetails(BuildContext context) async {
    if (title.text.isEmpty) {
      show_snackbar(context, "Enter Title");
    } else if (des.text.isEmpty) {
      show_snackbar(context, "Enter Description");
    } else if (freq.text.isEmpty) {
      show_snackbar(context, "Enter Frequency in Days");
    } else if (date.text.isEmpty) {
      show_snackbar(context, "Enter Date");
    } else {
      displayProgress(context);
      await ApiHelper.registerRemainder(title.text, des.text, date.text,
          _sharedpref.readString("email"), freq.text, context);
      hideProgress(context);
      Navigator.pop(context);
    }
  }
}
