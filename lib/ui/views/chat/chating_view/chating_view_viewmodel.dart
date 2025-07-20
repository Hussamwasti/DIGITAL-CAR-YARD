import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../services/shareprefs_service.dart';
import '../allchat/allchat_view.dart';

class ChatingViewViewModel extends BaseViewModel {
  final sharedpref = locator<ShareprefsService>();
  final _navigationService = locator<NavigationService>();
  TextEditingController chat = TextEditingController();

  // Navigate to AllChat View
  void toAllChatView() {
    _navigationService.replaceWithTransition(
      AllchatView(),
      routeName: Routes.allchatView,
      transitionStyle: Transition.leftToRight,
    );
  }
}
