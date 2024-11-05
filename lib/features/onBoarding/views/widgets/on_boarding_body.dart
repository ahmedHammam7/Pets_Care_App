import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/constants.dart';
import 'package:pets_care_app/core/helper/extension.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:pets_care_app/features/onBoarding/views/widgets/next_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

PageController controller = PageController();

class _OnBoardingBodyState extends State<OnBoardingBody> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: 3,
      controller: controller,
      itemBuilder: (context, index) => SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          context.pushNamedAndRemoveUntil(Routes.loginScreen,
                              predicate: (Route<dynamic> route) => false);
                        },
                        child: Text(
                          "Skip",
                          style: AppTextStyles.skipButton,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40.h),
                    child: Image.asset(
                      Constants.images[index],
                      height: MediaQuery.of(context).size.height * 0.5,
                    ),
                  ),
                  verticalSpace(24),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Text(
                      Constants.title[index],
                      textAlign: TextAlign.center,
                      style: AppTextStyles.onBoardingTitle,
                    ),
                  ),
                  verticalSpace(16),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      Constants.desc[index],
                      textAlign: TextAlign.center,
                      style: AppTextStyles.onBoardingDescription,
                    ),
                  ),
                  verticalSpace(20),
                  Row(
                    children: [
                      SmoothPageIndicator(
                        controller: controller,
                        count: 3,
                        effect: WormEffect(
                          dotHeight: 10.h,
                          dotWidth: 10.w,
                          activeDotColor: AppColors.primaryColor,
                        ),
                      ),
                      const Spacer(),
                      NextButton(
                        onTap: () {
                          if (index == 2) {
                            context.pushNamedAndRemoveUntil(Routes.loginScreen,
                                predicate: (Route<dynamic> route) => false);
                          }
                          controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
