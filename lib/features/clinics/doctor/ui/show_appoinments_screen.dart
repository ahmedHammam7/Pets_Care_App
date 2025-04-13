import 'package:flutter/material.dart';
import 'package:pets_care_app/core/widgets/custom_app_bar.dart';
import 'package:pets_care_app/features/clinics/doctor/ui/widgets/show_appointments_body.dart';

class ShowAppoinmentsScreen extends StatelessWidget {
  const ShowAppoinmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: const ShowAppointmentsBody(),
    );
  }
}
