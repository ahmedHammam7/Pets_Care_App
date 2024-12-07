import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';

class RecomendedText extends StatelessWidget {
  const RecomendedText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Text(
        "Recommended $text",
        style: AppTextStyles.recommendedText,
      ),
    );
  }
}
