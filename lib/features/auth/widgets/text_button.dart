import 'package:flutter/material.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';

class PrimaryTextButton extends StatelessWidget {
  const PrimaryTextButton({super.key, this.onPressed, required this.text});
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: AppTextStyles.richText.copyWith(color: AppColors.primaryColor),
      ),
    );
  }
}
