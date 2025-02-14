import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pets_care_app/core/network/api_error_model.dart';
part 'api_result.freezed.dart';

@Freezed()
abstract class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data) = Success<T>;
  const factory ApiResult.failure(ApiErrorModel error) = Failure<T>;
}
