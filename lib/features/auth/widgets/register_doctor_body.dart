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

class RegisterDoctorBody extends StatefulWidget {
  const RegisterDoctorBody({super.key});

  @override
  State<RegisterDoctorBody> createState() => _RegisterScreenBodyState();
}

bool obscureText = false;
bool isloading = false;

class _RegisterScreenBodyState extends State<RegisterDoctorBody> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen: (previous, current) =>
          current is RegisterLoadingDoctor ||
          current is RegisterSuccessDoctor ||
          current is RegisterErrorDoctor,
      listener: (context, state) {
        if (state is RegisterLoadingDoctor) {
          isloading = true;
        }
        if (state is RegisterSuccessDoctor) {
          isloading = false;
          Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.loginScreen,
            (route) => false,
          );
        }
        if (state is RegisterErrorDoctor) {
          isloading = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      child: SingleChildScrollView(
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
                  verticalSpace(30),
                  AppTextField(
                    labelText: "specialization",
                    controller:
                        context.read<RegisterCubit>().specializationController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your specialization';
                      }
                      return null;
                    },
                  ),
                  verticalSpace(30),
                  AppTextField(
                    labelText: "licenseNumber",
                    controller:
                        context.read<RegisterCubit>().licenseNumberController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your license number';
                      }
                      return null;
                    },
                  ),
                  verticalSpace(30),
                  AppTextField(
                    labelText: "experienceYears",
                    controller:
                        context.read<RegisterCubit>().experienceYearsController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your experience years';
                      }
                      return null;
                    },
                  ),
                  verticalSpace(30),
                  AppTextField(
                    labelText: "workingTime",
                    controller:
                        context.read<RegisterCubit>().workingTimeController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your working time';
                      }
                      return null;
                    },
                  ),
                  verticalSpace(30),
                  AppTextField(
                    labelText: "address",
                    controller: context.read<RegisterCubit>().addressController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your address';
                      }
                      return null;
                    },
                  ),
                  verticalSpace(30),
                  AppTextField(
                    labelText: "price",
                    controller: context.read<RegisterCubit>().priceController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your price';
                      }
                      return null;
                    },
                  ),
                  verticalSpace(30),
                  AppTextField(
                    labelText: "medicalSyndicateCode",
                    controller: context
                        .read<RegisterCubit>()
                        .medicalSyndicateCodeController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your medical syndicate code';
                      }
                      return null;
                    },
                  ),
                  verticalSpace(20),
                  Row(
                    children: [
                      PrimaryTextButton(
                        text: "User",
                        onPressed: () {
                          context.pushNamedAndRemoveUntil(Routes.registerScreen,
                              predicate: (Route<dynamic> route) => false);
                        },
                      ),
                      const Spacer(),
                      PrimaryTextButton(
                        text: "Store",
                        onPressed: () {
                          context.pushNamedAndRemoveUntil(
                              Routes.registerStoreScreen,
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
                              await context
                                  .read<RegisterCubit>()
                                  .registerDoctor();
                            }
                          },
                        ),
                  verticalSpace(30),
                  AppRichText(
                    text1: "Already have an account?",
                    text2: " Login",
                    onTap: () {
                      context.pushNamedAndRemoveUntil(Routes.loginScreen,
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
