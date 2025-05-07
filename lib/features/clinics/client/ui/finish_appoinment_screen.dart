import 'package:flutter/material.dart';
import 'package:pets_care_app/core/widgets/custom_app_bar.dart';
import 'package:pets_care_app/features/add_pets/data/models/pet_response.dart';
import 'package:pets_care_app/features/clinics/client/data/models/get_all_clinics_response.dart';
import 'package:pets_care_app/features/clinics/client/ui/widgets/finish_appoinment_body.dart';

class FinishAppoinmentScreen extends StatelessWidget {
  const FinishAppoinmentScreen(
      {super.key, required this.pet, required this.clinic});
  final PetResponse pet;
  final ClinicResponseData clinic;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: FinishAppoinmentBody(
        clinic: clinic,
        pet: pet,
      ),
    );
  }
}
