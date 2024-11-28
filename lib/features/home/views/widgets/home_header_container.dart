import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:pets_care_app/features/auth/widgets/primary_button.dart';

class HomeHeaderContainer extends StatelessWidget {
  const HomeHeaderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.94,
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(16.r),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(20),
              SizedBox(
                width: 100.w,
                child: Text(
                  "Get our TA Smart Collar",
                  style: AppTextStyles.homeContainerText,
                ),
              ),
              verticalSpace(10),
              PrimaryButton(
                color: AppColors.white,
                width: 90.w,
                height: 35.h,
                radius: 12.r,
                textstyle: AppTextStyles.homeContainerText
                    .copyWith(color: AppColors.primaryColor),
                text: "Buy Now",
                onTap: () {},
              ),
              verticalSpace(40),
            ],
          ),
        ),
        Positioned(
          right: -12.w,
          top: 3.h,
          child: Image.asset(
            "assets/png/collar.png",
            height: 200.h,
          ),
        ),
      ],
    );
  }
}
