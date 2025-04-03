import 'package:flutter/material.dart';
import 'package:pets_care_app/features/clinics/doctor/ui/widgets/clincs_list_item.dart';

class ShowClincsBody extends StatelessWidget {
  const ShowClincsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.9,
        child: ListView.builder(
          itemBuilder: (context, index) => const ClincsListItem(),
          itemCount: 10,
        ),
      ),
    );
  }
}
