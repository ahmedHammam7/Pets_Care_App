import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/extension.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:pets_care_app/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:pets_care_app/features/auth/widgets/app_password_field.dart';
import 'package:pets_care_app/features/auth/widgets/app_text_field.dart';
import 'package:pets_care_app/features/auth/widgets/primary_button.dart';
import 'package:pets_care_app/features/auth/widgets/rich_text.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

bool obscureText = false;
bool isloading = false;

class _LoginScreenBodyState extends State<LoginScreenBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      buildWhen: (previous, current) =>
          current is Error || current is Loading || current is Success,
      listener: (context, state) {
        if (state is Loading) {
          isloading = true;
        }
        if (state is Success) {
          isloading = false;
          Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.homeLayout,
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
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Form(
              key: context.read<LoginCubit>().formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/png/welcome.png",
                    height: 300.h,
                  ),
                  Text(
                    "Welcome Back!",
                    style: AppTextStyles.welcomeText.copyWith(fontSize: 30.sp),
                  ),
                  Text(
                    "login to continue",
                    style: AppTextStyles.loginToContinue,
                  ),
                  verticalSpace(50),
                  AppTextField(
                    labelText: "Email",
                    controller: context.read<LoginCubit>().emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter email";
                      }
                      return null;
                    },
                  ),
                  verticalSpace(20),
                  AppPasswordField(
                    controller: context.read<LoginCubit>().passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter password";
                      }
                      return null;
                    },
                    obscureText: obscureText,
                    iconPressed: () {
                      setState(
                        () {
                          obscureText = !obscureText;
                        },
                      );
                    },
                  ),
                  verticalSpace(40),
                  isloading == true
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        )
                      : PrimaryButton(
                          text: "Login",
                          onTap: () async {
                            if (context
                                .read<LoginCubit>()
                                .formKey
                                .currentState!
                                .validate()) {
                              await context.read<LoginCubit>().login();
                            }
                          },
                        ),
                  verticalSpace(20),
                  AppRichText(
                    text1: 'Don’t have an account? ',
                    text2: 'Sign Up',
                    onTap: () {
                      context.pushNamedAndRemoveUntil(Routes.registerScreen,
                          predicate: (Route<dynamic> route) => false);
                    },
                  ),
                  verticalSpace(30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
