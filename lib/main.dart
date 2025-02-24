import 'package:flutter/material.dart';
import 'package:pets_care_app/di/dependency_injection.dart';
import 'package:pets_care_app/pets_care_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetit();
  runApp(const PetsCareApp());
}
