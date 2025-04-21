import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_care_app/core/di/dependency_injection.dart';
import 'package:pets_care_app/features/auth/register/logic/cubit/register_cubit.dart';

import 'package:pets_care_app/features/auth/widgets/register_screen_body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RegisterCubit>(),
      child: const Scaffold(
        body: RegisterScreenBody(),
      ),
    );
  }
}
