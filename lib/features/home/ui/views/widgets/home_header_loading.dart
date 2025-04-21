import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:shimmer/shimmer.dart';

class HomeHeaderLoading extends StatelessWidget {
  const HomeHeaderLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: AppColors.storeSizeItemColor,
      child: Row(
        children: [
          CircleAvatar(
            radius: 24.r,
            backgroundColor: AppColors.primaryColor,
            child: CircleAvatar(
              radius: 22.r,
              backgroundColor: AppColors.white,
              backgroundImage: const AssetImage("assets/png/profile.png"),
            ),
          ),
          horizontalSpace(7),
          SizedBox(
            width: 130.w,
            child: Text(
              "Ahmed Hammam",
              style: AppTextStyles.textFieldLabel,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          horizontalSpace(7),
          Image.asset(
            "assets/png/hand.png",
            height: 25.h,
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none_rounded,
            ),
          )
        ],
      ),
    );
  }
}
