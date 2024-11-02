import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';

class AppRichText extends StatelessWidget {
  const AppRichText({
    super.key,
    required this.text1,
    required this.text2,
    this.onTap,
  });
  final String text1;
  final String text2;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: text1,
          style: AppTextStyles.richText,
          children: [
            TextSpan(
              text: text2,
              style: AppTextStyles.richText
                  .copyWith(color: AppColors.primaryColor),
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          ],
        ),
      ),
    );
  }
}
