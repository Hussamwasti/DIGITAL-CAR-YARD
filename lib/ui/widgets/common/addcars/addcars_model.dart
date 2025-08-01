import 'dart:html' as html;

import 'package:digitalcaryard/ui/common/apihelper/apihelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/app.locator.dart';
import '../../../../services/shareprefs_service.dart';
import '../../../common/apihelper/firebsaeuploadhelper.dart';
import '../../../common/app_colors.dart' as Colors;
import '../../../common/customwidget/snakbar_helper.dart';

class AddcarsModel extends BaseViewModel {
  final sharedpref = locator<ShareprefsService>();

  TextEditingController title = TextEditingController();
  TextEditingController des = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController km = TextEditingController();

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
    } else if (images!.isEmpty) {
      show_snackbar(context, "Select Image", Colors.red);
    } else if (km.text.isEmpty) {
      show_snackbar(context, "Enter Mileage", Colors.red);
    } else if (price.text.isEmpty) {
      show_snackbar(context, "Enter Price", Colors.red);
    } else if (des.text.isEmpty) {
      show_snackbar(context, "Enter Description", Colors.red);
    } else {
      displayProgress(context);
      List<String> uploadedUrls = await Future.wait(
        images!.map((image) => FirebaseHelper.uploadFile(image, "")).toList(),
      );
      await ApiHelper.registerCar(
          title.text,
          des.text,
          uploadedUrls,
          price.text,
          km.text,
          acity,
          ayear,
          abrand,
          aregistered,
          acolor,
          aenginetype,
          aenginecapacity,
          atransmission,
          aassemble,
          sharedpref.readString("email"),
          context);
      hideProgress(context);
      Navigator.pop(context);
    }
  }

  String acity = "Lahore";
  String ayear = "2024";
  String abrand = "BMW";
  String aregistered = "Registered";
  String acolor = "Black";
  String aenginetype = "Petrol";
  String aenginecapacity = "1000cc";
  String atransmission = "Automatic";
  String aassemble = "New";

  List<String> city = ["Lahore", "Karachi", "Multan", "Islamabad"];
  List<String> years = [
    "2024",
    "2023",
    "2022",
    "2021",
    "2020",
    "2019",
    "2018",
    "2017",
    "2016",
    "2015",
    "2014",
    "2013",
    "2012",
    "2011",
    "2010",
    "2009",
    "2008",
    "2007",
    "2006",
    "2005",
    "2004",
    "2003",
    "2002",
    "2001",
    "2000"
  ];
  List<String> brand = [
    "BMW",
    "Honda",
    "Toyota",
    "Nissan",
    "Mercedes",
    "Ferrari",
    "Audi",
    "Benz",
    "Lamborghini",
  ];
  List<String> registered = ["Registered", "Unregistered"];
  List<String> color = ["Black", "White", "Red", "Blue"];
  List<String> enginetype = ["Petrol", "Diesel", "CNG"];
  List<String> enginecapacity = ["1000cc", "1500cc", "2000cc"];
  List<String> transmission = ["Automatic", "Manual"];
  List<String> assemble = ["New", "Used", "Imported"];
}
