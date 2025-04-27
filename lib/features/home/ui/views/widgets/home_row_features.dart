import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/constants.dart';
import 'package:pets_care_app/core/helper/extension.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/features/home/ui/views/widgets/home_features_item.dart';

class HomeRowFeatures extends StatefulWidget {
  const HomeRowFeatures({super.key});

  @override
  State<HomeRowFeatures> createState() => _HomeRowFeaturesState();
}

int selectedIndex = 0;

class _HomeRowFeaturesState extends State<HomeRowFeatures> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  selectedIndex = index;
                  setState(() {});
                  if (index == 0) {
                    context.pushNamed(Routes.allStoresScreen);
                  }
                  if (index == 1) {
                    context.pushNamed(Routes.clinicsScreen);
                  }
                  if (index == 2) {
                    context.pushNamed(Routes.addPetsScreen);
                  }
                  if (index == 3) {
                    context.pushNamed(Routes.chatBotScreen);
                  }
                },
                child: selectedIndex == index
                    ? HomeFeaturesItem(
                        image: Constants.featuresImage[index],
                        backgroundColor: AppColors.primaryColor,
                        text: Constants.featuresText[index],
                        textColor: AppColors.primaryColor,
                      )
                    : HomeFeaturesItem(
                        image: Constants.featuresImage[index],
                        backgroundColor: AppColors.white,
                        text: Constants.featuresText[index],
                      ),
              ),
          separatorBuilder: (context, index) => horizontalSpace(10),
          itemCount: 4),
    );
  }
}
