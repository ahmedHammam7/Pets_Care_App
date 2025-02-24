import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pets_care_app/core/helper/extension.dart';
import 'package:pets_care_app/core/helper/shared_prefs/shared_prefs.dart';
import 'package:pets_care_app/core/helper/shared_prefs/shared_prefs_constant.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/features/auth/widgets/primary_button.dart';
import 'package:pets_care_app/features/profile/data/models/doctor_profile_response.dart';
import 'package:pets_care_app/features/profile/ui/views/widgets/profile_data.dart';

class DoctorProfileBody extends StatefulWidget {
  const DoctorProfileBody({super.key, required this.model});
  final DoctorProfileResponse model;
  @override
  State<DoctorProfileBody> createState() => _ProfileScreenBodyState();
}

File? image;

class _ProfileScreenBodyState extends State<DoctorProfileBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 100.r,
                      backgroundColor: AppColors.primaryColor,
                      child: CircleAvatar(
                        radius: 96.r,
                        backgroundColor: AppColors.white,
                        backgroundImage: image == null
                            ? const AssetImage(
                                "assets/png/portrait-3d-male-doctor.png")
                            : FileImage(image!),
                      ),
                    ),
                    Positioned(
                      bottom: 6,
                      right: 19,
                      child: CircleAvatar(
                        backgroundColor: AppColors.primaryColor,
                        radius: 18.r,
                        child: CircleAvatar(
                          radius: 16.r,
                          backgroundColor: AppColors.white,
                          child: InkWell(
                            onTap: () {
                              pickImage();
                            },
                            child: Icon(
                              Icons.edit_outlined,
                              color: AppColors.primaryColor,
                              size: 25.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                verticalSpace(40),
                ProfileData(text: widget.model.user.name),
                verticalSpace(20),
                ProfileData(text: widget.model.user.email),
                verticalSpace(20),
                ProfileData(text: widget.model.user.phone),
                verticalSpace(20),
                ProfileData(
                    text:
                        "specialization: ${widget.model.user.doctor.specialization}"),
                verticalSpace(20),
                ProfileData(
                    text:
                        "licenseNumber:${widget.model.user.doctor.licenseNumber}"),
                verticalSpace(20),
                ProfileData(
                    text:
                        "experienceYears: ${widget.model.user.doctor.experienceYears}"),
                verticalSpace(20),
                ProfileData(
                    text:
                        "workingTime:${widget.model.user.doctor.workingTime}"),
                verticalSpace(20),
                ProfileData(
                    text: "address:${widget.model.user.doctor.address}"),
                verticalSpace(20),
                ProfileData(
                    text:
                        "medicalSyndicateCode: ${widget.model.user.doctor.medicalSyndicateCode}"),
                verticalSpace(60),
                PrimaryButton(
                  text: "Logout",
                  onTap: () async {
                    await SharedPrefHelper.removeSecuredData(
                        SharedPrefsConstant.token);
                    await SharedPrefHelper.removeData(SharedPrefsConstant.type);
                    context.pushNamedAndRemoveUntil(Routes.loginScreen,
                        predicate: (Route<dynamic> route) => false);
                  },
                  color: AppColors.red,
                  radius: 14.r,
                  height: 50.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void pickImage() {
    ImagePicker().pickImage(source: ImageSource.gallery).then((value) {
      image = File(value!.path);
    }).then(
      (value) {
        setState(() {});
      },
    );
  }
}
