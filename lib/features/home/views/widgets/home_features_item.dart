import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';

class HomeFeaturesItem extends StatelessWidget {
  const HomeFeaturesItem({
    super.key,
    required this.image,
    this.backgroundColor,
    required this.text,
    this.textColor,
  });
  final String image;
  final String text;

  final Color? backgroundColor;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: backgroundColor,
          radius: 42.r,
          child: CircleAvatar(
            radius: 38.r,
            backgroundColor: AppColors.white,
            child: Image.asset(image, height: 50.h, width: 50.w),
          ),
        ),
        verticalSpace(5),
        Text(
          text,
          style: AppTextStyles.featuresText.copyWith(color: textColor),
        ),
      ],
    );
  }
}
