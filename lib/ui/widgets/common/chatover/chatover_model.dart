import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/app.locator.dart';
import '../../../../services/shareprefs_service.dart';

class ChatoverModel extends BaseViewModel {
  final sharedpref = locator<ShareprefsService>();

  TextEditingController chat = TextEditingController();
}
