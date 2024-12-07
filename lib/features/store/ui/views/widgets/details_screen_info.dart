import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';

class DetailsScreenInfo extends StatelessWidget {
  const DetailsScreenInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      margin: EdgeInsets.symmetric(vertical: 5.h),
      shadowColor: Colors.grey,
      elevation: 8,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Josi Dog Master Mix - 900g",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: AppTextStyles.detaisInfo,
            ),
            Row(
              children: [
                Text(
                  "Brand: Josera",
                  style: AppTextStyles.brandText,
                ),
                const Spacer(),
                Text(
                  "Rs 1500.00",
                  style: AppTextStyles.storePrice.copyWith(fontSize: 14.sp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
