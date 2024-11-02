import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/extension.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:pets_care_app/features/auth/widgets/app_password_field.dart';
import 'package:pets_care_app/features/auth/widgets/app_text_field.dart';
import 'package:pets_care_app/features/auth/widgets/primary_button.dart';
import 'package:pets_care_app/features/auth/widgets/rich_text.dart';

class RegisterScreenBody extends StatefulWidget {
  const RegisterScreenBody({super.key});

  @override
  State<RegisterScreenBody> createState() => _RegisterScreenBodyState();
}

bool obscureText = false;

class _RegisterScreenBodyState extends State<RegisterScreenBody> {
  String dropDownValue = "Dog";
  String dropDownValue2 = "User";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
        child: SafeArea(
          child: Form(
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
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    return null;
                  },
                ),
                verticalSpace(30),
                AppTextField(
                  labelText: "Email",
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    return null;
                  },
                ),
                verticalSpace(30),
                AppPasswordField(
                  obscureText: obscureText,
                  iconPressed: () {
                    setState(
                      () {
                        obscureText = !obscureText;
                      },
                    );
                  },
                  validator: (value) {
                    return null;
                  },
                ),
                verticalSpace(30),
                AppTextField(
                  labelText: "Phone",
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    return null;
                  },
                ),
                verticalSpace(20),
                Row(
                  children: [
                    const Spacer(),
                    DropdownButton(
                      style: AppTextStyles.textFieldLabel,
                      value: dropDownValue,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.primaryColor,
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: "Dog",
                          child: Text("Dog"),
                        ),
                        DropdownMenuItem(
                          value: "Cat",
                          child: Text("Cat"),
                        ),
                      ],
                      onChanged: (value) {
                        setState(
                          () {
                            dropDownValue = value.toString();
                          },
                        );
                      },
                    ),
                    const Spacer(),
                    DropdownButton(
                      style: AppTextStyles.textFieldLabel,
                      value: dropDownValue2,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.primaryColor,
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: "User",
                          child: Text("User"),
                        ),
                        DropdownMenuItem(
                          value: "Doctor",
                          child: Text("Doctor"),
                        ),
                        DropdownMenuItem(
                          value: "PetsStore",
                          child: Text("PetsStore"),
                        ),
                      ],
                      onChanged: (value) {
                        setState(
                          () {
                            dropDownValue2 = value.toString();
                          },
                        );
                      },
                    ),
                    const Spacer(),
                  ],
                ),
                verticalSpace(40),
                PrimaryButton(
                  text: "Sign Up",
                  onTap: () {},
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
