import 'package:flutter/material.dart';
import 'package:pets_care_app/core/widgets/custom_app_bar.dart';
import 'package:pets_care_app/features/clinics/client/data/models/get_all_clinics_response.dart';
import 'package:pets_care_app/features/clinics/client/ui/widgets/book_appoinment_body.dart';

class BookAppoinmentScreen extends StatelessWidget {
  const BookAppoinmentScreen({super.key, required this.clinic});
  final ClinicResponseData clinic;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: BookAppoinmentBody(
        clinic: clinic,
      ),
    );
  }
}
