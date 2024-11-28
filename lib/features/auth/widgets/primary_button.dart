import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key,
      required this.text,
      this.onTap,
      this.textstyle,
      this.color,
      this.width,
      this.height,
      this.radius});
  final String text;
  final void Function()? onTap;
  final TextStyle? textstyle;
  final Color? color;
  final double? width;
  final double? height;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: height ?? 55.h,
          width: width ?? double.infinity,
          decoration: BoxDecoration(
            color: color ?? AppColors.primaryColor,
            borderRadius: BorderRadius.circular(radius ?? 24.r),
          ),
          child: Text(
            text,
            style: textstyle ?? AppTextStyles.primaryButtonText,
            textAlign: TextAlign.center,
          ),
        ));
  }
}
