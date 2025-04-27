import 'package:flutter/material.dart';
import 'package:pets_care_app/features/store/client/ui/views/widgets/details_screen_body.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.item});
  final dynamic item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailsScreenBody(
        item: item,
      ),
    );
  }
}
