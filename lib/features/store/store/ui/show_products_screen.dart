import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:pets_care_app/features/store/client/data/models/product_model.dart';
import 'package:pets_care_app/features/store/store/logic/cubit/store_store_cubit.dart';
import 'package:pets_care_app/features/store/store/ui/widgets/products_loading.dart';

class ShowProductsScreen extends StatelessWidget {
  const ShowProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 24.sp,
          ),
        ),
      ),
      body: BlocBuilder<StoreStoreCubit, StoreStoreState>(
        builder: (context, state) {
          if (state is AllProductsLoading) {
            return const ProductsLoading();
          } else if (state is AllProductsSuccess) {
            return ListView.builder(
              itemBuilder: (context, index) => StoreProductsListItem(
                data: state.data[index],
              ),
              itemCount: state.data.length,
            );
          } else if (state is AllProductsFailure) {
            return Center(
              child: Text(
                state.message,
                style: AppTextStyles.homeContainerText.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class StoreProductsListItem extends StatelessWidget {
  const StoreProductsListItem({super.key, required this.data});
  final ProductResponse data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
        height: 80.h,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            Image.asset(
              "assets/png/food.png",
              height: 100.h,
            ),
            horizontalSpace(10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 70.w,
                  child: Text(
                    data.name,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.homeContainerText,
                  ),
                ),
                Text(
                  "\$ ${data.price}",
                  style: AppTextStyles.homeContainerText,
                ),
              ],
            ),
            horizontalSpace(20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Food Type",
                  style: AppTextStyles.homeContainerText,
                ),
                Text(
                  data.foodType,
                  style: AppTextStyles.homeContainerText,
                ),
              ],
            ),
            horizontalSpace(20),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit,
                color: AppColors.white,
              ),
            ),
            horizontalSpace(5),
            Expanded(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete,
                  color: AppColors.red,
                ),
              ),
            ),
            horizontalSpace(10),
          ],
        ),
      ),
    );
  }
}
