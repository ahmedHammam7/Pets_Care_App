import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/extension.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:pets_care_app/features/auth/widgets/primary_button.dart';
import 'package:pets_care_app/features/store/client/ui/views/widgets/details_screen_info.dart';
import 'package:pets_care_app/features/store/client/ui/views/widgets/quantity_widget.dart';

class DetailsScreenBody extends StatelessWidget {
  const DetailsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 24.sp,
                  )),
              Image(
                image: const AssetImage("assets/png/food_test.png"),
                height: 373.h,
              ),
              const DetailsScreenInfo(),
              verticalSpace(10),
              Text(
                "Brighten up your pet's bowl with the colourful corn and beetroot kibble in JosiDog MasterMix! Crunchy and flavourful variety for adult dogs of all sizes, plus a wide range of important nutrients included. No added soya, sugar or milk products. Free from artificial colourings, flavourings and preservatives. Contains animal protein, vitamins & minerals.",
                style: AppTextStyles.storeItemDesc,
              ),
              const QuantityWidget(),
              PrimaryButton(
                text: "Add to Cart",
                onTap: () {
                  context.pushNamed(Routes.cartScreen);
                },
                textstyle: AppTextStyles.addToCartButton,
                radius: 8,
              ),
              verticalSpace(20),
            ],
          ),
        ),
      ),
    );
  }
}
