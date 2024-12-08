import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:pets_care_app/features/auth/widgets/primary_button.dart';
import 'package:pets_care_app/features/cart/ui/views/widgets/cart_list.dart';
import 'package:pets_care_app/features/cart/ui/views/widgets/total_row.dart';

class CartScreenBody extends StatelessWidget {
  const CartScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CartList(),
            verticalSpace(50),
            TotalRow(
                text1: "Subtotal",
                textStyle: AppTextStyles.subTotalCart,
                text2: "Rs 53,340.00"),
            verticalSpace(10),
            TotalRow(
                text1: "Shipping charges",
                textStyle: AppTextStyles.subTotalCart,
                text2: "Rs 520.00"),
            verticalSpace(20),
            TotalRow(
                text1: "Total",
                textStyle: AppTextStyles.subTotalCart
                    .copyWith(fontSize: 18.sp, fontWeight: FontWeight.bold),
                text2: "Rs 53,860"),
            verticalSpace(30),
            PrimaryButton(
              width: MediaQuery.of(context).size.width * 0.94,
              text: "Checkout",
              onTap: () {},
              textstyle: AppTextStyles.addToCartButton,
              radius: 8,
            ),
          ],
        ),
      ),
    );
  }
}
