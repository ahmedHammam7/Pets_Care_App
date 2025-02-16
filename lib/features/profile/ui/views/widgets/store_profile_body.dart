import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/features/auth/widgets/primary_button.dart';
import 'package:pets_care_app/features/profile/ui/views/widgets/profile_data.dart';

class StoreProfileBody extends StatefulWidget {
  const StoreProfileBody({super.key});

  @override
  State<StoreProfileBody> createState() => _ProfileScreenBodyState();
}

File? image;

class _ProfileScreenBodyState extends State<StoreProfileBody> {
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
                            ? const AssetImage("assets/png/profile.png")
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
                const ProfileData(text: "Ahmed Hammam"),
                verticalSpace(20),
                const ProfileData(text: "ahmed@gmail.com"),
                verticalSpace(20),
                const ProfileData(text: "01273373027"),
                verticalSpace(20),
                const ProfileData(text: "storeName: Dog Store"),
                verticalSpace(20),
                const ProfileData(text: "address: Cairo, Egypt"),
                verticalSpace(20),
                const ProfileData(text: "hotLine: 01273373027"),
                verticalSpace(20),
                const ProfileData(text: "whatsappPhone: 01273373027"),
                verticalSpace(60),
                PrimaryButton(
                  text: "Logout",
                  onTap: () {},
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
