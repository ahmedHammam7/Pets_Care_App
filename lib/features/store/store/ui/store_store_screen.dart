import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/extension.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/features/auth/widgets/primary_button.dart';

class StoreStoreScreen extends StatelessWidget {
  const StoreStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text("Store Store"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrimaryButton(
              text: "Add Product",
              onTap: () {
                context.pushNamed(Routes.storeAddProductScreen);
              },
            ),
            verticalSpace(20),
            PrimaryButton(
              text: "Show Products",
              onTap: () {
                context.pushNamed(Routes.storeShowProductsScreen);
              },
            ),
            verticalSpace(20),
            PrimaryButton(
              text: "Update Info",
              onTap: () {
                context.pushNamed(Routes.storeUpdateInfoScreen);
              },
            ),
            verticalSpace(20),
            PrimaryButton(
              text: "Logout",
              onTap: () {},
              color: AppColors.red,
            )
          ],
        ),
      ),
    );
  }
}
