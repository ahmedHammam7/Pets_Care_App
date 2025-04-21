import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pets_care_app/core/helper/extension.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/widgets/app_text_field.dart';
import 'package:pets_care_app/features/auth/widgets/primary_button.dart';
import 'package:pets_care_app/features/profile/data/models/profile_response.dart';
import 'package:pets_care_app/features/profile/logic/cubit/profile_cubit.dart';

class ProfileScreenBody extends StatefulWidget {
  const ProfileScreenBody({super.key, required this.model});
  final ProfileResponse model;
  @override
  State<ProfileScreenBody> createState() => _ProfileScreenBodyState();
}

File? image;

class _ProfileScreenBodyState extends State<ProfileScreenBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Form(
              key: context.read<ProfileCubit>().formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 100.r,
                        backgroundColor: AppColors.primaryColor,
                        child: CircleAvatar(
                          radius: 96.r,
                          backgroundColor: AppColors.white,
                          backgroundImage: image == null
                              ? const AssetImage("assets/png/profile.png")
                              : FileImage(image!),
                        ),
                      ),
                      Positioned(
                        bottom: 6,
                        right: 19,
                        child: CircleAvatar(
                          backgroundColor: AppColors.primaryColor,
                          radius: 18.r,
                          child: CircleAvatar(
                            radius: 16.r,
                            backgroundColor: AppColors.white,
                            child: InkWell(
                              onTap: () {
                                pickImage();
                              },
                              child: Icon(
                                Icons.edit_outlined,
                                color: AppColors.primaryColor,
                                size: 25.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(40),
                  AppTextField.outsideHint(
                    hint: "Name",
                    controller: context.read<ProfileCubit>().nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter name";
                      }
                      return null;
                    },
                  ),
                  verticalSpace(20),
                  AppTextField.outsideHint(
                    hint: "Email",
                    controller: context.read<ProfileCubit>().emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter email";
                      }
                      return null;
                    },
                  ),
                  verticalSpace(20),
                  AppTextField.outsideHint(
                    hint: "Phone",
                    controller: context.read<ProfileCubit>().phoneController,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter phone";
                      }
                      return null;
                    },
                  ),
                  verticalSpace(60),
                  PrimaryButton(
                      text: "Update",
                      onTap: () async {
                        if (context
                            .read<ProfileCubit>()
                            .formKey
                            .currentState!
                            .validate()) {
                          await context.read<ProfileCubit>().updateProfile();
                        }
                      }),
                  verticalSpace(20),
                  PrimaryButton(
                    text: "Logout",
                    onTap: () async {
                      await context.read<ProfileCubit>().logout().then((v) {
                        context.pushNamedAndRemoveUntil(
                            Routes.loginScreen, (route) => false,
                            predicate: (Route<dynamic> route) => false);
                      });
                    },
                    color: AppColors.red,
                    radius: 14.r,
                    height: 50.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    context.read<ProfileCubit>().nameController.text = widget.model.user.name;
    context.read<ProfileCubit>().emailController.text = widget.model.user.email;
    context.read<ProfileCubit>().phoneController.text = widget.model.user.phone;
    super.initState();
  }

  void pickImage() {
    ImagePicker().pickImage(source: ImageSource.gallery).then((value) {
      image = File(value!.path);
    }).then(
      (value) {
        setState(() {});
      },
    );
  }
}
