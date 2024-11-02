import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/extension.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
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

class _LoginScreenBodyState extends State<LoginScreenBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Form(
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
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    return null;
                  },
                ),
                verticalSpace(20),
                AppPasswordField(
                  validator: (value) {
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
                PrimaryButton(text: "Login", onTap: () {}),
                verticalSpace(20),
                AppRichText(
                  text1: 'Don’t have an account? ',
                  text2: 'Sign Up',
                  onTap: () {
                    context.pushNamedAndRemoveUntil(Routes.registerScreen,
                        predicate: (Route<dynamic> route) => false);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
