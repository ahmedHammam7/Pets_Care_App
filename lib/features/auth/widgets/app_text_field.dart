import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {super.key,
      required this.labelText,
      this.controller,
      this.keyboardType,
      required this.validator});
  final String labelText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?) validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.textFieldColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(24.r),
          ),
          borderSide: BorderSide.none,
        ),
        labelText: labelText,
        floatingLabelStyle: AppTextStyles.textFieldLabel,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.r),
          borderSide: BorderSide(
            width: 1.w,
            color: Colors.red,
          ),
        ),
      ),
      controller: controller,
      keyboardType: keyboardType,
      validator: (value) {
        return validator(value);
      },
    );
  }
}
