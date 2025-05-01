import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:pets_care_app/features/cart/data/models/get_cart_response.dart';
import 'package:pets_care_app/features/cart/logic/cubit/cart_cubit.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key, required this.cartItem, required this.quantity});
  final GetCartItem cartItem;
  final int quantity;
  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) async {
        if (direction == DismissDirection.endToStart) {
          setState(() async {
            await context
                .read<CartCubit>()
                .deleteCart(widget.cartItem.id.toString());
          });
        }
      },
      direction: DismissDirection.endToStart,
      background: Card(
        margin: EdgeInsets.symmetric(vertical: 7.h, horizontal: 20.w),
        color: AppColors.red,
        shadowColor: Colors.black,
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 37.w, vertical: 37.h),
          child: Image.asset(
            "assets/png/delete_icon.png",
          ),
        ),
      ),
      child: Card(
        color: AppColors.white,
        margin: EdgeInsets.symmetric(vertical: 7.h, horizontal: 20.w),
        shadowColor: Colors.black,
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.only(right: 0, left: 10.w),
          child: Row(
            children: [
              widget.cartItem.image == null || widget.cartItem.image == ""
                  ? Image.asset(
                      "assets/png/food_test.png",
                      height: 70.h,
                    )
                  : Image.network(
                      widget.cartItem.image!,
                      height: 70.h,
                    ),
              horizontalSpace(12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.cartItem.price ?? "",
                    style: AppTextStyles.storePrice,
                  ),
                  SizedBox(
                    width: 152.w,
                    child: Text(
                      widget.cartItem.name ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.cartItemName,
                    ),
                  ),
                  SizedBox(
                    width: 152.w,
                    child: Text(
                      widget.cartItem.description ?? "",
                      style: AppTextStyles.storeSizeItem
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                widget.quantity.toString(),
                style: AppTextStyles.quantityWidgetText.copyWith(
                    color: AppColors.darkGray,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold),
              ),
              horizontalSpace(15),
            ],
          ),
        ),
      ),
    );
  }
}
