import 'package:digitalcaryard/ui/views/cardetails/cardetails_view.dart';
import 'package:digitalcaryard/ui/views/chat/allchat/allchat_view.dart';
import 'package:digitalcaryard/ui/widgets/common/searchbar/searchbar_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/shareprefs_service.dart';
import '../auth/login/login_view.dart';
import '../cart/cart_view.dart';
import '../productdetails/productdetails_view.dart';
import '../orders/orders_view.dart';

class HomeViewModel extends FutureViewModel<List<dynamic>> {
  final _navigationService = locator<NavigationService>();
  final sharedpref = locator<ShareprefsService>();

  String type = 'Cars';

  void logout() {
    _navigationService.clearStackAndShow(Routes.loginView);
    _navigationService.replaceWithTransition(const LoginView(),
        routeName: Routes.loginView, transitionStyle: Transition.rightToLeft);
  }

  void toCartView() {
    _navigationService.navigateWithTransition(
      CartView(),
      routeName: Routes.cartView,
      transitionStyle: Transition.leftToRight,
    );
  }

  void allChats() {
    _navigationService.navigateWithTransition(const AllchatView(),
        routeName: Routes.allchatView, transitionStyle: Transition.rightToLeft);
  }

  void carDetails(Map data) async {
    await _navigationService.navigateWithTransition(
      CarDetailsView(
        details: data,
        type: "u",
      ),
      routeName: Routes.carDetailsView,
      transitionStyle: Transition.rightToLeft,
    );
    notifyListeners();
  }

  Future<void> productDetails(Map data) async {
    await _navigationService.navigateWithTransition(
      ProductdetailsView(
        details: data,
        type: "u",
      ),
      routeName: Routes.productdetailsView,
      transitionStyle: Transition.rightToLeft,
    );
    notifyListeners();
  }

  void orders() {
    _navigationService.navigateWithTransition(
      OrdersView(),
      routeName: Routes.ordersView,
      transitionStyle: Transition.leftToRight,
    );
  }

  @override
  Future<List> futureToRun() {
    // TODO: implement futureToRun
    throw UnimplementedError();
  }
}
