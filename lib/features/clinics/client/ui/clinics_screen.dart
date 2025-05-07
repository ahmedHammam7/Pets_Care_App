import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/extension.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:pets_care_app/features/clinics/client/ui/widgets/clinics_screen_body.dart';

class ClinicsScreen extends StatelessWidget {
  const ClinicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          "Veterinary clinics",
          style: AppTextStyles.clinicsTitle,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 24.sp,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await context.pushNamed(Routes.appoinmnenstScreen);
            },
            icon: const Icon(
              Icons.edit_calendar_sharp,
            ),
          )
        ],
      ),
      body: const ClinicsScreenBody(),
    );
  }
}
