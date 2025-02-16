part of 'profile_cubit.dart';

@freezed
class ProfileState<T> with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading() = Loading;
  const factory ProfileState.success(T data) = Success;
  const factory ProfileState.error(String message) = Error;
  //Doctor Profile
  const factory ProfileState.doctorLoading() = DoctorProfileLoading;
  const factory ProfileState.doctorSuccess(T data) = DoctorProfileSuccess;
  const factory ProfileState.doctorError(String message) = DoctorProfileError;
  //Store Profile
  const factory ProfileState.storeLoading() = StoreProfileLoading;
  const factory ProfileState.storeSuccess(T data) = StoreProfileSuccess;
  const factory ProfileState.storeError(String message) = StoreProfileError;
}
