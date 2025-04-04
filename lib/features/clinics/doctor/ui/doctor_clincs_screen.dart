import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/extension.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/features/auth/widgets/primary_button.dart';

class DoctorClincsScreen extends StatelessWidget {
  const DoctorClincsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                onTap: () {},
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
                onTap: () async {},
                color: AppColors.red,
              )
            ],
          ),
        ),
      ),
    );
  }
}
