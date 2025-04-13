import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:pets_care_app/core/widgets/custom_app_bar.dart';

class AppoinmentDetailsScreen extends StatelessWidget {
  const AppoinmentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              children: [
                Image.asset(
                  "assets/png/testDog.png",
                  height: 100.h,
                ),
                verticalSpace(10),
                Text("Pet Details", style: AppTextStyles.primaryButtonText),
                verticalSpace(10),
                twoWidgets("Pet Name: ", Icons.pets),
                verticalSpace(10),
                twoWidgets("Pet Type: ", Icons.pets),
                verticalSpace(10),
                twoWidgets("gender: ", Icons.pets),
                verticalSpace(10),
                twoWidgets("age: ", Icons.pets),
                verticalSpace(10),
                twoWidgets("height: ", Icons.height),
                verticalSpace(10),
                twoWidgets("weight: ", Icons.monitor_weight_sharp),
                verticalSpace(10),
                Text("User Details", style: AppTextStyles.primaryButtonText),
                verticalSpace(10),
                twoWidgets("User Name: ", Icons.man),
                verticalSpace(10),
                twoWidgets("User Email: ", Icons.email),
                verticalSpace(10),
                twoWidgets("User Phone: ", Icons.phone),
                verticalSpace(10),
                Image.asset(
                  "assets/png/vet 1.png",
                  height: 100.h,
                ),
                verticalSpace(10),
                Text("Clinic Details", style: AppTextStyles.primaryButtonText),
                verticalSpace(10),
                twoWidgets("Appointment Date: ", Icons.date_range),
                verticalSpace(10),
                twoWidgets("day: ", Icons.calendar_month),
                verticalSpace(10),
                twoWidgets("time: ", Icons.access_time_rounded),
                verticalSpace(10),
                twoWidgets("price: ", Icons.price_change),
                verticalSpace(10),
                twoWidgets("location: ", Icons.location_on),
                verticalSpace(10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget twoWidgets(String text, IconData icon) {
  return Row(
    children: [
      Icon(
        icon,
        color: AppColors.white,
      ),
      horizontalSpace(10),
      Text(
        text,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyles.homeContainerText,
      ),
    ],
  );
}
