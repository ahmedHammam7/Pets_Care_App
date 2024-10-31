import 'package:flutter/material.dart';
import 'package:pets_care_app/features/auth/widgets/welcome_screen_body.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WelcomeScreenBody(),
    );
  }
}
