import 'dart:html' as html;

import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/app.locator.dart';
import '../../../../services/shareprefs_service.dart';
import '../../../common/apihelper/apihelper.dart';
import '../../../common/apihelper/firebsaeuploadhelper.dart';
import '../../../common/app_colors.dart' as Colors;
import '../../../common/customwidget/snakbar_helper.dart';

class AddproductModel extends BaseViewModel {
  final sharedpref = locator<ShareprefsService>();

  TextEditingController title = TextEditingController();
  TextEditingController des = TextEditingController();
  TextEditingController price = TextEditingController();

  List<html.File>? images = [];
  List<String>? imageUrls = [];

  Future<void> pickImages() async {
    // Create a file upload input element with multiple file selection enabled
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.accept = 'image/*';
    uploadInput.multiple = true; // Allow multiple file selection
    uploadInput.click();

    uploadInput.onChange.listen((event) async {
      final files = uploadInput.files;
      if (files != null && files.isNotEmpty) {
        images = files;
        imageUrls = [];

        for (var file in files) {
          final reader = html.FileReader();
          reader.readAsDataUrl(file);
          await reader.onLoadEnd.first; // Wait for the file to finish loading
          imageUrls!.add(reader.result as String);
        }

        notifyListeners(); // Notify listeners to update the UI
      }
    });
  }

  Future<void> adddetails(BuildContext context) async {
    if (title.text.isEmpty) {
      show_snackbar(context, "Enter Title", Colors.red);
    } else if (price.text.isEmpty) {
      show_snackbar(context, "Enter Price", Colors.red);
    } else if (des.text.isEmpty) {
      show_snackbar(context, "Enter Description", Colors.red);
    } else if (images!.isEmpty) {
      show_snackbar(context, "select Image", Colors.red);
    } else {
      displayProgress(context);
      List<String> uploadedUrls = await Future.wait(
        images!.map((image) => FirebaseHelper.uploadFile(image, "")).toList(),
      );
      await ApiHelper.registerProduct(title.text, des.text, uploadedUrls,
          price.text, sharedpref.readString("email"), context);
      hideProgress(context);
      Navigator.pop(context);
    }
  }
}
