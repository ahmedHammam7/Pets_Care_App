import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/themes/colors.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: AppColors.primaryColor,
        radius: 32.r,
        child: Icon(Icons.arrow_forward_sharp,
            color: AppColors.white, size: 30.sp),
      ),
    );
  }
}
