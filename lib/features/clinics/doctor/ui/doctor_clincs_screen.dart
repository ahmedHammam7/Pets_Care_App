import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/extension.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/features/auth/widgets/primary_button.dart';
import 'package:pets_care_app/features/clinics/doctor/logic/cubit/doctor_clinic_cubit.dart';

class DoctorClincsScreen extends StatelessWidget {
  const DoctorClincsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<DoctorClinicCubit, DoctorClinicState>(
        listenWhen: (previous, current) => current is DoctorlogoutSuccess,
        listener: (context, state) {
          if (state is DoctorlogoutSuccess) {
            context.pushNamedAndRemoveUntil(
                Routes.loginScreen, (route) => false,
                predicate: (Route<dynamic> route) => false);
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              children: [
                Image.asset(
                  "assets/png/doctor.png",
                  height: 150.h,
                ),
                verticalSpace(30),
                PrimaryButton(
                  text: "Add Clinic",
                  onTap: () async {
                    await context.pushNamed(Routes.doctorAddClinicScreen);
                  },
                ),
                verticalSpace(20),
                PrimaryButton(
                  text: "Show Clinics",
                  onTap: () async {
                    await context.pushNamed(Routes.doctorShowClinicsScreen);
                  },
                ),
                verticalSpace(20),
                PrimaryButton(
                  text: "Show Appointments",
                  onTap: () async {
                    await context
                        .pushNamed(Routes.doctorShowAppointmentsScreen);
                  },
                ),
                verticalSpace(20),
                PrimaryButton(
                  text: "Update Info",
                  onTap: () async {
                    await context.pushNamed(Routes.doctorUpdateInfoScreen);
                  },
                ),
                verticalSpace(20),
                PrimaryButton(
                  text: "Logout",
                  onTap: () async {
                    await context.read<DoctorClinicCubit>().logout();
                  },
                  color: AppColors.red,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
