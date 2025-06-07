import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:pets_care_app/features/auth/widgets/primary_button.dart';
import 'package:pets_care_app/features/check/logic/cubit/check_cubit.dart';

class CheckScreenBody extends StatefulWidget {
  const CheckScreenBody({super.key});

  @override
  State<CheckScreenBody> createState() => _CheckScreenBodyState();
}

class _CheckScreenBodyState extends State<CheckScreenBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: BlocBuilder<CheckCubit, CheckState>(
                  buildWhen: (previous, current) =>
                      current is Success ||
                      current is Error ||
                      current is Loading,
                  builder: (context, state) {
                    if (state is Loading) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ),
                          ],
                        ),
                      );
                    }
                    if (state is Error) {
                      WidgetsBinding.instance.addPostFrameCallback(
                        (_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.message),
                              backgroundColor: Colors.red,
                            ),
                          );
                        },
                      );
                    }
                    if (state is Success) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Add Image of spotted  diseases area of your pet",
                            textAlign: TextAlign.center,
                            style: AppTextStyles.primaryButtonText
                                .copyWith(color: AppColors.primaryColor),
                          ),
                          verticalSpace(30),
                          Stack(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  await pickImage();
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  height: 210.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: context.read<CheckCubit>().image ==
                                              null
                                          ? const AssetImage(
                                              "assets/png/testDog.png")
                                          : FileImage(
                                              File(context
                                                  .read<CheckCubit>()
                                                  .image!
                                                  .path),
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          verticalSpace(20),
                          Text(
                            "Predicted Disease: ${state.data.predictedDisease}",
                            style: AppTextStyles.primaryButtonText.copyWith(
                                color: AppColors.primaryColor, fontSize: 16.sp),
                          ),
                          verticalSpace(10),
                          Text(
                            "Confidence: ${state.data.confidence.toDouble().toStringAsFixed(2)} from 1",
                            style: AppTextStyles.primaryButtonText.copyWith(
                                color: AppColors.primaryColor, fontSize: 16.sp),
                          ),
                          verticalSpace(10),
                          Text(
                            "Recommendation: ${state.data.recommendation}",
                            style: AppTextStyles.primaryButtonText.copyWith(
                                color: AppColors.primaryColor, fontSize: 16.sp),
                          ),
                          verticalSpace(30),
                          PrimaryButton(
                            text: "Check Disease",
                            onTap: () async {
                              await context.read<CheckCubit>().checkByAi();
                            },
                          ),
                        ],
                      );
                    }
                    return Column(
                      children: [
                        Text(
                          "Add Image of spotted  diseases area of your pet",
                          textAlign: TextAlign.center,
                          style: AppTextStyles.primaryButtonText
                              .copyWith(color: AppColors.primaryColor),
                        ),
                        verticalSpace(30),
                        Stack(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                await pickImage();
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                height: 210.h,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image:
                                        context.read<CheckCubit>().image == null
                                            ? const AssetImage(
                                                "assets/png/testDog.png")
                                            : FileImage(
                                                File(context
                                                    .read<CheckCubit>()
                                                    .image!
                                                    .path),
                                              ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        verticalSpace(20),
                        PrimaryButton(
                          text: "Check Disease",
                          onTap: () async {
                            await context.read<CheckCubit>().checkByAi();
                          },
                        ),
                      ],
                    );
                  })),
        ),
      ),
    );
  }

  Future<File?> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        context.read<CheckCubit>().image = pickedFile;
      });
      return File(pickedFile.path);
    }

    return null;
  }
}
