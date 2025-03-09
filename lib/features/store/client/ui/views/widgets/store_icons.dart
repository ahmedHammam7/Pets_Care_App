import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';

class StoreIcons extends StatelessWidget {
  const StoreIcons(
      {super.key, required this.image, required this.text, this.onTap});
  final String image;
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Card(
            elevation: 4,
            color: AppColors.textFieldColor,
            margin: EdgeInsets.zero,
            shadowColor: Colors.grey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Image.asset(image, height: 32.h, width: 32.w),
            ),
          ),
        ),
        verticalSpace(5),
        Text(
          text,
          style: AppTextStyles.shopIconText,
        ),
      ],
    );
  }
}
