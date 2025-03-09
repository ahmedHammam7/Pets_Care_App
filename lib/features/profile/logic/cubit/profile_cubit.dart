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
  Future<void> loadUserProfile() async {
    emit(const ProfileState.loading());

    final result = await profileRepo.getUserProfile();
    result.when(
      success: (response) {
        emit(ProfileState.success(response));
      },
      failure: (message) {
        emit(ProfileState.error(message.getAllErrorMessages()));
      },
    );
  }

  Future<void> loadDoctorProfile() async {
    emit(const ProfileState.doctorLoading());
    final result = await profileRepo.getDoctorProfile();
    result.when(
      success: (response) {
        emit(ProfileState.doctorSuccess(response));
      },
      failure: (message) {
        emit(ProfileState.doctorError(message.getAllErrorMessages()));
      },
    );
  }

  Future<void> loadStoreProfile() async {
    emit(const ProfileState.storeLoading());

    final result = await profileRepo.getStoreProfile();
    result.when(
      success: (response) {
        emit(ProfileState.storeSuccess(response));
      },
      failure: (message) {
        emit(ProfileState.storeError(message.getAllErrorMessages()));
      },
    );
  }

  Future<void> selectWhichProfile() async {
    if (await SharedPrefHelper.getString(SharedPrefsConstant.type) ==
        "doctor") {
      await loadDoctorProfile();
    } else if (await SharedPrefHelper.getString(SharedPrefsConstant.type) ==
        "owner") {
      await loadUserProfile();
    } else if (await SharedPrefHelper.getString(SharedPrefsConstant.type) ==
        "store") {
      await loadStoreProfile();
    }
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
