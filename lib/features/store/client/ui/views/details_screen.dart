import 'package:flutter/material.dart';
import 'package:pets_care_app/features/store/client/ui/views/widgets/details_screen_body.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DetailsScreenBody(),
    );
  }
}
