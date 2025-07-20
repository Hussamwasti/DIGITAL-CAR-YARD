// ignore_for_file: depend_on_referenced_packages

import 'dart:html' as html;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;

import '../../../app/app.locator.dart';
import '../../../services/fire_service.dart';

class FirebaseHelper {
  static Future<String> uploadFile(html.File? file, String phone) async {
    final fireService = locator<FireService>();

    String filename = path.basename(file!.name);
    String extension = path.extension(file.name);
    String randomChars = DateTime.now().millisecondsSinceEpoch.toString();
    String uniqueFilename = '$filename-$randomChars$extension';

    UploadTask uploadTask = fireService.storage
        .child('user')
        .child(phone)
        .child(uniqueFilename)
        .putBlob(file);

    await uploadTask;

    String downloadURL = await fireService.storage
        .child('user')
        .child(phone)
        .child(uniqueFilename)
        .getDownloadURL();

    return downloadURL;
  }
}
