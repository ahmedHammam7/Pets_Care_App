import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:pets_care_app/features/add_pets/ui/widgets/added_pets_widget.dart';

class AddPetsBody extends StatelessWidget {
  const AddPetsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Added pets", style: AppTextStyles.recommendedText),
              verticalSpace(20),
              const AddedPetsWidget(),
              verticalSpace(20),
              const AddedPetsWidget(),
              verticalSpace(20),
              Text("Manually Add Pet", style: AppTextStyles.recommendedText),
            ],
          ),
        ),
      ),
    );
  }
}
