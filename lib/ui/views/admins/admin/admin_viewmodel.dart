import 'package:digitalcaryard/ui/views/auth/login/login_view.dart';
import 'package:digitalcaryard/ui/views/productdetails/productdetails_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../services/shareprefs_service.dart';
import '../../cardetails/cardetails_view.dart';
import '../../chat/allchat/allchat_view.dart';

class AdminViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final sharedpref = locator<ShareprefsService>();

  String type = 'Cars';

  void logout() {
    _navigationService.clearStackAndShow(Routes.loginView);
    _navigationService.replaceWithTransition(const LoginView(),
        routeName: Routes.loginView, transitionStyle: Transition.rightToLeft);
  }

  Future<void> carDetails(Map data) async {
    await _navigationService.navigateWithTransition(
        CarDetailsView(
          details: data,
          type: "a",
        ),
        routeName: Routes.carDetailsView,
        transitionStyle: Transition.rightToLeft);
    notifyListeners();
  }

  Future<void> productDetails(Map data) async {
    await _navigationService.navigateWithTransition(
        ProductdetailsView(
          details: data,
          type: "a",
        ),
        routeName: Routes.carDetailsView,
        transitionStyle: Transition.rightToLeft);
    notifyListeners();
  }

  void allChats() {
    _navigationService.navigateWithTransition(const AllchatView(),
        routeName: Routes.allchatView, transitionStyle: Transition.rightToLeft);
  }
}
