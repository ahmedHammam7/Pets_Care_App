import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';

class DoctorDetailsInfo extends StatelessWidget {
  const DoctorDetailsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      margin: EdgeInsets.symmetric(vertical: 5.h),
      shadowColor: Colors.grey,
      elevation: 8,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dr. Tama3a",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: AppTextStyles.detaisInfo,
              ),
              Text(
                "Bachelor of Veterinary Science",
                style: AppTextStyles.brandText,
              ),
              verticalSpace(20),
              Row(
                children: [
                  Icon(
                    Icons.access_time_rounded,
                    color: AppColors.primaryColor,
                    size: 15.sp,
                  ),
                  horizontalSpace(5),
                  Text(
                    "Monday - Friday at 8.00 am - 5.00pm",
                    style: AppTextStyles.experience,
                  ),
                  horizontalSpace(30),
                  Icon(
                    Icons.location_on,
                    color: AppColors.primaryColor,
                    size: 15.sp,
                  ),
                  Text("2.5 km", style: AppTextStyles.experience),
                ],
              ),
              verticalSpace(10),
              Text(
                "500 L.E for an Appointment",
                style: AppTextStyles.storePrice,
              )
            ],
          ),
        ),
      ),
    );
  }
}
