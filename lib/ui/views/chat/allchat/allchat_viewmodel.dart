import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../services/shareprefs_service.dart';
import '../../home/home_view.dart';
import '../chating_view/chating_view_view.dart';

class AllchatViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final sharedpref = locator<ShareprefsService>();

  void toHomeView() {
    _navigationService.replaceWithTransition(
      HomeView(),
      routeName: Routes.homeView,
      transitionStyle: Transition.leftToRight,
    );
  }

  void toChatingViewView(String idd, String did) {
    _navigationService.navigateWithTransition(
        ChatingViewView(
          id: idd,
          did: did,
        ),
        routeName: Routes.chatingViewView,
        transitionStyle: Transition.rightToLeft);
  }
}
