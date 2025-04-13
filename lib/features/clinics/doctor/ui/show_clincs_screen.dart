import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_care_app/core/widgets/custom_app_bar.dart';
import 'package:pets_care_app/features/clinics/doctor/logic/cubit/doctor_clinic_cubit.dart';
import 'package:pets_care_app/features/clinics/doctor/ui/widgets/clinics_loading.dart';
import 'package:pets_care_app/features/clinics/doctor/ui/widgets/show_clincs_body.dart';

class ShowClincsScreen extends StatelessWidget {
  const ShowClincsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: SingleChildScrollView(
        child: BlocBuilder<DoctorClinicCubit, DoctorClinicState>(
          buildWhen: (previous, current) =>
              current is getDoctorClinicsLoading ||
              current is getDoctorClinicsSucess ||
              current is getDoctorClinicsError,
          builder: (context, state) {
            if (state is getDoctorClinicsLoading) {
              return const ClinicsLoadingWidget();
            } else if (state is getDoctorClinicsSucess) {
              return ShowClincsBody(
                clincs: state.data,
              );
            }

            if (state is getDoctorClinicsError) {
              return Center(
                child: Text(state.message),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
