import 'package:flutter/material.dart';
import 'package:pets_care_app/features/clinics/ui/widgets/doctor_details_body.dart';

class DoctorDetailsScreen extends StatelessWidget {
  const DoctorDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DoctorDetailsBody(),
    );
  }
}
