import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';

class PetsReminderContainer extends StatelessWidget {
  const PetsReminderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.94,
          height: MediaQuery.of(context).size.height * 0.13,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(16.r),
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 170.w,
                child: Text(
                  "Your Ziko will get Vacciniation tomorrow at 7.00 pm!",
                  style: AppTextStyles.homeContainerText,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: -12.w,
          top: 3.h,
          child: Image.asset(
            "assets/png/cat.png",
            height: 120.h,
          ),
        ),
      ],
    );
  }
}
