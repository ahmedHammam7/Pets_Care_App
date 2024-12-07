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
  static TextStyle loginToContinue = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.darkGray.withOpacity(0.8),
  );
  static TextStyle textFieldLabel = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );
  static TextStyle richText = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.darkGray.withOpacity(0.8),
  );
  static TextStyle homeContainerText = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );
  static TextStyle featuresText = TextStyle(
    fontSize: 17.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.darkGray,
  );
  static TextStyle recommendedText = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );
  static TextStyle shopTitle = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor,
  );
  static TextStyle shopIconText = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.storeIconText,
  );
  static TextStyle storePrice = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.green,
  );
  static TextStyle storeNameItem = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor,
  );
  static TextStyle storeSizeItem = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.storeSizeItemColor,
  );
  static TextStyle storeRecommendedText = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor,
  );
  static TextStyle detaisInfo = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );
  static TextStyle brandText = TextStyle(
    fontSize: 17.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.brandColor,
  );
  static TextStyle storeItemDesc = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryColor,
  );
  static TextStyle quantityWidgetText = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.storeSizeItemColor,
  );
  static TextStyle addToCartButton = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );
}
