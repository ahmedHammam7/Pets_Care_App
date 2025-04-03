import 'package:flutter/material.dart';
import 'package:pets_care_app/core/widgets/custom_app_bar.dart';
import 'package:pets_care_app/features/clinics/doctor/ui/widgets/show_clincs_body.dart';

class ShowClincsScreen extends StatelessWidget {
  const ShowClincsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: const SingleChildScrollView(
        child: ShowClincsBody(),
      ),
    );
  }
}
