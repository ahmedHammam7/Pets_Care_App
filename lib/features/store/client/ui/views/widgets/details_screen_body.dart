import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/extension.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:pets_care_app/features/auth/widgets/primary_button.dart';
import 'package:pets_care_app/features/store/client/logic/cubit/store_cubit.dart';
import 'package:pets_care_app/features/store/client/ui/views/widgets/details_screen_info.dart';
import 'package:pets_care_app/features/store/client/ui/views/widgets/quantity_widget.dart';

class DetailsScreenBody extends StatelessWidget {
  const DetailsScreenBody({super.key, required this.item, this.id});
  final dynamic item;
  final dynamic id;
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
                id: id,
              ),
              verticalSpace(10),
              Text(
                item.description ?? "",
                style: AppTextStyles.storeItemDesc,
              ),
              const QuantityWidget(),
              BlocConsumer<StoreCubit, StoreState>(
                listenWhen: (previous, current) =>
                    current is AddToCartSuccess ||
                    current is AddToCartError ||
                    current is AddToCartLoading ||
                    current is AddFavoriteSuccess ||
                    current is AddFavoriteError ||
                    current is AddFavoriteLoading,
                buildWhen: (previous, current) =>
                    current is AddToCartSuccess ||
                    current is AddToCartError ||
                    current is AddToCartLoading ||
                    current is AddFavoriteSuccess ||
                    current is AddFavoriteError ||
                    current is AddFavoriteLoading,
                listener: (context, state) {
                  if (state is AddFavoriteSuccess ||
                      state is AddToCartSuccess) {
                    WidgetsBinding.instance.addPostFrameCallback((_) async {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Product Added Successfully"),
                        backgroundColor: Colors.green,
                      ));
                    });
                  }
                  if (state is AddFavoriteError || state is AddToCartError) {
                    WidgetsBinding.instance.addPostFrameCallback((_) async {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("something went wrong"),
                        backgroundColor: Colors.red,
                      ));
                    });
                  }
                },
                builder: (context, state) {
                  if (state is AddToCartLoading) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ));
                  } else if (state is AddToCartSuccess) {
                    WidgetsBinding.instance.addPostFrameCallback((_) async {
                      await context.pushNamed(Routes.cartScreen);
                    });
                  }
                  return PrimaryButton(
                    text: "Add to Cart",
                    onTap: () async {
                      await context
                          .read<StoreCubit>()
                          .addToCart(id, context.read<StoreCubit>().quantity);
                    },
                    textstyle: AppTextStyles.addToCartButton,
                    radius: 8,
                  );
                },
              ),
              verticalSpace(20),
            ],
          ),
        ),
      ),
    );
  }
}
