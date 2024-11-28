import 'package:flutter/material.dart';
import 'package:pets_care_app/core/themes/text_styles.dart';

class RecommendedText extends StatelessWidget {
  const RecommendedText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Recommended Food",
      style: AppTextStyles.recommendedText,
    );
  }
}
