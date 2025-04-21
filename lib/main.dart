import 'package:flutter/material.dart';
import 'package:pets_care_app/core/helper/constants.dart';
import 'package:pets_care_app/core/helper/shared_prefs/shared_prefs.dart';
import 'package:pets_care_app/core/helper/shared_prefs/shared_prefs_constant.dart';
import 'package:pets_care_app/core/di/dependency_injection.dart';
import 'package:pets_care_app/pets_care_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetit();
  await checkLoggedIn();
  runApp(const PetsCareApp());
}

Future<void> checkLoggedIn() async {
  String token =
      await SharedPrefHelper.getSecuredData(SharedPrefsConstant.token);
  String type = await SharedPrefHelper.getString(SharedPrefsConstant.type);

  if (token.isNotEmpty && token != "" && type.isNotEmpty && type != "") {
    if (type == "store") {
      isLoggedIn = true;
      isStore = true;
    } else if (type == "doctor") {
      isLoggedIn = true;
      isDoctor = true;
    } else if (type == "owner") {
      isLoggedIn = true;

      isClient = true;
    }
  } else {
    isLoggedIn = false;
  }
}
