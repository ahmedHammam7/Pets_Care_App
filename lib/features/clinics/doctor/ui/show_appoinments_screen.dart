import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_care_app/core/widgets/custom_app_bar.dart';
import 'package:pets_care_app/features/clinics/doctor/logic/cubit/doctor_clinic_cubit.dart';
import 'package:pets_care_app/features/clinics/doctor/ui/widgets/clinics_loading.dart';
import 'package:pets_care_app/features/clinics/doctor/ui/widgets/show_appointments_body.dart';

class ShowAppoinmentsScreen extends StatelessWidget {
  const ShowAppoinmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: BlocBuilder<DoctorClinicCubit, DoctorClinicState>(
        buildWhen: (previous, current) =>
            current is getDoctorAppointmentsSucess ||
            current is getDoctorAppointmentsLoading ||
            current is getDoctorAppointmentsError,
        builder: (context, state) {
          if (state is getDoctorAppointmentsLoading) {
            return const ClinicsLoadingWidget();
          } else if (state is getDoctorAppointmentsSucess) {
            return ShowAppointmentsBody(
              appointments: state.data,
            );
          }

          if (state is getDoctorAppointmentsError) {
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
