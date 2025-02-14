import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pets_care_app/features/auth/login/data/repos/login_repo.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepo) : super(const LoginState.initial());
  final LoginRepo _loginRepo;
//controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //formkey
  final formKey = GlobalKey<FormState>();
  Future<void> login() async {
    emit(const LoginState.loading());

    final result = await _loginRepo.login(
        {"email": emailController.text, "password": passwordController.text});
    result.when(
      success: (response) {
        emit(LoginState.success(response));
      },
      failure: (message) {
        emit(LoginState.error(message.getAllErrorMessages()));
      },
    );
  }
}
