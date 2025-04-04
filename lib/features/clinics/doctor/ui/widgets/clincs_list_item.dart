import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';

class ClincsListItem extends StatelessWidget {
  const ClincsListItem({super.key});

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
                  Text(
                    "Monday - Friday",
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.homeContainerText,
                  ),
                  Text(
                    "\$ 300",
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.homeContainerText,
                  ),
                  Text(
                    "7:00 AM - 8:00 PM",
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.homeContainerText,
                  ),
                  Text(
                    "Maadi",
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.homeContainerText,
                  ),
                ],
              ),
            ),
            horizontalSpace(10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/png/clinic.jpg",
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
