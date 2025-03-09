import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/features/store/client/ui/views/widgets/recomended_text.dart';
import 'package:pets_care_app/features/store/client/ui/views/widgets/search_field.dart';
import 'package:pets_care_app/features/store/client/ui/views/widgets/store_icons_rows.dart';
import 'package:pets_care_app/features/store/client/ui/views/widgets/store_item.dart';

class StoreScreenBody extends StatelessWidget {
  const StoreScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverLayoutBuilder(
          builder: (context, constraints) => SliverToBoxAdapter(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SearchField(),
                    verticalSpace(20),
                    const StoreIconsRows(),
                    verticalSpace(20),
                    const RecomendedText(text: "Food"),
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
                mainAxisExtent: MediaQuery.sizeOf(context).height * 0.26,
                crossAxisCount: 2),
            itemCount: 9,
            itemBuilder: (context, index) => const StoreItem(
              image: "assets/png/food_test.png",
              name: "Josera Mini Deluxe",
              price: "Rs 2900.00",
              size: "900g",
            ),
          ),
        )
      ],
    );
  }
}
