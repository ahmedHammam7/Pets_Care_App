import 'package:flutter/material.dart';
import 'package:pets_care_app/features/auth/widgets/register_doctor_body.dart';

class RegisterDoctorScreen extends StatelessWidget {
  const RegisterDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RegisterDoctorBody(),
    );
  }
}
