import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/features/home/ui/views/widgets/home_header.dart';
import 'package:pets_care_app/features/home/ui/views/widgets/home_header_container.dart';
import 'package:pets_care_app/features/home/ui/views/widgets/home_row_features.dart';
import 'package:pets_care_app/features/home/ui/views/widgets/pets_reminder_container.dart';
import 'package:pets_care_app/features/home/ui/views/widgets/recommended_list_item.dart';
import 'package:pets_care_app/features/home/ui/views/widgets/recommended_text.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverLayoutBuilder(
          builder: (context, constraints) => SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HomeHeader(),
                    verticalSpace(25),
                    const HomeHeaderContainer(),
                    verticalSpace(20),
                    const HomeRowFeatures(),
                    verticalSpace(10),
                    const PetsReminderContainer(),
                    verticalSpace(10),
                    const RecommendedText(),
                  ],
                ),
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 12.h),
          sliver: SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 14.h,
                crossAxisSpacing: 14.w,
                mainAxisExtent: MediaQuery.sizeOf(context).height * 0.23,
                crossAxisCount: 3),
            itemCount: 9,
            itemBuilder: (context, index) => const RecommendedListItem(),
          ),
        )
      ],
    );
  }
}
