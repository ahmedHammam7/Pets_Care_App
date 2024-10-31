import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/themes/colors.dart';

class SocialCircle extends StatelessWidget {
  const SocialCircle({super.key, this.onTap, required this.image});
  final void Function()? onTap;
  final String image;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: AppColors.white,
        radius: 24.r,
        backgroundImage: AssetImage(image),
      ),
    );
  }
}
