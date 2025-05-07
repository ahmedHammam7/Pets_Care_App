import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:pets_care_app/features/clinics/client/data/models/get_all_clinics_response.dart';

class DoctorDetailsInfo extends StatelessWidget {
  const DoctorDetailsInfo({super.key, required this.data});
  final ClinicResponseData data;
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
                data.doctorName ?? "",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: AppTextStyles.detaisInfo,
              ),
              Text(
                data.address ?? "",
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
                    data.timeRange ?? "",
                    style: AppTextStyles.experience,
                  ),
                ],
              ),
              verticalSpace(10),
              Text(
                "${data.price ?? ""} L.E for an Appointment",
                style: AppTextStyles.storePrice,
              )
            ],
          ),
        ),
      ),
    );
  }
}
