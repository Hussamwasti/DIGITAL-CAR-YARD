import 'package:digitalcaryard/ui/views/auth/signup/signup_view.dart';
import 'package:digitalcaryard/ui/views/home/home_view.dart';
import 'package:digitalcaryard/ui/views/shopkeeper/shopkeeper_view.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../services/fire_service.dart';
import '../../../../services/shareprefs_service.dart';
import '../../../common/apihelper/apihelper.dart';
import '../../../common/app_colors.dart' as Colors;
import '../../../common/customwidget/snakbar_helper.dart';
import '../../admins/admin/admin_view.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _firebase = locator<FireService>();
  final _sharedpref = locator<ShareprefsService>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> login(BuildContext context) async {
    if (email.text.isEmpty) {
      show_snackbar(context, "Email is required", Colors.red);
    } else if (password.text.isEmpty) {
      show_snackbar(context, "Password cannot be empty", Colors.red);
    } else if (!EmailValidator.validate(email.text)) {
      show_snackbar(context, "Enter correct email", Colors.red);
    } else if (email.text == "admin@admin.com" && password.text == "admin") {
      // // ✅ Fixed block — saving full admin info
      // _sharedpref.setString('email', email.text);
      // _sharedpref.setString('name', 'Admin');
      // _sharedpref.setString('img', '');
      // _sharedpref.setString('type', 'admin');
      // _sharedpref.setString("auth", 'true');

      _navigationService.clearStackAndShow(Routes.adminView);
      // _navigationService.replaceWithTransition(AdminView(),
      //     routeName: Routes.adminView, transitionStyle: Transition.rightToLeft);
    } else {
      try {
        displayProgress(context);

        // ✅ Firebase login
        UserCredential credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: email.text.trim(), password: password.text.trim());

        // ❗ Email verification check
        if (!credential.user!.emailVerified) {
          hideProgress(context);
          show_snackbar(
              context, "Please verify your email before login", Colors.red);
          return;
        }

        // ✅ Your backend login
        var result =
            await ApiHelper.login(email.text, password.text, "", context);

        hideProgress(context);

        String type = result['type'];
        _sharedpref.setString('name', result['name']);
        _sharedpref.setString('number', result['number']);
        _sharedpref.setString('email', result['email']);
        _sharedpref.setString('img', result['img']);
        _sharedpref.setString('deviceid', result['img']);
        _sharedpref.setString("auth", 'true');
        _sharedpref.setString("type", type);

        // ✅ Role-based routing
        if (type == 'Seller Type') {
          _navigationService.clearStackAndShow(Routes.shopkeeperView);
          _navigationService.replaceWithTransition(ShopkeeperView(),
              routeName: Routes.shopkeeperView,
              transitionStyle: Transition.rightToLeft);
        } else {
          _navigationService.clearStackAndShow(Routes.homeView);
          _navigationService.replaceWithTransition(HomeView(),
              routeName: Routes.homeView,
              transitionStyle: Transition.rightToLeft);
        }
      } on FirebaseAuthException catch (e) {
        hideProgress(context);
        if (e.code == 'wrong-password') {
          show_snackbar(context, 'The password provided is wrong', Colors.red);
        } else if (e.code == 'user-not-found') {
          show_snackbar(context, 'No user found for that email', Colors.red);
        } else {
          show_snackbar(context, "Try again later", Colors.red);
        }
      }
    }
  }

  void singup() {
    _navigationService.navigateWithTransition(const SignupView(),
        routeName: Routes.signupView, transitionStyle: Transition.rightToLeft);
  }

  Future<void> forgetpassword(BuildContext context) async {
    if (email.text.isEmpty) {
      show_snackbar(context, "Fill Email For Password Reset", Colors.red);
    } else if (!EmailValidator.validate(email.text)) {
      show_snackbar(context, "Enter correct email", Colors.red);
    } else {
      await _firebase.auth.sendPasswordResetEmail(email: email.text);
      show_snackbar(context, "Forget Password Mail has been send",
          const Color(0xFF00CCFF));
    }
  }
}
