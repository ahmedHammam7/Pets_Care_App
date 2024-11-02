import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';

class AppPasswordField extends StatelessWidget {
  const AppPasswordField({
    super.key,
    this.controller,
    required this.validator,
    required this.obscureText,
    this.iconPressed,
  });
  final TextEditingController? controller;
  final String? Function(String?) validator;
  final bool obscureText;
  final void Function()? iconPressed;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
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
        labelText: "Password",
        suffixIconColor: AppColors.primaryColor,
        suffixIcon: IconButton(
          onPressed: iconPressed,
          icon: obscureText
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.visibility),
        ),
        hoverColor: AppColors.primaryColor,
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
      validator: (value) {
        return validator(value);
      },
    );
  }
}
