import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';

class AddedPetsWidget extends StatelessWidget {
  const AddedPetsWidget({super.key});

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
          child: Row(
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
              const Icon(
                Icons.more_horiz_sharp,
              ),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
