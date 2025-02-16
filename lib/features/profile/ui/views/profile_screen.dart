import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_care_app/core/helper/shared_prefs/shared_prefs.dart';
import 'package:pets_care_app/core/helper/shared_prefs/shared_prefs_constant.dart';
import 'package:pets_care_app/core/themes/colors.dart';
import 'package:pets_care_app/features/profile/logic/cubit/profile_cubit.dart';
import 'package:pets_care_app/features/profile/ui/views/widgets/doctor_profile_body.dart';
import 'package:pets_care_app/features/profile/ui/views/widgets/profile_screen_body.dart';
import 'package:pets_care_app/features/profile/ui/views/widgets/store_profile_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // body:
      body: ProfileScreenBody(),
    );
  }
}
