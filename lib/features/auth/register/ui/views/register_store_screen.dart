import 'package:flutter/material.dart';
import 'package:pets_care_app/features/auth/widgets/register_store_body.dart';

class RegisterStoreScreen extends StatelessWidget {
  const RegisterStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RegisterStoreBody(),
    );
  }
}
