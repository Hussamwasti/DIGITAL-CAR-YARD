import 'dart:html' as html;

import 'package:digitalcaryard/ui/views/auth/login/login_view.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../services/fire_service.dart';
import '../../../common/apihelper/apihelper.dart';
import '../../../common/apihelper/firebsaeuploadhelper.dart';
import '../../../common/app_colors.dart';
import '../../../common/customwidget/button_helper.dart';
import '../../../common/customwidget/snakbar_helper.dart';
import '../../../common/customwidget/text_helper.dart';
import '../../../common/ui_helpers.dart';

class SignupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _firebase = locator<FireService>();

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController conpass = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();

  html.File? image;
  String? imageUrl;
  Future<void> pickImage() async {
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.accept = 'image/*';
    uploadInput.click();
    uploadInput.onChange.listen((event) async {
      final files = uploadInput.files;
      if (files != null && files.isNotEmpty) {
        image = files[0];
        final reader = html.FileReader();
        reader.readAsDataUrl(image!);
        reader.onLoadEnd.listen((event) {
          imageUrl = reader.result as String;
          notifyListeners();
        });
      }
    });
  }

  String type = "";

  Future<void> signup(BuildContext context) async {
    if (name.text.isEmpty) {
      show_snackbar(context, "Enter your name", Colors.red);
    } else if (number.text.isEmpty) {
      show_snackbar(context, "Enter your number", Colors.red);
    } else if (email.text.isEmpty) {
      show_snackbar(context, "Email is required", Colors.red);
    } else if (pass.text.isEmpty) {
      show_snackbar(context, "Password cannot be empty", Colors.red);
    } else if (conpass.text.isEmpty) {
      show_snackbar(context, "Enter password again", Colors.red);
    } else if (pass.text != conpass.text) {
      show_snackbar(context, "Password do not match", Colors.red);
    } else if (!EmailValidator.validate(email.text)) {
      show_snackbar(context, "Enter correct email", Colors.red);
    } else if (image == null) {
      show_snackbar(context, "Select Image", Colors.red);
    } else if (number.text.length != 11) {
      show_snackbar(context, "Enter correct number", Colors.red);
    } else if (type == '') {
      show_snackbar(context, "Choose your role", Colors.red);
    } else {
      try {
        displayProgress(context);

        // 👉 Create user in Firebase
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: email.text.trim(), password: pass.text.trim());

        // 👉 Send verification email
        await userCredential.user!.sendEmailVerification();

        // 👉 Upload profile image
        String url = await FirebaseHelper.uploadFile(image, number.text);

        // 👉 Register in your custom backend
        bool c = await ApiHelper.registration(
            name.text, number.text, email.text, pass.text, url, type, context);

        hideProgress(context);

        if (c) {
          clearData();
          showCustomDialog(context); // Message: "Verify your email and login"
        }
      } on FirebaseAuthException catch (e) {
        hideProgress(context);
        if (e.code == 'weak-password') {
          show_snackbar(
              context, 'The password provided is too weak', Colors.red);
        } else if (e.code == 'email-already-in-use') {
          show_snackbar(context, 'The account already exists for that email.',
              Colors.red);
        } else {
          show_snackbar(context, "Try again later", Colors.red);
        }
      }
    }
  }

  void clearData() {
    name.clear();
    number.clear();
    email.clear();
    pass.clear();
    conpass.clear();
  }

  void showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: appbarBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: customBlueColor,
              width: 1.2,
            ),
          ),
          title: text_helper(
            color: customBlueColor,
            data: "Registration Successful!",
            fontWeight: FontWeight.bold,
            size: getResponsiveMediumLargeFontSize(context),
          ),
          content: text_helper(data: "Verify your email and login"),
          actions: [
            button_helper(
                onPress: () => login(), child: text_helper(data: "Done"))
          ],
        );
      },
    );
  }

  void login() {
    _navigationService.clearStackAndShow(Routes.loginView);
    _navigationService.replaceWithTransition(const LoginView(),
        routeName: Routes.loginView, transitionStyle: Transition.rightToLeft);
  }
}
