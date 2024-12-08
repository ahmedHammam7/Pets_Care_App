import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key});

  @override
  State<CartItem> createState() => _CartItemState();
}

int quantity = 1;

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) async {
        if (direction == DismissDirection.endToStart) {}
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
              Image.asset(
                "assets/png/food_test.png",
                height: 70.h,
              ),
              horizontalSpace(12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rs 7850.00 x 3",
                    style: AppTextStyles.storePrice,
                  ),
                  SizedBox(
                    width: 152.w,
                    child: Text(
                      "Josera MIni Deluxe",
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.cartItemName,
                    ),
                  ),
                  SizedBox(
                    width: 152.w,
                    child: Text(
                      "900g",
                      style: AppTextStyles.storeSizeItem
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (quantity > 1) {
                          quantity--;
                        }
                      });
                    },
                    icon: Icon(
                      Icons.remove,
                      size: 18.sp,
                      color: AppColors.green,
                    ),
                  ),
                  Text(quantity.toString(),
                      style: AppTextStyles.quantityWidgetText.copyWith(
                          color: AppColors.darkGray, fontSize: 14.sp)),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        quantity++;
                      });
                    },
                    icon: Icon(
                      Icons.add,
                      size: 18.sp,
                      color: AppColors.green,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
