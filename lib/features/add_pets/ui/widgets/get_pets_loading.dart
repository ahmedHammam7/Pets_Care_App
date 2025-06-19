import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:shimmer/shimmer.dart';

class GetPetsLoading extends StatelessWidget {
  const GetPetsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: AppColors.storeSizeItemColor,
      child: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: const AddedPetsLoading(),
          ),
          childCount: 10,
        ),
      ),
    );
  }
}

class AddedPetsLoading extends StatelessWidget {
  const AddedPetsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: AppColors.storeSizeItemColor,
      child: Card(
        color: AppColors.primaryColor,
        margin: EdgeInsets.zero,
        shadowColor: Colors.grey,
        elevation: 8,
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.10,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/png/testDog.png",
                      height: 61.h,
                    ),
                    const Spacer(),
                    Text(
                      "  pet.petName",
                      style: AppTextStyles.addedPetstext
                          .copyWith(color: AppColors.white),
                    ),
                    const Spacer(),
                    const SizedBox.shrink(),
                    const Spacer(),
                    const SizedBox.shrink(),
                    const Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
