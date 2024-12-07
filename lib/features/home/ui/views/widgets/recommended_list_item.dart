import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';

class RecommendedListItem extends StatelessWidget {
  const RecommendedListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 114.w,
            height: 178.h,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(16.r),
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/png/food.png",
                  height: 100.h,
                ),
                SizedBox(
                  width: 70.w,
                  child: Text(
                    "Dry Food",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.homeContainerText,
                  ),
                ),
                SizedBox(
                  width: 70.w,
                  child: Text(
                    "20.99" r"$",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.homeContainerText,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0.w,
            left: 0.w,
            bottom: -12.h,
            child: GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                backgroundColor: AppColors.gray.withOpacity(.9),
                child: const Icon(
                  Icons.add,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
