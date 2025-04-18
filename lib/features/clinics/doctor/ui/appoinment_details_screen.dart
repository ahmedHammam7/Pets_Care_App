import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';
import 'package:pets_care_app/core/widgets/custom_app_bar.dart';
import 'package:pets_care_app/features/clinics/doctor/data/models/appoinment_doc_response.dart';

class AppoinmentDetailsScreen extends StatelessWidget {
  const AppoinmentDetailsScreen({
    super.key,
    required this.data,
  });
  final AppoinmentDocData data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              children: [
                data.pet.photo == "" || data.pet.photo.isEmpty
                    ? Image.asset(
                        "assets/png/testDog.png",
                        height: 100.h,
                      )
                    : Image.network(
                        data.pet.photo,
                        height: 100.h,
                      ),
                verticalSpace(10),
                Text("Pet Details", style: AppTextStyles.primaryButtonText),
                verticalSpace(10),
                twoWidgets("Pet Name:${data.pet.petName} ", Icons.pets),
                verticalSpace(10),
                twoWidgets("Pet Type:${data.pet.petType} ", Icons.pets),
                verticalSpace(10),
                twoWidgets("gender:${data.pet.gender} ", Icons.pets),
                verticalSpace(10),
                twoWidgets("age:${data.pet.age} ", Icons.pets),
                verticalSpace(10),
                twoWidgets("height: ${data.pet.height}", Icons.height),
                verticalSpace(10),
                twoWidgets(
                    "weight:${data.pet.weight} ", Icons.monitor_weight_sharp),
                verticalSpace(10),
                Text("User Details", style: AppTextStyles.primaryButtonText),
                verticalSpace(10),
                twoWidgets("User Name: ${data.user.name}", Icons.man),
                verticalSpace(10),
                twoWidgets("User Email: ${data.user.email}", Icons.email),
                verticalSpace(10),
                twoWidgets("User Phone:${data.user.phone} ", Icons.phone),
                verticalSpace(10),
                data.clinic.photo == "" || data.pet.photo.isEmpty
                    ? Image.asset(
                        "assets/png/vet 1.png",
                        height: 100.h,
                      )
                    : Image.network(
                        data.clinic.photo,
                        height: 100.h,
                      ),
                verticalSpace(10),
                Text("Clinic Details", style: AppTextStyles.primaryButtonText),
                verticalSpace(10),
                twoWidgets("Appointment Date:${data.clinic.appointmentDate} ",
                    Icons.date_range),
                verticalSpace(10),
                twoWidgets("price:${data.clinic.price} ", Icons.price_change),
                verticalSpace(10),
                twoWidgets(
                    "location:${data.clinic.address} ", Icons.location_on),
                verticalSpace(10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget twoWidgets(String text, IconData icon) {
  return Row(
    children: [
      Icon(
        icon,
        color: AppColors.white,
      ),
      horizontalSpace(10),
      Text(
        text,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyles.homeContainerText,
      ),
    ],
  );
}
