import 'package:flutter/material.dart';
import 'package:pets_care_app/features/onBoarding/views/on_boarding_screen.dart';

class PetsCareApp extends StatelessWidget {
  const PetsCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: OnBoardingScreen(),
    );
  }
}
