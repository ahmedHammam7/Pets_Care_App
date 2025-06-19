import 'package:flutter/material.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:shimmer/shimmer.dart';

class ActivityLoadingWidget extends StatelessWidget {
  const ActivityLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.white,
          highlightColor: AppColors.storeSizeItemColor,
          child: Text(
            "Current Temperature: ",
            style: AppTextStyles.addedPetstext,
          ),
        ),
        Shimmer.fromColors(
          baseColor: Colors.white,
          highlightColor: AppColors.storeSizeItemColor,
          child: Text(
            "Current Activity: ",
            style: AppTextStyles.addedPetstext,
          ),
        ),
      ],
    );
  }
}
