import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/extension.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:pets_care_app/features/auth/widgets/primary_button.dart';
import 'package:pets_care_app/features/clinics/client/ui/widgets/choase_appointment_widget.dart';
import 'package:pets_care_app/features/clinics/client/ui/widgets/doctor_details_info.dart';

class DoctorDetailsBody extends StatelessWidget {
  const DoctorDetailsBody({super.key});

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
              IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 24.sp,
                  )),
              Image(
                image: const AssetImage("assets/png/doctor2 1.png"),
                height: 300.h,
              ),
              const DoctorDetailsInfo(),
              verticalSpace(10),
              Text(
                "Dr. Shehan, one of the most skilled and experienced veterinarians and the owner of the most convenient animal clinic “Petz & Vetz” Our paradise is situated in the heart of the town with a pleasant environment. We are ready to treat your beloved doggos & puppers with love and involvement.Book the appointment now !",
                style: AppTextStyles.storeItemDesc,
              ),
              verticalSpace(30),
              PrimaryButton(
                text: "Book an Appointment",
                onTap: () {
                  showBottomSheet(
                      context: context,
                      elevation: 8,
                      builder: (context) {
                        return Container(
                          height: 400.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.gray,
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          child: const ChoaseAppointmentWidget(),
                        );
                      });
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
