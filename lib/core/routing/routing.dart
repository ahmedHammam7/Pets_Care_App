import 'package:flutter/material.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/features/auth/welcome_screen.dart';
import 'package:pets_care_app/features/onBoarding/views/on_boarding_screen.dart';

class AppRoutes {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );
      case Routes.welcomeScreen:
        return MaterialPageRoute(
          builder: (context) => const WelcomeScreen(),
        );
      default:
        return null;
    }
  }
}
