// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../app_colors.dart' as Colors;
import '../customwidget/snakbar_helper.dart';

const url = 'http://localhost:3000/';
const registrationlink = "${url}register";
const loginlink = "${url}login";
const findonelink = "${url}findone";
const alluserslink = "${url}allusers";
const deleteuserslink = "${url}deleteusers";

// car
const registercarlink = "${url}registercar";
const allcarlink = "${url}allcar";
const statuschangelink = "${url}statuschange";
const deletecarlink = "${url}deletecar";
const findonecarlink = "${url}findonecar";

// products
const registerproductlink = "${url}registerproduct";
const allproductlink = "${url}allproduct";
const statuschangeproductlink = "${url}statuschangeproduct";
const deleteproductlink = "${url}deleteproduct";
const findoneproductlink = "${url}findoneproduct";

// cart
const registercartlink = "${url}registercart";
const allcartlink = "${url}allcart";
const changecartproductlink = "${url}changecartproduct";
const deletecartlink = "${url}deletecart";
const checkoutlink = "${url}checkout";

// remainder
const registerremainderlink = "${url}registerremainder";
const allremainderlink = "${url}allremainder";
const updateremdatelink = "${url}updateremdate";

// chat
const registerchatlink = "${url}registerchat";
const allchatbyidlink = "${url}allchatbyid";
const addchatlink = "${url}addchat";
const allchatbydidlink = "${url}allchatbydid";

class ApiHelper {
  static Future<bool> registration(String name, String number, String email,
      String pass, String img, String type, BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(registrationlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "name": name,
            "number": number,
            "email": email,
            "img": img,
            "pass": pass,
            "type": type,
          }));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      show_snackbar(context, data['message']);
      return data['status'] as bool;
    } catch (e) {
      print(e);
      show_snackbar(context, 'try again later', Colors.red);
      return false;
    }
  }

  static Future<Map> login(
      String email, String pass, String deviceid, BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(loginlink),
          headers: {"Content-Type": "application/json"},
          body:
              jsonEncode({"email": email, "pass": pass, "deviceid": deviceid}));
      var data = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      hideProgress(context);
      if (data['status']) {
        return data['token'];
      } else {
        show_snackbar(context, data['message']);
        return {};
      }
    } catch (e) {
      show_snackbar(context, 'try again later', Colors.red);
      return {};
    }
  }

  static Future<Map> findOne(String number) async {
    try {
      var response = await http.post(Uri.parse(findonelink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"email": number}));
      var data = jsonDecode(utf8.decode(response.bodyBytes))['data'] as Map;
      return data;
    } catch (e) {
      return {};
    }
  }

  // static Future<List> allUsers() async {
  //   try {
  //     var response = await http.post(Uri.parse(alluserslink),
  //         headers: {"Content-Type": "application/json"});

  //     var data = jsonDecode(utf8.decode(response.bodyBytes))['data'];
  //     print(data  );
  //     return data;
  //   } catch (e) {
  //     return [];
  //   }
  // }

  static Future<List> allUsers() async {
    try {
      var response = await http.post(
        Uri.parse(alluserslink),
        headers: {"Content-Type": "application/json"},
      );

      var data = jsonDecode(utf8.decode(response.bodyBytes))['data'];
      print("Total users: ${data.length}");
      return data;
    } catch (e) {
      print("Error: $e");
      return [];
    }
  }

  static Future<bool> deleteUser(String id) async {
    try {
      var response = await http.post(Uri.parse(deleteuserslink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"id": id}));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['status'];
    } catch (e) {
      return false;
    }
  }

  // event
  static Future<bool> registerCar(
      String title,
      String des,
      List img,
      String price,
      String km,
      String city,
      String year,
      String brand,
      String register,
      String color,
      String engine,
      String enginecapacity,
      String transmission,
      String assembly,
      String uid,
      BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(registercarlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "title": title,
            "des": des,
            "img": img,
            "price": price,
            "milage": km,
            "city": city,
            "year": year,
            "brand": brand,
            "register": register,
            "color": color,
            "engine": engine,
            "enginecapacity": enginecapacity,
            "transmission": transmission,
            "assembly": assembly,
            "status": "false",
            "uid": uid
          }));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      show_snackbar(context, data['message']);
      return data['status'] as bool;
    } catch (e) {
      show_snackbar(context, 'try again later', Colors.red);
      return false;
    }
  }

  static Future<List> allCar() async {
    try {
      var response = await http.post(Uri.parse(allcarlink),
          headers: {"Content-Type": "application/json"});
      var data = jsonDecode(utf8.decode(response.bodyBytes))['data'];
      print("Total cars: ${data.length}");
      return data;
    } catch (e) {
      return [];
    }
  }

  static Future<bool> statusChange(String id, String status) async {
    try {
      var response = await http.post(Uri.parse(statuschangelink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"id": id, "status": status}));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['status'];
    } catch (e) {
      return false;
    }
  }

  static Future<bool> deleteCar(String id) async {
    try {
      var response = await http.post(Uri.parse(deletecarlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"id": id}));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['status'];
    } catch (e) {
      return false;
    }
  }

  static Future<Map> findonecar(String id) async {
    try {
      var response = await http.post(Uri.parse(findonecarlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"id": id}));
      var data = jsonDecode(utf8.decode(response.bodyBytes))['data'] as Map;
      return data;
    } catch (e) {
      return {};
    }
  }

  // product
  static Future<bool> registerProduct(String title, String des, List img,
      String price, String uid, BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(registerproductlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "title": title,
            "des": des,
            "img": img,
            "price": price,
            "status": "false",
            "uid": uid
          }));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      show_snackbar(context, data['message']);
      return data['status'] as bool;
    } catch (e) {
      show_snackbar(context, 'try again later', Colors.red);
      return false;
    }
  }

  static Future<List> allProducts() async {
    try {
      var response = await http.post(Uri.parse(allproductlink),
          headers: {"Content-Type": "application/json"});
      var data = jsonDecode(utf8.decode(response.bodyBytes))['data'];
      print("Total products: ${data.length}");
      return data;
    } catch (e) {
      print("Error fetching products: $e");
      return [];
    }
  }

  static Future<bool> statusChangeProduct(String id, String status) async {
    try {
      var response = await http.post(Uri.parse(statuschangeproductlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"id": id, "status": status}));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['status'];
    } catch (e) {
      return false;
    }
  }

  static Future<bool> deleteProduct(String id) async {
    try {
      var response = await http.post(Uri.parse(deleteproductlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"id": id}));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['status'];
    } catch (e) {
      return false;
    }
  }

  static Future<Map> findoneproduct(String id) async {
    try {
      var response = await http.post(Uri.parse(findoneproductlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"id": id}));
      var data = jsonDecode(utf8.decode(response.bodyBytes))['data'] as Map;
      return data;
    } catch (e) {
      return {};
    }
  }

  // cart
  static Future<bool> registercart(String uid, String pid, String quantity,
      String type, BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(registercartlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "uid": uid,
            "pid": pid,
            "quantity": quantity,
            "type": type,
            "isbook": "false",
          }));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      show_snackbar(context, data['message']);
      return data['status'] as bool;
    } catch (e) {
      show_snackbar(context, 'try again later', Colors.red);
      return false;
    }
  }

  static Future<List> allcart() async {
    try {
      var response = await http.post(Uri.parse(allcartlink),
          headers: {"Content-Type": "application/json"});
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['data'];
    } catch (e) {
      return [];
    }
  }

  static Future<bool> changecartproduct(String id, String quantity) async {
    try {
      var response = await http.post(Uri.parse(changecartproductlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"id": id, "quantity": quantity}));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['status'];
    } catch (e) {
      return false;
    }
  }

  static Future<bool> deletecart(String id) async {
    try {
      var response = await http.post(Uri.parse(deletecartlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"id": id}));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['status'];
    } catch (e) {
      return false;
    }
  }

  static Future<bool> checkout(String uid) async {
    try {
      var response = await http.post(Uri.parse(checkoutlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"uid": uid}));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['status'];
    } catch (e) {
      return false;
    }
  }

  // remainder
  static Future<bool> registerRemainder(String title, String des, String date,
      String uid, String freq, BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(registerremainderlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "title": title,
            "des": des,
            "date": date,
            "uid": uid,
            "freq": freq,
          }));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      show_snackbar(context, data['message']);
      return data['status'] as bool;
    } catch (e) {
      show_snackbar(context, 'try again later', Colors.red);
      return false;
    }
  }

  static Future<List> allRemainder(String uid) async {
    try {
      var response = await http.post(Uri.parse(allremainderlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "uid": uid,
          }));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['data'];
    } catch (e) {
      return [];
    }
  }

  static Future<bool> updateRemDate(String id, date) async {
    try {
      var response = await http.post(Uri.parse(updateremdatelink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"id": id, "date": date}));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['status'];
    } catch (e) {
      return false;
    }
  }

  // chat
  static Future<Map> registerChat(String uid, String did) async {
    try {
      var response = await http.post(Uri.parse(registerchatlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "uid": uid,
            "did": did,
            "c": [],
            "date": DateTime.now().toString(),
          }));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data;
    } catch (e) {
      return {};
    }
  }

  static Future<Map> allChatByid(String id) async {
    try {
      var response = await http.post(Uri.parse(allchatbyidlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"id": id}));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['data'];
    } catch (e) {
      return {};
    }
  }

  static Future<List> allChatBydid(String did) async {
    try {
      var response = await http.post(Uri.parse(allchatbydidlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"did": did}));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['data'];
    } catch (e) {
      return [];
    }
  }

  static Future<bool> addChat(String id, Map dataa, String sendto) async {
    try {
      var response = await http.post(Uri.parse(addchatlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"id": id, "data": dataa}));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      // Map d = await findone(sendto);
      // await FirebaseHelper.sendPushMessage(
      //     d['deviceid'], "New Message", dataa['mess']);
      return data['status'] as bool;
    } catch (e) {
      return false;
    }
  }
}
