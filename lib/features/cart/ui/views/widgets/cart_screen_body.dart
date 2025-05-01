import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/extension.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:pets_care_app/features/auth/widgets/primary_button.dart';
import 'package:pets_care_app/features/cart/logic/cubit/cart_cubit.dart';
import 'package:pets_care_app/features/cart/ui/views/widgets/cart_list.dart';
import 'package:pets_care_app/features/cart/ui/views/widgets/total_row.dart';
import 'package:pets_care_app/features/store/store/ui/widgets/products_loading.dart';

class CartScreenBody extends StatelessWidget {
  const CartScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 24.sp,
                  )),
            ),
            BlocBuilder<CartCubit, CartState>(
              buildWhen: (previous, current) =>
                  current is GetCartSuccess ||
                  current is GetCartLoading ||
                  current is GetCartFailure,
              builder: (context, state) {
                if (state is GetCartLoading) {
                  return SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.6,
                      child: const ProductsLoading());
                }
                if (state is GetCartFailure) {
                  return Center(child: Text(state.message));
                }
                if (state is GetCartSuccess) {
                  return CartList(
                    cart: state.cart,
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            verticalSpace(50),
            BlocBuilder<CartCubit, CartState>(
              buildWhen: (previous, current) =>
                  current is GetCartSuccess ||
                  current is GetCartLoading ||
                  current is GetCartFailure,
              builder: (context, state) {
                if (state is GetCartLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  );
                }
                if (state is GetCartFailure) {
                  return Center(child: Text(state.message));
                }
                if (state is GetCartSuccess) {
                  return TotalRow(
                    text1: "Total",
                    textStyle: AppTextStyles.subTotalCart
                        .copyWith(fontSize: 18.sp, fontWeight: FontWeight.bold),
                    text2: state.cart.overall.overallPrice.toString(),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            verticalSpace(30),
            Center(
              child: PrimaryButton(
                width: MediaQuery.of(context).size.width * 0.94,
                text: "Checkout",
                onTap: () async {
                  await context.pushNamed(Routes.pickeOrderScreen);
                },
                textstyle: AppTextStyles.addToCartButton,
                radius: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
