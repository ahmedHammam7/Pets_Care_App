import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/extension.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:pets_care_app/features/store/client/logic/cubit/store_cubit.dart';
import 'package:pets_care_app/features/store/client/ui/views/widgets/store_item.dart';
import 'package:shimmer/shimmer.dart';

class FavouriteScreenBody extends StatelessWidget {
  const FavouriteScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        BlocConsumer<StoreCubit, StoreState>(
          listenWhen: (previous, current) =>
              current is FavoritesError ||
              current is FavoritesLoading ||
              current is FavoritesSuccess ||
              current is AddFavoriteError ||
              current is AddFavoriteLoading ||
              current is AddFavoriteSuccess,
          buildWhen: (previous, current) =>
              current is FavoritesError ||
              current is FavoritesLoading ||
              current is FavoritesSuccess ||
              current is AddFavoriteError ||
              current is AddFavoriteLoading ||
              current is AddFavoriteSuccess,
          listener: (previous, current) {
            if (current is AddFavoriteSuccess) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Added to favorites"),
                  backgroundColor: Colors.green,
                ));
              });
            } else if (current is AddFavoriteError) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Something went wrong"),
                  backgroundColor: Colors.red,
                ));
              });
            }
          },
          builder: (context, state) {
            if (state is AddFavoriteLoading || state is FavoritesLoading) {
              return SliverPadding(
                padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 12.h),
                sliver: SliverGrid.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 14.h,
                      crossAxisSpacing: 14.w,
                      mainAxisExtent: MediaQuery.sizeOf(context).height * 0.26,
                      crossAxisCount: 2),
                  itemCount: 5,
                  itemBuilder: (context, index) => Shimmer.fromColors(
                    baseColor: Colors.white,
                    highlightColor: AppColors.storeSizeItemColor,
                    child: const StoreItem(
                      image: "",
                      name: "",
                      price: "",
                      size: "",
                    ),
                  ),
                ),
              );
            } else if (state is FavoritesSuccess) {
              if (state.items.isEmpty) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      "There is no items to show",
                      style: AppTextStyles.homeContainerText
                          .copyWith(color: AppColors.darkGray, fontSize: 30.sp),
                    ),
                  ),
                );
              }
              return SliverPadding(
                padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 12.h),
                sliver: SliverGrid.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 14.h,
                      crossAxisSpacing: 14.w,
                      mainAxisExtent: MediaQuery.sizeOf(context).height * 0.26,
                      crossAxisCount: 2),
                  itemCount: state.items.length,
                  itemBuilder: (context, index) => StoreItem(
                    onTab: () async {
                      await context.pushNamed(
                        Routes.detailsScreen,
                        arguments: {
                          "item": state.items[index].item,
                          "id": state.items[index].itemId,
                        },
                      );
                    },
                    image: state.items[index].item.image ?? "",
                    name: state.items[index].item.name ?? "",
                    price: state.items[index].item.price ?? "",
                    size: state.items[index].item.foodType ?? "",
                  ),
                ),
              );
            } else if (state is FavoritesError) {
              return SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    "There is no items to show",
                    style: AppTextStyles.homeContainerText
                        .copyWith(color: AppColors.darkGray, fontSize: 30.sp),
                  ),
                ),
              );
            }
            return const SliverToBoxAdapter(child: SizedBox.shrink());
          },
        )
      ],
    );
  }
}
