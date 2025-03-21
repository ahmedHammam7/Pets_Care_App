import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:shimmer/shimmer.dart';

class ProductsLoading extends StatelessWidget {
  const ProductsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Shimmer.fromColors(
          baseColor: Colors.white,
          highlightColor: AppColors.storeSizeItemColor,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
            height: 80.h,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              children: [
                Image.asset(
                  "assets/png/food.png",
                  height: 100.h,
                ),
                horizontalSpace(10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 70.w,
                      child: Text(
                        "Dry Food",
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.homeContainerText,
                      ),
                    ),
                    Text(
                      "\$50",
                      style: AppTextStyles.homeContainerText,
                    ),
                  ],
                ),
                horizontalSpace(20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Food Type",
                      style: AppTextStyles.homeContainerText,
                    ),
                    Text(
                      "Dog Food",
                      style: AppTextStyles.homeContainerText,
                    ),
                  ],
                ),
                horizontalSpace(20),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit,
                    color: AppColors.white,
                  ),
                ),
                horizontalSpace(5),
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete,
                      color: AppColors.red,
                    ),
                  ),
                ),
                horizontalSpace(10),
              ],
            ),
          ),
        ),
      ),
      itemCount: 10,
    );
  }
}
