import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:pets_care_app/features/clinics/doctor/data/models/clinic_response.dart';

class ClincsListItem extends StatelessWidget {
  const ClincsListItem({super.key, required this.clinic});
  final ClinicResponse clinic;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        height: 200.h,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            horizontalSpace(10),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_month_sharp,
                        color: AppColors.white,
                      ),
                      horizontalSpace(10),
                      Text(
                        clinic.day,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.homeContainerText,
                      ),
                    ],
                  ),
                  verticalSpace(10),
                  Row(
                    children: [
                      const Icon(
                        Icons.attach_money_rounded,
                        color: AppColors.white,
                      ),
                      horizontalSpace(10),
                      Text(
                        clinic.price,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.homeContainerText,
                      ),
                    ],
                  ),
                  verticalSpace(10),
                  Row(
                    children: [
                      const Icon(
                        Icons.timelapse_rounded,
                        color: AppColors.white,
                      ),
                      horizontalSpace(10),
                      Text(
                        clinic.time,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.homeContainerText,
                      ),
                    ],
                  ),
                  verticalSpace(10),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: AppColors.white,
                      ),
                      horizontalSpace(10),
                      Text(
                        clinic.address,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.homeContainerText,
                      ),
                    ],
                  ),
                  verticalSpace(10),
                  Row(
                    children: [
                      const Icon(
                        Icons.date_range_rounded,
                        color: AppColors.white,
                      ),
                      horizontalSpace(10),
                      Text(
                        clinic.appointmentDate,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.homeContainerText,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            horizontalSpace(10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                clinic.photo == "" || clinic.photo.isEmpty
                    ? Image.asset(
                        "assets/png/clinic.jpg",
                        height: 100.h,
                        width: 130.w,
                      )
                    : Image.network(
                        clinic.photo,
                        height: 100.h,
                        width: 130.w,
                      ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                        color: AppColors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {},
                      icon: const Icon(
                        Icons.delete,
                        color: AppColors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            horizontalSpace(10),
          ],
        ),
      ),
    );
  }
}
