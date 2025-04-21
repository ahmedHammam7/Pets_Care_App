part of 'profile_cubit.dart';

@freezed
class ProfileState<T> with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading() = Loading;
  const factory ProfileState.success(T data) = Success;
  const factory ProfileState.error(String message) = Error;
  //upadte profile state
  const factory ProfileState.updateLoading() = UpdateLoading;
  const factory ProfileState.updateSuccess() = UpdateSuccess;
  const factory ProfileState.updateError(String message) = UpdateError;
}
