import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/extension.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/core/themes/colors.dart';

import 'package:pets_care_app/features/add_pets/ui/widgets/add_pets_body.dart';

class AddPetsScreen extends StatelessWidget {
  const AddPetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () async {
            await context.pushNamed(Routes.homeLayout);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 24.sp,
          ),
        ),
      ),
      body: const AddPetsBody(),
    );
  }
}
