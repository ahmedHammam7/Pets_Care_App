import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';

class ClinicsItem extends StatelessWidget {
  const ClinicsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, Routes.doctorDetailsScreen);
        },
        child: Card(
          color: AppColors.white,
          margin: EdgeInsets.zero,
          shadowColor: Colors.grey,
          elevation: 8,
          child: SizedBox(
            height: 131.h,
            width: 274.w,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/png/vet 1.png",
                        height: 50.h,
                      ),
                      horizontalSpace(10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 150.w,
                            child: Text(
                              "Dr. Tama3a ",
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.clinicsTitle
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            width: 170.w,
                            child: Text(
                              "Bachelor of veterinary science",
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.storeSizeItem,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  verticalSpace(10),
                  Row(
                    children: [
                      Text(
                        "10 years of experience",
                        style: AppTextStyles.experience,
                      ),
                      const Spacer(),
                      Icon(
                        Icons.location_on,
                        color: AppColors.storeSizeItemColor,
                        size: 15.sp,
                      ),
                      Text("2.5 km", style: AppTextStyles.experience),
                      const Spacer(),
                      Icon(
                        Icons.monetization_on_rounded,
                        color: AppColors.storeSizeItemColor,
                        size: 15.sp,
                      ),
                      Text("100" "\$", style: AppTextStyles.experience),
                      const Spacer(),
                    ],
                  ),
                  verticalSpace(10),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time_rounded,
                        color: AppColors.storeSizeItemColor,
                        size: 15.sp,
                      ),
                      horizontalSpace(5),
                      Text(
                        "Monday - Friday at 8.00 am - 5.00pm",
                        style: AppTextStyles.experience,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
