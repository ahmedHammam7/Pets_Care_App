import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/extension.dart';
import 'package:pets_care_app/core/helper/shared_prefs/shared_prefs.dart';
import 'package:pets_care_app/core/helper/shared_prefs/shared_prefs_constant.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:pets_care_app/features/profile/logic/cubit/profile_cubit.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 24.r,
          backgroundColor: AppColors.primaryColor,
          child: CircleAvatar(
            radius: 22.r,
            backgroundColor: AppColors.white,
            backgroundImage: const AssetImage("assets/png/profile.png"),
          ),
        ),
        horizontalSpace(7),
        SizedBox(
          width: 130.w,
          child: Text(
            "Ahmed Hammam",
            style: AppTextStyles.textFieldLabel,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        horizontalSpace(7),
        Image.asset(
          "assets/png/hand.png",
          height: 25.h,
        ),
        const Spacer(),
        IconButton(
          onPressed: ()async {
                                await context.read<ProfileCubit>().logout().then((v) {
                      context.pushNamedAndRemoveUntil(Routes.loginScreen,
                          predicate: (Route<dynamic> route) => false);
                    });
          },
          icon: const Icon(
            Icons.notifications_none_rounded,
          ),
        )
      ],
    );
  }
}
