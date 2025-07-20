import 'package:stacked/stacked.dart';

import '../../../../app/app.locator.dart';
import '../../../../services/shareprefs_service.dart';

class UsersModel extends BaseViewModel {
  final sharedpref = locator<ShareprefsService>();
}
