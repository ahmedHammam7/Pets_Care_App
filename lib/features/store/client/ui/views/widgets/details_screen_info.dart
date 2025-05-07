import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:pets_care_app/features/store/client/logic/cubit/store_cubit.dart';

class DetailsScreenInfo extends StatelessWidget {
  const DetailsScreenInfo({super.key, required this.item, this.id});
  final dynamic item;
  final dynamic id;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      margin: EdgeInsets.symmetric(vertical: 5.h),
      shadowColor: Colors.grey,
      elevation: 8,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  item.name ?? "",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.detaisInfo,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () async {
                    await context.read<StoreCubit>().addFavorite(id);
                  },
                  icon: const Icon(
                    Icons.favorite,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  item.foodType ?? "",
                  style: AppTextStyles.brandText,
                ),
                const Spacer(),
                Text(
                  item.price ?? "",
                  style: AppTextStyles.storePrice.copyWith(fontSize: 14.sp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
