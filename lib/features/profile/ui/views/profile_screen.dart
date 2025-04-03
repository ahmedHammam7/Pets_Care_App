import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_care_app/di/dependency_injection.dart';
import 'package:pets_care_app/features/profile/logic/cubit/profile_cubit.dart';
import 'package:pets_care_app/features/profile/ui/views/widgets/profile_body_loading.dart';
import 'package:pets_care_app/features/profile/ui/views/widgets/profile_screen_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget? widget;
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<ProfileCubit>()..loadUserProfile(),
        child: BlocBuilder<ProfileCubit, ProfileState>(
          buildWhen: (previous, current) =>
              current is Success || current is Error || current is Loading,
          builder: (context, state) {
            if (state is Success) {
              widget = ProfileScreenBody(
                model: state.data,
              );
            } else if (state is Loading) {
              widget = const ProfileBodyLoading();
            } else if (state is Error) {
              widget = const Center(child: Text("Error"));
            }

            return widget ?? const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
