import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:pets_care_app/core/helper/extension.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:pets_care_app/features/auth/register/logic/cubit/register_cubit.dart';
import 'package:pets_care_app/features/auth/widgets/app_password_field.dart';
import 'package:pets_care_app/features/auth/widgets/app_text_field.dart';
import 'package:pets_care_app/features/auth/widgets/primary_button.dart';
import 'package:pets_care_app/features/auth/widgets/rich_text.dart';
import 'package:pets_care_app/features/auth/widgets/text_button.dart';

class RegisterScreenBody extends StatefulWidget {
  const RegisterScreenBody({super.key});

  @override
  State<RegisterScreenBody> createState() => _RegisterScreenBodyState();
}

bool obscureText = false;

bool isloading = false;

class _RegisterScreenBodyState extends State<RegisterScreenBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listenWhen: (previous, current) =>
          current is Success || current is Error || current is Loading,
      listener: (context, state) {
        if (state is Loading) {
          isloading = true;
        }
        if (state is Success) {
          isloading = false;
          Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.loginScreen,
            (route) => false,
          );
        }
        if (state is Error) {
          isloading = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
          child: SafeArea(
            child: Form(
              key: context.read<RegisterCubit>().formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Create Account Now!",
                    style: AppTextStyles.welcomeText.copyWith(fontSize: 30.sp),
                  ),
                  verticalSpace(60),
                  AppTextField(
                    labelText: "Name",
                    controller: context.read<RegisterCubit>().nameController,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  verticalSpace(30),
                  AppTextField(
                    labelText: "Email",
                    controller: context.read<RegisterCubit>().emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  verticalSpace(30),
                  AppPasswordField(
                    obscureText: obscureText,
                    controller:
                        context.read<RegisterCubit>().passwordController,
                    iconPressed: () {
                      setState(
                        () {
                          obscureText = !obscureText;
                        },
                      );
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  verticalSpace(30),
                  AppTextField(
                    labelText: "Phone",
                    controller: context.read<RegisterCubit>().phoneController,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone';
                      }
                      return null;
                    },
                  ),
                  verticalSpace(20),
                  Row(
                    children: [
                      PrimaryTextButton(
                        text: "Doctor",
                        onPressed: () {
                          context.pushNamedAndRemoveUntil(
                              Routes.registerDoctorScreen, (route) => false,
                              predicate: (Route<dynamic> route) => false);
                        },
                      ),
                      const Spacer(),
                      PrimaryTextButton(
                        text: "Store",
                        onPressed: () {
                          context.pushNamedAndRemoveUntil(
                              Routes.registerStoreScreen, (route) => false,
                              predicate: (Route<dynamic> route) => false);
                        },
                      ),
                    ],
                  ),
                  verticalSpace(40),
                  isloading == true
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        )
                      : PrimaryButton(
                          text: "Sign Up",
                          onTap: () async {
                            if (context
                                .read<RegisterCubit>()
                                .formKey
                                .currentState!
                                .validate()) {
                              await context.read<RegisterCubit>().register();
                            }
                          },
                        ),
                  verticalSpace(30),
                  AppRichText(
                    text1: "Already have an account?",
                    text2: " Login",
                    onTap: () {
                      context.pushNamedAndRemoveUntil(
                          Routes.loginScreen, (route) => false,
                          predicate: (Route<dynamic> route) => false);
                    },
                  ),
                  verticalSpace(20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
