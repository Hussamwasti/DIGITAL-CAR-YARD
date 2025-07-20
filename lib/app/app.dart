import 'package:digitalcaryard/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:digitalcaryard/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:digitalcaryard/ui/views/home/home_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:digitalcaryard/services/shareprefs_service.dart';
import 'package:digitalcaryard/ui/views/auth/login/login_view.dart';
import 'package:digitalcaryard/ui/views/auth/signup/signup_view.dart';
import 'package:digitalcaryard/services/fire_service.dart';
import 'package:digitalcaryard/ui/views/admins/admin/admin_view.dart';
import 'package:digitalcaryard/ui/views/cardetails/cardetails_view.dart';
import 'package:digitalcaryard/ui/views/chat/allchat/allchat_view.dart';
import 'package:digitalcaryard/ui/views/chat/chating_view/chating_view_view.dart';
import 'package:digitalcaryard/ui/views/shopkeeper/shopkeeper_view.dart';
import 'package:digitalcaryard/ui/views/productdetails/productdetails_view.dart';
import 'package:digitalcaryard/ui/views/about/about_view.dart';
import 'package:digitalcaryard/ui/views/cart/cart_view.dart';
import 'package:digitalcaryard/ui/views/orders/orders_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: SignupView),
    MaterialRoute(page: AdminView),
    MaterialRoute(page: CarDetailsView),
    MaterialRoute(page: AllchatView),
    MaterialRoute(page: ChatingViewView),
    MaterialRoute(page: ShopkeeperView),
    MaterialRoute(page: ProductdetailsView),
    MaterialRoute(page: AboutView),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: CartView),
    MaterialRoute(page: OrdersView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ShareprefsService),
    LazySingleton(classType: FireService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
