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
        title: Text(
          "My Pets",
          style: TextStyle(
            fontSize: 20.sp,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: const AddPetsBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(Routes.addPetsForm);
        },
        backgroundColor: AppColors.primaryColor,
        child: Icon(
          Icons.add,
          size: 30.sp,
          color: AppColors.white,
        ),
      ),
    );
  }
}
