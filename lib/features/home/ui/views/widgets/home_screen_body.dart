import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/extension.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/features/home/ui/views/widgets/home_header.dart';
import 'package:pets_care_app/features/home/ui/views/widgets/home_header_container.dart';
import 'package:pets_care_app/features/home/ui/views/widgets/home_row_features.dart';
import 'package:pets_care_app/features/home/ui/views/widgets/pets_reminder_container.dart';
import 'package:pets_care_app/features/home/ui/views/widgets/recommended_list_item.dart';
import 'package:pets_care_app/features/home/ui/views/widgets/recommended_text.dart';
import 'package:pets_care_app/features/store/client/data/models/recomended_food_response.dart';
import 'package:pets_care_app/features/store/client/logic/cubit/store_cubit.dart';
import 'package:shimmer/shimmer.dart';

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
        BlocBuilder<StoreCubit, StoreState>(
          buildWhen: (previous, current) =>
              current is RecommendedFoodSuccess ||
              current is RecommendedFoodLoading ||
              current is RecommendedFoodError,
          builder: (context, state) {
            if (state is RecommendedFoodLoading) {
              return recommendedFoodLoadingWidget(context);
            } else if (state is RecommendedFoodError) {
              return Center(child: Text(state.message));
            } else if (state is RecommendedFoodSuccess) {
              return SliverPadding(
                padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 12.h),
                sliver: SliverGrid.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 14.h,
                      crossAxisSpacing: 14.w,
                      mainAxisExtent: MediaQuery.sizeOf(context).height * 0.23,
                      crossAxisCount: 3),
                  itemCount: state.items.items.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      context.pushNamed(Routes.detailsScreen,
                          arguments: state.items.items[index]);
                    },
                    child: RecommendedListItem(
                      item: state.items.items[index],
                    ),
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        )
      ],
    );
  }
}

Widget recommendedFoodLoadingWidget(context) {
  return SliverPadding(
    padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 12.h),
    sliver: SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 14.h,
          crossAxisSpacing: 14.w,
          mainAxisExtent: MediaQuery.sizeOf(context).height * 0.23,
          crossAxisCount: 3),
      itemCount: 9,
      itemBuilder: (context, index) => Shimmer.fromColors(
        baseColor: Colors.white,
        highlightColor: AppColors.storeSizeItemColor,
        child: RecommendedListItem(
            item: RecomendedFoodItems(
                id: 1,
                name: "name",
                image: "",
                description: "description",
                category: "category",
                foodType: "foodType",
                price: "price")),
      ),
    ),
  );
}
