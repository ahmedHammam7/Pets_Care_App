part of 'check_cubit.dart';

@freezed
class CheckState with _$CheckState {
  const factory CheckState.initial() = _Initial;
  const factory CheckState.loading() = Loading;
  const factory CheckState.success(PredictResponse data) = Success;
  const factory CheckState.error(String message) = Error;
}
