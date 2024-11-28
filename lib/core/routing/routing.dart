import 'package:flutter/material.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/features/auth/login/login_screen.dart';
import 'package:pets_care_app/features/auth/register/register_screen.dart';
import 'package:pets_care_app/features/home/views/home_screen.dart';
import 'package:pets_care_app/features/onBoarding/views/on_boarding_screen.dart';
import 'package:pets_care_app/features/profile/views/profile_screen.dart';

class AppRoutes {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case Routes.profileScreen:
        return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        );

      default:
        return null;
    }
  }
}
