import 'package:flutter/material.dart';
import 'package:pets_care_app/features/clinics/doctor/data/models/clinic_response.dart';
import 'package:pets_care_app/features/clinics/doctor/ui/widgets/clincs_list_item.dart';

class ShowClincsBody extends StatelessWidget {
  const ShowClincsBody({super.key, required this.clincs});
  final List<ClinicResponse> clincs;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.9,
        child: ListView.builder(
          itemBuilder: (context, index) => ClincsListItem(
            clinic: clincs[index],
          ),
          itemCount: clincs.length,
        ),
      ),
    );
  }
}
