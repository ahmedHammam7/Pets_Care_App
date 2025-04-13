import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/extension.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';

class ShowAppointmentsBody extends StatelessWidget {
  const ShowAppointmentsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.9,
        child: ListView.builder(
          itemBuilder: (context, index) => const ShowAppointmentsListItem(),
        ),
      ),
    );
  }
}

class ShowAppointmentsListItem extends StatelessWidget {
  const ShowAppointmentsListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: GestureDetector(
        onTap: () async {
          await context.pushNamed(Routes.doctorAppointmentsDetailsScreen);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          height: 100.h,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            children: [
              const Spacer(),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_month_sharp,
                          color: AppColors.white,
                        ),
                        horizontalSpace(10),
                        Text(
                          "clinic.day",
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.homeContainerText,
                        ),
                      ],
                    ),
                    verticalSpace(10),
                    Row(
                      children: [
                        const Icon(
                          Icons.timelapse_sharp,
                          color: AppColors.white,
                        ),
                        horizontalSpace(10),
                        Text(
                          "clinic.time",
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.homeContainerText,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.edit,
                  color: AppColors.white,
                ),
              ),
              horizontalSpace(10),
              IconButton(
                onPressed: () async {},
                icon: const Icon(
                  Icons.delete,
                  color: AppColors.red,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
