import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_care_app/core/widgets/custom_app_bar.dart';
import 'package:pets_care_app/features/clinics/doctor/logic/cubit/doctor_clinic_cubit.dart';
import 'package:pets_care_app/features/clinics/doctor/ui/widgets/doctor_profile_body.dart';
import 'package:pets_care_app/features/profile/ui/views/widgets/profile_body_loading.dart';

class DoctorUpdateInfoScreen extends StatelessWidget {
  const DoctorUpdateInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: BlocBuilder<DoctorClinicCubit, DoctorClinicState>(
        buildWhen: (previous, current) =>
            current is loadDoctorProfileError ||
            current is loadDoctorProfileSuccess ||
            current is loadDoctorProfileLoading,
        builder: (context, state) {
          if (state is loadDoctorProfileSuccess) {
            return const DoctorProfileBody();
          } else if (state is loadDoctorProfileLoading) {
            return const ProfileBodyLoading();
          }

          if (state is loadDoctorProfileError) {
            return Center(
              child: Text(state.message),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
