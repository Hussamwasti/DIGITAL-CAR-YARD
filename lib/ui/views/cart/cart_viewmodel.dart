import 'package:digitalcaryard/ui/common/apihelper/apihelper.dart';
import 'package:digitalcaryard/ui/common/customwidget/snakbar_helper.dart';
import 'package:digitalcaryard/ui/views/cardetails/cardetails_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/shareprefs_service.dart';
import '../home/home_view.dart';

class CartViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final sharedpref = locator<ShareprefsService>();

  String total = "0";

  void removeFromCart(String id) {
    ApiHelper.deletecart(id);
    notifyListeners();
  }

  void increaseQuantity(String id, String q) {
    ApiHelper.changecartproduct(id, q);
    notifyListeners();
  }

  void decreaseQuantity(String id, String q) {
    if (int.parse(q) < 1) return;
    ApiHelper.changecartproduct(id, q);
    notifyListeners();
  }

  void checkout(BuildContext context) {
    displayProgress(context);
    ApiHelper.checkout(sharedpref.readString("email"));
    hideProgress(context);
    notifyListeners();
  }

  void toHomeView() {
    _navigationService.replaceWithTransition(
      HomeView(),
      routeName: Routes.homeView,
      transitionStyle: Transition.leftToRight,
    );
  }

  Future<void> up() async {
    await Future.delayed(Duration(seconds: 1));
    notifyListeners();
  }
}
