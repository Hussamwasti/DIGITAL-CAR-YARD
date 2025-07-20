import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/shareprefs_service.dart';
import '../home/home_view.dart';

class OrdersViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final sharedpref = locator<ShareprefsService>();
  String type = 'My Order';

  void toHomeView() {
    _navigationService.replaceWithTransition(
      HomeView(),
      routeName: Routes.homeView,
      transitionStyle: Transition.leftToRight,
    );
  }
}
