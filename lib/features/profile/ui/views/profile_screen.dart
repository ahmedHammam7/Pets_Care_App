import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_care_app/core/helper/extension.dart';
import 'package:pets_care_app/core/routing/routes.dart';
import 'package:pets_care_app/core/di/dependency_injection.dart';
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
              current is Success ||
              current is Error ||
              current is Loading ||
              current is UpdateSuccess ||
              current is UpdateError ||
              current is UpdateLoading,
          builder: (context, state) {
            if (state is Success) {
              widget = ProfileScreenBody(
                model: state.data,
              );
            } else if (state is Loading || state is UpdateLoading) {
              widget = const ProfileBodyLoading();
            } else if (state is Error) {
              widget = const Center(child: Text("Error"));
            }

            if (state is UpdateSuccess) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                context.pushNamedAndRemoveUntil(
                    Routes.homeLayout, (route) => false,
                    predicate: (Route<dynamic> route) => false);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Updated Successfully"),
                  backgroundColor: Colors.green,
                ));
              });
            }

            return widget ?? const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
