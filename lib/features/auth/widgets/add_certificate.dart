import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';

class AddCertificate extends StatefulWidget {
  const AddCertificate({super.key});

  @override
  State<AddCertificate> createState() => _AddCertificateState();
}

File? image;

class _AddCertificateState extends State<AddCertificate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300.h,
      decoration: BoxDecoration(
        border: Border.all(width: 2.w, color: AppColors.primaryColor),
      ),
      child: TextButton(
          onPressed: () {
            pickImage();
          },
          child: image == null
              ? Text(
                  "Add Certificate",
                  style: AppTextStyles.cartItemName
                      .copyWith(fontWeight: FontWeight.bold),
                )
              : Image.file(
                  image!,
                  height: 300.h,
                  fit: BoxFit.contain,
                )),
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
