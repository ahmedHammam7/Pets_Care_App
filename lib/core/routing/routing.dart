import 'package:flutter/material.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/features/auth/login/ui/views/login_screen.dart';
import 'package:pets_care_app/features/auth/register/ui/views/register_screen.dart';
import 'package:pets_care_app/features/cart/ui/views/cart_screen.dart';
import 'package:pets_care_app/features/clinics/ui/clinics_screen.dart';
import 'package:pets_care_app/features/clinics/ui/doctor_details_screen.dart';
import 'package:pets_care_app/features/home/ui/views/home_screen.dart';
import 'package:pets_care_app/features/onBoarding/ui/views/on_boarding_screen.dart';
import 'package:pets_care_app/features/profile/ui/views/profile_screen.dart';
import 'package:pets_care_app/features/store/ui/views/details_screen.dart';
import 'package:pets_care_app/features/store/ui/views/store_screen.dart';

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
      case Routes.storeScreen:
        return MaterialPageRoute(
          builder: (context) => const StoreScreen(),
        );
      case Routes.detailsScreen:
        return MaterialPageRoute(
          builder: (context) => const DetailsScreen(),
        );
      case Routes.cartScreen:
        return MaterialPageRoute(
          builder: (context) => const CartScreen(),
        );
      case Routes.clinicsScreen:
        return MaterialPageRoute(
          builder: (context) => const ClinicsScreen(),
        );
      case Routes.doctorDetailsScreen:
        return MaterialPageRoute(
          builder: (context) => const DoctorDetailsScreen(),
        );
      default:
        return null;
    }
  }
}
