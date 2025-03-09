import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pets_care_app/core/helper/spacer.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/widgets/app_drop_down_menu.dart';
import 'package:pets_care_app/core/widgets/app_text_field.dart';
import 'package:pets_care_app/features/auth/widgets/primary_button.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

File? image;

class _AddProductScreenState extends State<AddProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 24.sp,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            const AppTextField.outsideHint(hint: "Name"),
            verticalSpace(10),
            const AppTextField.outsideHint(hint: "Category"),
            verticalSpace(10),
            const AppTextField.outsideHint(
              hint: "Price",
              keyboardType: TextInputType.number,
              numeric: true,
            ),
            verticalSpace(10),
            const AppTextField.outsideHint(
              hint: "Description",
              isMultiline: true,
            ),
            verticalSpace(20),
            const AppDropDownMenu(hint: "Type", items: ["Dog", "Cat"]),
            verticalSpace(20),
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
            verticalSpace(20),
            PrimaryButton(text: "Add", onTap: () {})
          ],
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
