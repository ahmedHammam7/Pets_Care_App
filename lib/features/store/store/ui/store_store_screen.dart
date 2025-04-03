import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/extension.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/features/auth/widgets/primary_button.dart';
import 'package:pets_care_app/features/store/store/logic/cubit/store_store_cubit.dart';

class StoreStoreScreen extends StatelessWidget {
  const StoreStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<StoreStoreCubit, StoreStoreState>(
        listenWhen: (previous, current) => current is Logout,
        listener: (context, state) async {
          if (state is Logout) {
            context.pushNamedAndRemoveUntil(
                Routes.loginScreen, (route) => false,
                predicate: (Route<dynamic> route) => false);
          }
        },
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/png/store.png", height: 150.h),
                verticalSpace(30),
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
                  onTap: () async {
                    await context.read<StoreStoreCubit>().logout();
                  },
                  color: AppColors.red,
                )
              ],
            ),
          ),
        ));
  }
}
