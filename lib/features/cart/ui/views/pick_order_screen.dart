import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/extension.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:pets_care_app/features/cart/logic/cubit/cart_cubit.dart';

class PickOrderScreen extends StatelessWidget {
  const PickOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
            onPressed: () async {
              await context.pushNamedAndRemoveUntil(
                Routes.homeLayout,
                (route) => false,
                predicate: (Route<dynamic> route) => false,
              );
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 24.sp,
            )),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              child: Card(
                color: AppColors.white,
                margin: EdgeInsets.symmetric(vertical: 7.h, horizontal: 20.w),
                shadowColor: Colors.black,
                elevation: 10,
                child: Padding(
                  padding: EdgeInsets.only(right: 0, left: 10.w),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    child: BlocBuilder<CartCubit, CartState>(
                      buildWhen: (previous, current) =>
                          current is CheckoutSuccess ||
                          current is CheckoutFailure ||
                          current is CheckoutLoading,
                      builder: (context, state) {
                        if (state is CheckoutLoading) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ),
                          );
                        } else if (state is CheckoutFailure) {
                          return Center(
                            child: Text(
                              state.message,
                              style: AppTextStyles.storePrice.copyWith(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryColor),
                            ),
                          );
                        } else if (state is CheckoutSuccess) {
                          return Column(
                            children: [
                              Text(
                                state.response.message,
                                style: AppTextStyles.storePrice.copyWith(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primaryColor),
                              ),
                              verticalSpace(10),
                              Row(
                                children: [
                                  Text(
                                    "Total Amount :",
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyles.cartItemName,
                                  ),
                                  horizontalSpace(10),
                                  Text(
                                    state.response.orderDetails.total
                                        .toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyles.cartItemName,
                                  ),
                                ],
                              ),
                            ],
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
