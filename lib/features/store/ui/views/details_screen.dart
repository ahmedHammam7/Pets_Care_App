import 'package:flutter/material.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/features/store/ui/views/widgets/details_screen_body.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
      ),
      body: const DetailsScreenBody(),
    );
  }
}
