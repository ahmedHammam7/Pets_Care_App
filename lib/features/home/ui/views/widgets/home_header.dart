import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:pets_care_app/features/home/ui/views/widgets/home_header_loading.dart';
import 'package:pets_care_app/features/profile/logic/cubit/profile_cubit.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) =>
          current is Success || current is Error || current is Loading,
      builder: (context, state) {
        if (state is Success) {
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
                child: Text(
                  state.data.user.name,
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
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_none_rounded,
                ),
              )
            ],
          );
        } else if (state is Error) {
          return const Text("Error");
        } else if (state is Loading) {
          return const HomeHeaderLoading();
        }
        return const SizedBox.shrink();
      },
    );
  }
}
