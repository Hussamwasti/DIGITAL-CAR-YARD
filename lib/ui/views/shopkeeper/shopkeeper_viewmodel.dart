import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/shareprefs_service.dart';
import '../auth/login/login_view.dart';
import '../chat/allchat/allchat_view.dart';
import '../orders/orders_view.dart';
import '../productdetails/productdetails_view.dart';

class ShopkeeperViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final sharedpref = locator<ShareprefsService>();
  TextEditingController search = TextEditingController();

  void logout() {
    _navigationService.clearStackAndShow(Routes.loginView);
    _navigationService.replaceWithTransition(const LoginView(),
        routeName: Routes.loginView, transitionStyle: Transition.rightToLeft);
  }

  Future<void> productDetails(Map data) async {
    await _navigationService.navigateWithTransition(
        ProductdetailsView(
          details: data,
        ),
        routeName: Routes.carDetailsView,
        transitionStyle: Transition.rightToLeft);
    notifyListeners();
  }

  void allChats() {
    _navigationService.navigateWithTransition(const AllchatView(),
        routeName: Routes.allchatView, transitionStyle: Transition.rightToLeft);
  }

  void orders() {
    _navigationService.navigateWithTransition(
      OrdersView(),
      routeName: Routes.ordersView,
      transitionStyle: Transition.leftToRight,
    );
  }
}
