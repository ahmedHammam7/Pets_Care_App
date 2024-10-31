import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/themes/colors.dart';

abstract class AppTextStyles {
  static TextStyle skipButton = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryColor);

  static TextStyle onBoardingTitle = TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.bold,
      height: 1.2,
      color: AppColors.primaryColor);

  static TextStyle onBoardingDescription = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.primaryColor.withOpacity(0.9));

  static TextStyle welcomeText = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );
  static TextStyle primaryButtonText = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );
  static TextStyle signWithText = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.darkGray,
  );
}
