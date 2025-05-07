import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/extension.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:pets_care_app/features/auth/widgets/primary_button.dart';
import 'package:pets_care_app/features/clinics/client/data/models/get_all_clinics_response.dart';
import 'package:pets_care_app/features/clinics/client/ui/widgets/doctor_details_info.dart';

class DoctorDetailsBody extends StatelessWidget {
  const DoctorDetailsBody({super.key, required this.data});
  final ClinicResponseData data;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              data.photo == "" || data.photo == null
                  ? Image(
                      image: const AssetImage("assets/png/doctor2 1.png"),
                      height: 300.h,
                    )
                  : Image.network(data.photo!, height: 300.h),
              DoctorDetailsInfo(
                data: data,
              ),
              verticalSpace(30),
              PrimaryButton(
                text: "Book an Appointment",
                onTap: () async {
                  await context.pushNamed(Routes.bookAppointmentScreen,
                      arguments: data);
                },
                textstyle: AppTextStyles.addToCartButton,
                radius: 8.r,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
