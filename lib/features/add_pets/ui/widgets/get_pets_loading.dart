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
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.5,
        child: ListView.builder(
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: const AddedPetsLoading(),
          ),
          itemCount: 10,
        ),
      ),
    );
  }
}

class AddedPetsLoading extends StatelessWidget {
  const AddedPetsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.addedPets,
      margin: EdgeInsets.zero,
      shadowColor: Colors.grey,
      elevation: 8,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/png/testDog.png",
                    height: 61.h,
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                  Text(
                    "Tam3a",
                    style: AppTextStyles.addedPetstext,
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                  Text(
                    "Male",
                    style: AppTextStyles.addedPetstext,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                ],
              ),
              verticalSpace(10),
              Text(
                "More Details :",
                style: AppTextStyles.addedPetstext
                    .copyWith(fontWeight: FontWeight.w700, fontSize: 22.sp),
              ),
              verticalSpace(10),
              Row(
                children: [
                  const Icon(Icons.color_lens_outlined),
                  horizontalSpace(5),
                  Text(
                    "white",
                    style: AppTextStyles.addedPetstext,
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                  const Icon(Icons.height),
                  horizontalSpace(5),
                  Text(
                    "50.2",
                    style: AppTextStyles.addedPetstext,
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                  const Icon(Icons.monitor_weight_outlined),
                  horizontalSpace(5),
                  Text(
                    "20.2",
                    style: AppTextStyles.addedPetstext,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                ],
              ),
              verticalSpace(10),
              Row(
                children: [
                  const Icon(Icons.cake_outlined),
                  horizontalSpace(5),
                  Text(
                    "2" " years",
                    style: AppTextStyles.addedPetstext,
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                  const Icon(Icons.medical_services_outlined),
                  horizontalSpace(5),
                  Text(
                    "2025-11-25 10:00:00",
                    style: AppTextStyles.addedPetstext,
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
