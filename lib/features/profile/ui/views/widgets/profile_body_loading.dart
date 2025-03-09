import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/extension.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/features/auth/widgets/primary_button.dart';
import 'package:pets_care_app/features/profile/logic/cubit/profile_cubit.dart';
import 'package:pets_care_app/features/profile/ui/views/widgets/profile_data.dart';
import 'package:shimmer/shimmer.dart';

class ProfileBodyLoading extends StatelessWidget {
  const ProfileBodyLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.white,
                highlightColor: AppColors.storeSizeItemColor,
                child: CircleAvatar(
                  radius: 100.r,
                  backgroundColor: AppColors.primaryColor,
                  child: CircleAvatar(
                    radius: 96.r,
                    backgroundColor: AppColors.white,
                    backgroundImage: const AssetImage("assets/png/profile.png"),
                  ),
                ),
              ),
              Shimmer.fromColors(
                  baseColor: Colors.white,
                  highlightColor: AppColors.storeSizeItemColor,
                  child: Column(children: [
                    verticalSpace(40),
                    const ProfileData(text: " widget.model.user.name"),
                    verticalSpace(20),
                    const ProfileData(text: " widget.model.user.name"),
                    verticalSpace(20),
                    const ProfileData(text: " widget.model.user.name"),
                    verticalSpace(60),
                    PrimaryButton(
                      text: "Logout",
                      onTap: ()async {
                                            await context.read<ProfileCubit>().logout().then((v) {
                      context.pushNamedAndRemoveUntil(Routes.loginScreen,
                          predicate: (Route<dynamic> route) => false);
                    });
                      },
                      color: AppColors.red,
                      radius: 14.r,
                      height: 50.h,
                    ),
                  ])),
            ],
          ),
        ),
      ),
    );
  }
}
