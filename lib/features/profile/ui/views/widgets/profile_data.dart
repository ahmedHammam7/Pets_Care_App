import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';

class ProfileData extends StatelessWidget {
  const ProfileData({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Text(
        text,
        style: AppTextStyles.primaryButtonText.copyWith(fontSize: 16.sp),
        textAlign: TextAlign.center,
      ),
    );
  }
}
