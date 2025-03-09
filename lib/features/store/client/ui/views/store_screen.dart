import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/extension.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:pets_care_app/features/store/client/logic/cubit/store_cubit.dart';
import 'package:pets_care_app/features/store/client/ui/views/widgets/store_screen_body.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<StoreCubit, StoreState>(
      listener: (context, state) {
        if (state is Success) {
          context.pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          title: Text(
            "Shop",
            style: AppTextStyles.shopTitle,
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
              onPressed: () {
                Navigator.pushNamed(context, Routes.cartScreen);
              },
              icon: Icon(
                Icons.shopping_bag_rounded,
                size: 24.sp,
                color: AppColors.primaryColor,
              ),
            )
          ],
        ),
        body: const StoreScreenBody(),
      ),
    );
  }
}
