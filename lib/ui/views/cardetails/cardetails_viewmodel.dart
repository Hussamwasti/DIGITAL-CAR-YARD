import 'package:digitalcaryard/ui/views/cart/cart_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/shareprefs_service.dart';
import '../../common/apihelper/apihelper.dart';
import '../cart/cart_viewmodel.dart';
import '../chat/chating_view/chating_view_view.dart';
import '../home/home_view.dart';

class CardetailsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final sharedpref = locator<ShareprefsService>();

  Future<void> chat(String email) async {
    Map c = await ApiHelper.registerChat(sharedpref.readString("email"), email);
    if (c['status']) {
      _navigationService.navigateWithTransition(
          ChatingViewView(
            id: c['message'],
            did: c['did'],
          ),
          routeName: Routes.chatingViewView,
          transitionStyle: Transition.rightToLeft);
    }
  }

  void toHomeView() {
    _navigationService.replaceWithTransition(
      HomeView(),
      routeName: Routes.homeView,
      transitionStyle: Transition.leftToRight,
    );
  }

  void toCartView() {
    _navigationService.replaceWithTransition(
      CartView(),
      routeName: Routes.cartView,
      transitionStyle: Transition.leftToRight,
    );
  }
}
