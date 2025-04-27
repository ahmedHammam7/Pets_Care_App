import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/extension.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:pets_care_app/features/auth/widgets/primary_button.dart';
import 'package:pets_care_app/features/store/client/ui/views/widgets/details_screen_info.dart';
import 'package:pets_care_app/features/store/client/ui/views/widgets/quantity_widget.dart';

class DetailsScreenBody extends StatelessWidget {
  const DetailsScreenBody({super.key, required this.item});
  final dynamic item;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 24.sp,
                  )),
              Image(
                image: item.image == "" || item.image == null
                    ? const AssetImage("assets/png/food_test.png")
                    : NetworkImage(item.image!),
                height: 373.h,
              ),
              DetailsScreenInfo(
                item: item,
              ),
              verticalSpace(10),
              Text(
                item.description ?? "",
                style: AppTextStyles.storeItemDesc,
              ),
              const QuantityWidget(),
              PrimaryButton(
                text: "Add to Cart",
                onTap: () {
                  context.pushNamed(Routes.cartScreen);
                },
                textstyle: AppTextStyles.addToCartButton,
                radius: 8,
              ),
              verticalSpace(20),
            ],
          ),
        ),
      ),
    );
  }
}
