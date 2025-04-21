import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pets_care_app/core/helper/shared_prefs/shared_prefs.dart';
import 'package:pets_care_app/core/helper/shared_prefs/shared_prefs_constant.dart';
import 'package:pets_care_app/features/profile/data/repos/profile_repo.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo) : super(const ProfileState.initial());
  final ProfileRepo profileRepo;

//controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  //formKey
  final formKey = GlobalKey<FormState>();
  String? userName;
  Future<void> loadUserProfile() async {
    emit(const ProfileState.loading());

    final result = await profileRepo.getUserProfile();
    result.when(
      success: (response) {
        userName = response.user.name;
        emit(ProfileState.success(response));
      },
      failure: (message) {
        emit(ProfileState.error(message.getAllErrorMessages()));
      },
    );
  }

  Future<void> updateProfile() async {
    emit(const ProfileState.updateLoading());
    final result = await profileRepo.updateProfile({
      "name": nameController.text,
      "email": emailController.text,
      "phone": phoneController.text
    });
    result.when(
      success: (response) {
        emit(const ProfileState.updateSuccess());
      },
      failure: (message) {
        emit(ProfileState.updateError(message.getAllErrorMessages()));
      },
    );
  }

  Future<void> logout() async {
    await SharedPrefHelper.removeSecuredData(SharedPrefsConstant.token);
    await SharedPrefHelper.removeData(SharedPrefsConstant.type);
  }

  @override
  void onChange(Change<ProfileState> change) {
    print(change);
    super.onChange(change);
  }
}
