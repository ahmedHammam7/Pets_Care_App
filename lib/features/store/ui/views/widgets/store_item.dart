import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/extension.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:pets_care_app/features/store/ui/views/widgets/separated_line.dart';

class StoreItem extends StatelessWidget {
  const StoreItem(
      {super.key,
      required this.image,
      required this.price,
      required this.name,
      required this.size,
      this.cartOnTap});
  final String image;
  final String price;
  final String name;
  final String size;
  final void Function()? cartOnTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await context.pushNamed(Routes.detailsScreen);
      },
      child: Card(
        color: AppColors.white,
        margin: EdgeInsets.zero,
        shadowColor: Colors.grey,
        elevation: 8,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
          child: SizedBox(
            width: 150.w,
            height: 190.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  image,
                  height: 94.h,
                ),
                verticalSpace(10),
                SizedBox(
                  width: 140.w,
                  child: Text(
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    price,
                    style: AppTextStyles.storePrice,
                  ),
                ),
                SizedBox(
                  width: 140.w,
                  child: Text(
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    name,
                    style: AppTextStyles.storeNameItem,
                  ),
                ),
                SizedBox(
                  width: 140.w,
                  child: Text(
                    size,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.storeSizeItem,
                  ),
                ),
                verticalSpace(5),
                const SeparatedLine(),
                verticalSpace(5),
                GestureDetector(
                  onTap: cartOnTap,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_bag_outlined,
                        color: AppColors.green,
                        size: 15.sp,
                      ),
                      horizontalSpace(5),
                      Text(
                        "Add to cart",
                        style: AppTextStyles.storeSizeItem
                            .copyWith(color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
