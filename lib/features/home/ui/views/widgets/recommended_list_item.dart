import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:pets_care_app/features/store/client/data/models/recomended_food_response.dart';

class RecommendedListItem extends StatelessWidget {
  const RecommendedListItem({super.key, required this.item});
  final RecomendedFoodItems item;
  @override
  Widget build(BuildContext context) {
    return Stack(
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
              item.image == null || item.image == ""
                  ? Image.asset(
                      "assets/png/food.png",
                      height: 100.h,
                    )
                  : Image.network(
                      item.image!,
                      height: 100.h,
                    ),
              SizedBox(
                width: 70.w,
                child: Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.homeContainerText,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                width: 70.w,
                child: Text(
                  item.price + r"$",
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
    );
  }
}
