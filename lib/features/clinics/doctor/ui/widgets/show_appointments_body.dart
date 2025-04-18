import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/extension.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:pets_care_app/features/clinics/doctor/data/models/appoinment_doc_response.dart';

class ShowAppointmentsBody extends StatelessWidget {
  const ShowAppointmentsBody({super.key, required this.appointments});
  final AppoinmentDocResponse appointments;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.9,
        child: ListView.builder(
          itemCount: appointments.data.length,
          itemBuilder: (context, index) => ShowAppointmentsListItem(
            data: appointments.data[index],
          ),
        ),
      ),
    );
  }
}

class ShowAppointmentsListItem extends StatelessWidget {
  const ShowAppointmentsListItem({
    super.key,
    required this.data,
  });
  final AppoinmentDocData data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: GestureDetector(
        onTap: () async {
          await context.pushNamed(Routes.doctorAppointmentsDetailsScreen,
              arguments: data);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          height: 100.h,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.calendar_month_sharp,
                color: AppColors.white,
              ),
              horizontalSpace(10),
              Text(
                data.day,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.homeContainerText,
              ),
              horizontalSpace(20),
              const Icon(
                Icons.timelapse_sharp,
                color: AppColors.white,
              ),
              horizontalSpace(10),
              Text(
                data.time,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.homeContainerText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
