import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/extension.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:pets_care_app/features/store/client/data/models/store_response.dart';

class AllStoresList extends StatelessWidget {
  const AllStoresList({super.key, required this.stores});
  final StoreResponse stores;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: ListView.builder(
        itemCount: stores.stores.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 7.h),
          child: StoreListItem(
            storeInfo: stores.stores[index],
          ),
        ),
      ),
    );
  }
}

class StoreListItem extends StatelessWidget {
  const StoreListItem({super.key, required this.storeInfo});
  final StoreInfo storeInfo;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await context.pushNamed(Routes.storeScreen,
            arguments: storeInfo.id.toString());
      },
      child: Container(
        height: 100.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(16.r),
          ),
        ),
        child: Row(
          children: [
            horizontalSpace(5),
            const Icon(
              Icons.store,
              color: AppColors.white,
            ),
            horizontalSpace(5),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: Text(
                storeInfo.storeName,
                overflow: TextOverflow.fade,
                style: AppTextStyles.textFieldLabel
                    .copyWith(color: AppColors.white),
              ),
            ),
            horizontalSpace(10),
            const Icon(
              Icons.location_on,
              color: AppColors.white,
            ),
            horizontalSpace(5),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: Text(
                storeInfo.address,
                overflow: TextOverflow.fade,
                style: AppTextStyles.textFieldLabel
                    .copyWith(color: AppColors.white),
              ),
            ),
            horizontalSpace(10),
            const Icon(
              Icons.phone_android,
              color: AppColors.white,
            ),
            horizontalSpace(5),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: Text(
                overflow: TextOverflow.fade,
                storeInfo.hotLine.toString(),
                style: AppTextStyles.textFieldLabel
                    .copyWith(color: AppColors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
