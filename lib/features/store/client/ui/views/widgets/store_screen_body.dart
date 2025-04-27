import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/extension.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:pets_care_app/features/store/client/logic/cubit/store_cubit.dart';
import 'package:pets_care_app/features/store/client/ui/views/widgets/search_field.dart';
import 'package:pets_care_app/features/store/client/ui/views/widgets/store_item.dart';

class StoreScreenBody extends StatelessWidget {
  const StoreScreenBody({
    super.key,
  });

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
                child: SearchField(
                  onchanged: (value) async {
                    await context.read<StoreCubit>().searchItems(value);
                  },
                ),
              ),
            ),
          ),
        ),
        BlocBuilder<StoreCubit, StoreState>(
          buildWhen: (previous, current) =>
              current is SpecificStoreError ||
              current is SpecificStoreLoading ||
              current is SpecificStoreSuccess ||
              current is SearchItemsLoading ||
              current is SearchItemsSuccess ||
              current is SearchItemsError,
          builder: (context, state) {
            if (state is SpecificStoreLoading || state is SearchItemsLoading) {
              return const SliverToBoxAdapter(
                child: Center(
                    child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                )),
              );
            } else if (state is SpecificStoreSuccess) {
              if (state.stores.store.items.isEmpty) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      "The Store is Empty",
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
                  itemCount: state.stores.store.items.length,
                  itemBuilder: (context, index) => StoreItem(
                    onTab: () async {
                      await context.pushNamed(
                        Routes.detailsScreen,
                        arguments: state.stores.store.items[index],
                      );
                    },
                    image: state.stores.store.items[index].image ?? "",
                    name: state.stores.store.items[index].name ?? "",
                    price: state.stores.store.items[index].price ?? "",
                    size: state.stores.store.items[index].foodType ?? "",
                  ),
                ),
              );
            } else if (state is SpecificStoreError ||
                state is SearchItemsError) {
              return SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    "There is no items to show",
                    style: AppTextStyles.homeContainerText
                        .copyWith(color: AppColors.darkGray, fontSize: 30.sp),
                  ),
                ),
              );
            } else if (state is SearchItemsSuccess) {
              return SliverPadding(
                padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 12.h),
                sliver: SliverGrid.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 14.h,
                      crossAxisSpacing: 14.w,
                      mainAxisExtent: MediaQuery.sizeOf(context).height * 0.26,
                      crossAxisCount: 2),
                  itemCount: state.items.items.length,
                  itemBuilder: (context, index) => StoreItem(
                    onTab: () async {
                      await context.pushNamed(
                        Routes.detailsScreen,
                        arguments: state.items.items[index],
                      );
                    },
                    image: state.items.items[index].image ?? "",
                    name: state.items.items[index].name ?? "",
                    price: state.items.items[index].price ?? "",
                    size: state.items.items[index].foodType ?? "",
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
