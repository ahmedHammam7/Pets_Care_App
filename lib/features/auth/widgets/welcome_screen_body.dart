import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:pets_care_app/features/auth/widgets/primary_button.dart';
import 'package:pets_care_app/features/auth/widgets/social_circle.dart';

class WelcomeScreenBody extends StatelessWidget {
  const WelcomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 20.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/png/welcome.png",
                height: 300.h,
              ),
              Text(
                "Hello, Welcome !",
                style: AppTextStyles.welcomeText,
              ),
              verticalSpace(60),
              PrimaryButton(text: "Login", onTap: () {}),
              verticalSpace(20),
              PrimaryButton(text: "Sign Up", onTap: () {}),
              verticalSpace(25),
              Text("or sign in with social media",
                  style: AppTextStyles.signWithText),
              verticalSpace(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  SocialCircle(
                    image: "assets/png/facebook.png",
                    onTap: () {},
                  ),
                  const Spacer(),
                  SocialCircle(
                    image: "assets/png/google.png",
                    onTap: () {},
                  ),
                  const Spacer(),
                  SocialCircle(
                    image: "assets/png/linkedin.png",
                    onTap: () {},
                  ),
                  const Spacer(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
