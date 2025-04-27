import 'package:flutter/material.dart';
import 'package:pets_care_app/core/widgets/custom_app_bar.dart';
import 'package:pets_care_app/features/store/client/ui/views/widgets/all_stores_body.dart';

class AllStoresScreen extends StatelessWidget {
  const AllStoresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: const AllStoresBody(),
    );
  }
}
