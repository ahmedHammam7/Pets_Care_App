import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_care_app/di/dependency_injection.dart';
import 'package:pets_care_app/features/profile/logic/cubit/profile_cubit.dart';
import 'package:pets_care_app/features/profile/ui/views/widgets/doctor_profile_body.dart';
import 'package:pets_care_app/features/profile/ui/views/widgets/profile_screen_body.dart';
import 'package:pets_care_app/features/profile/ui/views/widgets/store_profile_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget? widget;
    return Scaffold(
      // body:P
      body: BlocProvider(
        create: (context) => getIt<ProfileCubit>()..selectWhichProfile(),
        child: BlocBuilder<ProfileCubit, ProfileState>(
          buildWhen: (previous, current) =>
              current is Success ||
              current is Error ||
              current is DoctorProfileSuccess ||
              current is StoreProfileSuccess ||
              current is Loading ||
              current is DoctorProfileLoading ||
              current is DoctorProfileError ||
              current is StoreProfileLoading ||
              current is StoreProfileError,
          builder: (context, state) {
            if (state is Success) {
              widget = ProfileScreenBody(
                model: state.data,
              );
            } else if (state is DoctorProfileSuccess) {
              widget = DoctorProfileBody(
                model: state.data,
              );
            } else if (state is StoreProfileSuccess) {
              widget = StoreProfileBody(
                model: state.data,
              );
            } else if (state is Loading ||
                state is DoctorProfileLoading ||
                state is StoreProfileLoading) {
              widget = const Center(child: CircularProgressIndicator());
            } else if (state is Error ||
                state is DoctorProfileError ||
                state is StoreProfileError) {
              widget = const Center(child: Text("Error"));
            }

            return widget ?? const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
