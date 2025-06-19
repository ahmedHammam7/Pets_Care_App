import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:shimmer/shimmer.dart';

class LocationLoadingWidget extends StatelessWidget {
  const LocationLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: AppColors.storeSizeItemColor,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () async {
          // Handle button press
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Last Location",
              style: AppTextStyles.addedPetstext
                  .copyWith(color: AppColors.primaryColor),
            ),
            horizontalSpace(5),
            Icon(Icons.location_on, color: AppColors.primaryColor, size: 20.sp),
          ],
        ),
      ),
    );
  }
}
