import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';

class QuantityWidget extends StatefulWidget {
  const QuantityWidget({super.key});

  @override
  State<QuantityWidget> createState() => _QuantityWidgetState();
}

int quantity = 1;

class _QuantityWidgetState extends State<QuantityWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
      child: Row(
        children: [
          Text(
            "Quantity",
            style: AppTextStyles.quantityWidgetText,
          ),
          const Spacer(),
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
              size: 24.sp,
              color: AppColors.primaryColor,
            ),
          ),
          Text(quantity.toString(),
              style: AppTextStyles.quantityWidgetText
                  .copyWith(color: AppColors.primaryColor, fontSize: 16.sp)),
          IconButton(
            onPressed: () {
              setState(() {
                quantity++;
              });
            },
            icon: Icon(
              Icons.add,
              size: 24.sp,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
