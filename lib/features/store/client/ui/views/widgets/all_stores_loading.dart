import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:shimmer/shimmer.dart';

class AllStoresLoadingWidget extends StatelessWidget {
  const AllStoresLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: AppColors.storeSizeItemColor,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 7.h),
            child: const AllStoresListLoadingItem(),
          ),
        ),
      ),
    );
  }
}

class AllStoresListLoadingItem extends StatelessWidget {
  const AllStoresListLoadingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 100.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(16.r),
          ),
        ),
        child: Row(
          children: [
            horizontalSpace(5),
            const Icon(
              Icons.store,
              color: AppColors.white,
            ),
            horizontalSpace(5),
            Text(
              "Store Name",
              style:
                  AppTextStyles.textFieldLabel.copyWith(color: AppColors.white),
            ),
            horizontalSpace(10),
            const Icon(
              Icons.location_on,
              color: AppColors.white,
            ),
            horizontalSpace(5),
            Text(
              "Address",
              style:
                  AppTextStyles.textFieldLabel.copyWith(color: AppColors.white),
            ),
            horizontalSpace(10),
            const Icon(
              Icons.phone_android,
              color: AppColors.white,
            ),
            horizontalSpace(5),
            Text(
              "hotline",
              style:
                  AppTextStyles.textFieldLabel.copyWith(color: AppColors.white),
            )
          ],
        ),
      ),
    );
  }
}
