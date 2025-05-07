import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/extension.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:pets_care_app/features/clinics/client/data/models/get_all_clinics_response.dart';

class ClinicsItem extends StatelessWidget {
  const ClinicsItem({super.key, required this.data});
  final ClinicResponseData data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: GestureDetector(
        onTap: () async {
          await context.pushNamed(Routes.doctorDetailsScreen, arguments: data);
        },
        child: Card(
          color: AppColors.white,
          margin: EdgeInsets.zero,
          shadowColor: Colors.grey,
          elevation: 8,
          child: SizedBox(
            height: 131.h,
            width: MediaQuery.of(context).size.width * .5,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      data.photo == "" || data.photo == null
                          ? Image.asset(
                              "assets/png/vet 1.png",
                              height: 50.h,
                            )
                          : Image.network(
                              data.photo!,
                              height: 50.h,
                            ),
                      horizontalSpace(10),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * .3,
                        child: Text(
                          data.doctorName ?? "",
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.clinicsTitle.copyWith(
                              fontWeight: FontWeight.w500, fontSize: 18.sp),
                        ),
                      )
                    ],
                  ),
                  verticalSpace(10),
                  Row(
                    children: [
                      Text(
                        data.appointmentDate ?? "",
                        style: AppTextStyles.experience,
                      ),
                      const Spacer(),
                      Icon(
                        Icons.location_on,
                        color: AppColors.storeSizeItemColor,
                        size: 15.sp,
                      ),
                      Text(data.address ?? "", style: AppTextStyles.experience),
                      const Spacer(),
                      Icon(
                        Icons.monetization_on_rounded,
                        color: AppColors.storeSizeItemColor,
                        size: 15.sp,
                      ),
                      Text(data.price ?? "\$", style: AppTextStyles.experience),
                      const Spacer(),
                    ],
                  ),
                  verticalSpace(10),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time_rounded,
                        color: AppColors.storeSizeItemColor,
                        size: 15.sp,
                      ),
                      horizontalSpace(5),
                      Text(
                        "${data.day ?? ""} - ${data.timeRange ?? ""}",
                        style: AppTextStyles.experience,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
