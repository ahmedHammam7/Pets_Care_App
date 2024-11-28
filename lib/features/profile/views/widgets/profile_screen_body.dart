import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/themes/colors.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 100.r,
                    backgroundColor: AppColors.primaryColor,
                    child: CircleAvatar(
                      radius: 96.r,
                      backgroundColor: AppColors.white,
                      backgroundImage:
                          const AssetImage("assets/png/profile.png"),
                    ),
                  ),
                  Positioned(
                    bottom: 6,
                    right: 19,
                    child: CircleAvatar(
                      backgroundColor: AppColors.primaryColor,
                      radius: 18.r,
                      child: CircleAvatar(
                        radius: 16.r,
                        backgroundColor: AppColors.white,
                        child: InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.edit_outlined,
                            color: AppColors.primaryColor,
                            size: 25.sp,
                          ),
                        ),
                      ),
                    ),
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
