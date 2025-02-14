// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegisterState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message) error,
    required TResult Function() registerLoadingDoctor,
    required TResult Function(T data) registerSuccessDoctor,
    required TResult Function(String message) registerErrorDoctor,
    required TResult Function() registerLoadingStore,
    required TResult Function(T data) registerSuccessStore,
    required TResult Function(String message) registerErrorStore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message)? error,
    TResult? Function()? registerLoadingDoctor,
    TResult? Function(T data)? registerSuccessDoctor,
    TResult? Function(String message)? registerErrorDoctor,
    TResult? Function()? registerLoadingStore,
    TResult? Function(T data)? registerSuccessStore,
    TResult? Function(String message)? registerErrorStore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message)? error,
    TResult Function()? registerLoadingDoctor,
    TResult Function(T data)? registerSuccessDoctor,
    TResult Function(String message)? registerErrorDoctor,
    TResult Function()? registerLoadingStore,
    TResult Function(T data)? registerSuccessStore,
    TResult Function(String message)? registerErrorStore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
    required TResult Function(RegisterLoadingDoctor<T> value)
        registerLoadingDoctor,
    required TResult Function(RegisterSuccessDoctor<T> value)
        registerSuccessDoctor,
    required TResult Function(RegisterErrorDoctor<T> value) registerErrorDoctor,
    required TResult Function(RegisterLoadingStore<T> value)
        registerLoadingStore,
    required TResult Function(RegisterSuccessStore<T> value)
        registerSuccessStore,
    required TResult Function(RegisterErrorStore<T> value) registerErrorStore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
    TResult? Function(RegisterLoadingDoctor<T> value)? registerLoadingDoctor,
    TResult? Function(RegisterSuccessDoctor<T> value)? registerSuccessDoctor,
    TResult? Function(RegisterErrorDoctor<T> value)? registerErrorDoctor,
    TResult? Function(RegisterLoadingStore<T> value)? registerLoadingStore,
    TResult? Function(RegisterSuccessStore<T> value)? registerSuccessStore,
    TResult? Function(RegisterErrorStore<T> value)? registerErrorStore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    TResult Function(RegisterLoadingDoctor<T> value)? registerLoadingDoctor,
    TResult Function(RegisterSuccessDoctor<T> value)? registerSuccessDoctor,
    TResult Function(RegisterErrorDoctor<T> value)? registerErrorDoctor,
    TResult Function(RegisterLoadingStore<T> value)? registerLoadingStore,
    TResult Function(RegisterSuccessStore<T> value)? registerSuccessStore,
    TResult Function(RegisterErrorStore<T> value)? registerErrorStore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterStateCopyWith<T, $Res> {
  factory $RegisterStateCopyWith(
          RegisterState<T> value, $Res Function(RegisterState<T>) then) =
      _$RegisterStateCopyWithImpl<T, $Res, RegisterState<T>>;
}

/// @nodoc
class _$RegisterStateCopyWithImpl<T, $Res, $Val extends RegisterState<T>>
    implements $RegisterStateCopyWith<T, $Res> {
  _$RegisterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<T, $Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl<T> value, $Res Function(_$InitialImpl<T>) then) =
      __$$InitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<T, $Res>
    extends _$RegisterStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
    implements _$$InitialImplCopyWith<T, $Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl<T> _value, $Res Function(_$InitialImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl<T> implements _Initial<T> {
  const _$InitialImpl();

  @override
  String toString() {
    return 'RegisterState<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message) error,
    required TResult Function() registerLoadingDoctor,
    required TResult Function(T data) registerSuccessDoctor,
    required TResult Function(String message) registerErrorDoctor,
    required TResult Function() registerLoadingStore,
    required TResult Function(T data) registerSuccessStore,
    required TResult Function(String message) registerErrorStore,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message)? error,
    TResult? Function()? registerLoadingDoctor,
    TResult? Function(T data)? registerSuccessDoctor,
    TResult? Function(String message)? registerErrorDoctor,
    TResult? Function()? registerLoadingStore,
    TResult? Function(T data)? registerSuccessStore,
    TResult? Function(String message)? registerErrorStore,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message)? error,
    TResult Function()? registerLoadingDoctor,
    TResult Function(T data)? registerSuccessDoctor,
    TResult Function(String message)? registerErrorDoctor,
    TResult Function()? registerLoadingStore,
    TResult Function(T data)? registerSuccessStore,
    TResult Function(String message)? registerErrorStore,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
    required TResult Function(RegisterLoadingDoctor<T> value)
        registerLoadingDoctor,
    required TResult Function(RegisterSuccessDoctor<T> value)
        registerSuccessDoctor,
    required TResult Function(RegisterErrorDoctor<T> value) registerErrorDoctor,
    required TResult Function(RegisterLoadingStore<T> value)
        registerLoadingStore,
    required TResult Function(RegisterSuccessStore<T> value)
        registerSuccessStore,
    required TResult Function(RegisterErrorStore<T> value) registerErrorStore,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
    TResult? Function(RegisterLoadingDoctor<T> value)? registerLoadingDoctor,
    TResult? Function(RegisterSuccessDoctor<T> value)? registerSuccessDoctor,
    TResult? Function(RegisterErrorDoctor<T> value)? registerErrorDoctor,
    TResult? Function(RegisterLoadingStore<T> value)? registerLoadingStore,
    TResult? Function(RegisterSuccessStore<T> value)? registerSuccessStore,
    TResult? Function(RegisterErrorStore<T> value)? registerErrorStore,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    TResult Function(RegisterLoadingDoctor<T> value)? registerLoadingDoctor,
    TResult Function(RegisterSuccessDoctor<T> value)? registerSuccessDoctor,
    TResult Function(RegisterErrorDoctor<T> value)? registerErrorDoctor,
    TResult Function(RegisterLoadingStore<T> value)? registerLoadingStore,
    TResult Function(RegisterSuccessStore<T> value)? registerSuccessStore,
    TResult Function(RegisterErrorStore<T> value)? registerErrorStore,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements RegisterState<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<T, $Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl<T> value, $Res Function(_$LoadingImpl<T>) then) =
      __$$LoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<T, $Res>
    extends _$RegisterStateCopyWithImpl<T, $Res, _$LoadingImpl<T>>
    implements _$$LoadingImplCopyWith<T, $Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl<T> _value, $Res Function(_$LoadingImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl<T> implements Loading<T> {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'RegisterState<$T>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message) error,
    required TResult Function() registerLoadingDoctor,
    required TResult Function(T data) registerSuccessDoctor,
    required TResult Function(String message) registerErrorDoctor,
    required TResult Function() registerLoadingStore,
    required TResult Function(T data) registerSuccessStore,
    required TResult Function(String message) registerErrorStore,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message)? error,
    TResult? Function()? registerLoadingDoctor,
    TResult? Function(T data)? registerSuccessDoctor,
    TResult? Function(String message)? registerErrorDoctor,
    TResult? Function()? registerLoadingStore,
    TResult? Function(T data)? registerSuccessStore,
    TResult? Function(String message)? registerErrorStore,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message)? error,
    TResult Function()? registerLoadingDoctor,
    TResult Function(T data)? registerSuccessDoctor,
    TResult Function(String message)? registerErrorDoctor,
    TResult Function()? registerLoadingStore,
    TResult Function(T data)? registerSuccessStore,
    TResult Function(String message)? registerErrorStore,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
    required TResult Function(RegisterLoadingDoctor<T> value)
        registerLoadingDoctor,
    required TResult Function(RegisterSuccessDoctor<T> value)
        registerSuccessDoctor,
    required TResult Function(RegisterErrorDoctor<T> value) registerErrorDoctor,
    required TResult Function(RegisterLoadingStore<T> value)
        registerLoadingStore,
    required TResult Function(RegisterSuccessStore<T> value)
        registerSuccessStore,
    required TResult Function(RegisterErrorStore<T> value) registerErrorStore,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
    TResult? Function(RegisterLoadingDoctor<T> value)? registerLoadingDoctor,
    TResult? Function(RegisterSuccessDoctor<T> value)? registerSuccessDoctor,
    TResult? Function(RegisterErrorDoctor<T> value)? registerErrorDoctor,
    TResult? Function(RegisterLoadingStore<T> value)? registerLoadingStore,
    TResult? Function(RegisterSuccessStore<T> value)? registerSuccessStore,
    TResult? Function(RegisterErrorStore<T> value)? registerErrorStore,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    TResult Function(RegisterLoadingDoctor<T> value)? registerLoadingDoctor,
    TResult Function(RegisterSuccessDoctor<T> value)? registerSuccessDoctor,
    TResult Function(RegisterErrorDoctor<T> value)? registerErrorDoctor,
    TResult Function(RegisterLoadingStore<T> value)? registerLoadingStore,
    TResult Function(RegisterSuccessStore<T> value)? registerSuccessStore,
    TResult Function(RegisterErrorStore<T> value)? registerErrorStore,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading<T> implements RegisterState<T> {
  const factory Loading() = _$LoadingImpl<T>;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<T, $Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl<T> value, $Res Function(_$SuccessImpl<T>) then) =
      __$$SuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<T, $Res>
    extends _$RegisterStateCopyWithImpl<T, $Res, _$SuccessImpl<T>>
    implements _$$SuccessImplCopyWith<T, $Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl<T> _value, $Res Function(_$SuccessImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$SuccessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$SuccessImpl<T> implements Success<T> {
  const _$SuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'RegisterState<$T>.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<T, _$SuccessImpl<T>> get copyWith =>
      __$$SuccessImplCopyWithImpl<T, _$SuccessImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message) error,
    required TResult Function() registerLoadingDoctor,
    required TResult Function(T data) registerSuccessDoctor,
    required TResult Function(String message) registerErrorDoctor,
    required TResult Function() registerLoadingStore,
    required TResult Function(T data) registerSuccessStore,
    required TResult Function(String message) registerErrorStore,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message)? error,
    TResult? Function()? registerLoadingDoctor,
    TResult? Function(T data)? registerSuccessDoctor,
    TResult? Function(String message)? registerErrorDoctor,
    TResult? Function()? registerLoadingStore,
    TResult? Function(T data)? registerSuccessStore,
    TResult? Function(String message)? registerErrorStore,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message)? error,
    TResult Function()? registerLoadingDoctor,
    TResult Function(T data)? registerSuccessDoctor,
    TResult Function(String message)? registerErrorDoctor,
    TResult Function()? registerLoadingStore,
    TResult Function(T data)? registerSuccessStore,
    TResult Function(String message)? registerErrorStore,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
    required TResult Function(RegisterLoadingDoctor<T> value)
        registerLoadingDoctor,
    required TResult Function(RegisterSuccessDoctor<T> value)
        registerSuccessDoctor,
    required TResult Function(RegisterErrorDoctor<T> value) registerErrorDoctor,
    required TResult Function(RegisterLoadingStore<T> value)
        registerLoadingStore,
    required TResult Function(RegisterSuccessStore<T> value)
        registerSuccessStore,
    required TResult Function(RegisterErrorStore<T> value) registerErrorStore,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
    TResult? Function(RegisterLoadingDoctor<T> value)? registerLoadingDoctor,
    TResult? Function(RegisterSuccessDoctor<T> value)? registerSuccessDoctor,
    TResult? Function(RegisterErrorDoctor<T> value)? registerErrorDoctor,
    TResult? Function(RegisterLoadingStore<T> value)? registerLoadingStore,
    TResult? Function(RegisterSuccessStore<T> value)? registerSuccessStore,
    TResult? Function(RegisterErrorStore<T> value)? registerErrorStore,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    TResult Function(RegisterLoadingDoctor<T> value)? registerLoadingDoctor,
    TResult Function(RegisterSuccessDoctor<T> value)? registerSuccessDoctor,
    TResult Function(RegisterErrorDoctor<T> value)? registerErrorDoctor,
    TResult Function(RegisterLoadingStore<T> value)? registerLoadingStore,
    TResult Function(RegisterSuccessStore<T> value)? registerSuccessStore,
    TResult Function(RegisterErrorStore<T> value)? registerErrorStore,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success<T> implements RegisterState<T> {
  const factory Success(final T data) = _$SuccessImpl<T>;

  T get data;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<T, _$SuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<T, $Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl<T> value, $Res Function(_$ErrorImpl<T>) then) =
      __$$ErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<T, $Res>
    extends _$RegisterStateCopyWithImpl<T, $Res, _$ErrorImpl<T>>
    implements _$$ErrorImplCopyWith<T, $Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl<T> _value, $Res Function(_$ErrorImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl<T>(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl<T> implements Error<T> {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'RegisterState<$T>.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<T, _$ErrorImpl<T>> get copyWith =>
      __$$ErrorImplCopyWithImpl<T, _$ErrorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message) error,
    required TResult Function() registerLoadingDoctor,
    required TResult Function(T data) registerSuccessDoctor,
    required TResult Function(String message) registerErrorDoctor,
    required TResult Function() registerLoadingStore,
    required TResult Function(T data) registerSuccessStore,
    required TResult Function(String message) registerErrorStore,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message)? error,
    TResult? Function()? registerLoadingDoctor,
    TResult? Function(T data)? registerSuccessDoctor,
    TResult? Function(String message)? registerErrorDoctor,
    TResult? Function()? registerLoadingStore,
    TResult? Function(T data)? registerSuccessStore,
    TResult? Function(String message)? registerErrorStore,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message)? error,
    TResult Function()? registerLoadingDoctor,
    TResult Function(T data)? registerSuccessDoctor,
    TResult Function(String message)? registerErrorDoctor,
    TResult Function()? registerLoadingStore,
    TResult Function(T data)? registerSuccessStore,
    TResult Function(String message)? registerErrorStore,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
    required TResult Function(RegisterLoadingDoctor<T> value)
        registerLoadingDoctor,
    required TResult Function(RegisterSuccessDoctor<T> value)
        registerSuccessDoctor,
    required TResult Function(RegisterErrorDoctor<T> value) registerErrorDoctor,
    required TResult Function(RegisterLoadingStore<T> value)
        registerLoadingStore,
    required TResult Function(RegisterSuccessStore<T> value)
        registerSuccessStore,
    required TResult Function(RegisterErrorStore<T> value) registerErrorStore,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
    TResult? Function(RegisterLoadingDoctor<T> value)? registerLoadingDoctor,
    TResult? Function(RegisterSuccessDoctor<T> value)? registerSuccessDoctor,
    TResult? Function(RegisterErrorDoctor<T> value)? registerErrorDoctor,
    TResult? Function(RegisterLoadingStore<T> value)? registerLoadingStore,
    TResult? Function(RegisterSuccessStore<T> value)? registerSuccessStore,
    TResult? Function(RegisterErrorStore<T> value)? registerErrorStore,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    TResult Function(RegisterLoadingDoctor<T> value)? registerLoadingDoctor,
    TResult Function(RegisterSuccessDoctor<T> value)? registerSuccessDoctor,
    TResult Function(RegisterErrorDoctor<T> value)? registerErrorDoctor,
    TResult Function(RegisterLoadingStore<T> value)? registerLoadingStore,
    TResult Function(RegisterSuccessStore<T> value)? registerSuccessStore,
    TResult Function(RegisterErrorStore<T> value)? registerErrorStore,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error<T> implements RegisterState<T> {
  const factory Error(final String message) = _$ErrorImpl<T>;

  String get message;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<T, _$ErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisterLoadingDoctorImplCopyWith<T, $Res> {
  factory _$$RegisterLoadingDoctorImplCopyWith(
          _$RegisterLoadingDoctorImpl<T> value,
          $Res Function(_$RegisterLoadingDoctorImpl<T>) then) =
      __$$RegisterLoadingDoctorImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$RegisterLoadingDoctorImplCopyWithImpl<T, $Res>
    extends _$RegisterStateCopyWithImpl<T, $Res, _$RegisterLoadingDoctorImpl<T>>
    implements _$$RegisterLoadingDoctorImplCopyWith<T, $Res> {
  __$$RegisterLoadingDoctorImplCopyWithImpl(
      _$RegisterLoadingDoctorImpl<T> _value,
      $Res Function(_$RegisterLoadingDoctorImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RegisterLoadingDoctorImpl<T> implements RegisterLoadingDoctor<T> {
  const _$RegisterLoadingDoctorImpl();

  @override
  String toString() {
    return 'RegisterState<$T>.registerLoadingDoctor()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterLoadingDoctorImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message) error,
    required TResult Function() registerLoadingDoctor,
    required TResult Function(T data) registerSuccessDoctor,
    required TResult Function(String message) registerErrorDoctor,
    required TResult Function() registerLoadingStore,
    required TResult Function(T data) registerSuccessStore,
    required TResult Function(String message) registerErrorStore,
  }) {
    return registerLoadingDoctor();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message)? error,
    TResult? Function()? registerLoadingDoctor,
    TResult? Function(T data)? registerSuccessDoctor,
    TResult? Function(String message)? registerErrorDoctor,
    TResult? Function()? registerLoadingStore,
    TResult? Function(T data)? registerSuccessStore,
    TResult? Function(String message)? registerErrorStore,
  }) {
    return registerLoadingDoctor?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message)? error,
    TResult Function()? registerLoadingDoctor,
    TResult Function(T data)? registerSuccessDoctor,
    TResult Function(String message)? registerErrorDoctor,
    TResult Function()? registerLoadingStore,
    TResult Function(T data)? registerSuccessStore,
    TResult Function(String message)? registerErrorStore,
    required TResult orElse(),
  }) {
    if (registerLoadingDoctor != null) {
      return registerLoadingDoctor();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
    required TResult Function(RegisterLoadingDoctor<T> value)
        registerLoadingDoctor,
    required TResult Function(RegisterSuccessDoctor<T> value)
        registerSuccessDoctor,
    required TResult Function(RegisterErrorDoctor<T> value) registerErrorDoctor,
    required TResult Function(RegisterLoadingStore<T> value)
        registerLoadingStore,
    required TResult Function(RegisterSuccessStore<T> value)
        registerSuccessStore,
    required TResult Function(RegisterErrorStore<T> value) registerErrorStore,
  }) {
    return registerLoadingDoctor(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
    TResult? Function(RegisterLoadingDoctor<T> value)? registerLoadingDoctor,
    TResult? Function(RegisterSuccessDoctor<T> value)? registerSuccessDoctor,
    TResult? Function(RegisterErrorDoctor<T> value)? registerErrorDoctor,
    TResult? Function(RegisterLoadingStore<T> value)? registerLoadingStore,
    TResult? Function(RegisterSuccessStore<T> value)? registerSuccessStore,
    TResult? Function(RegisterErrorStore<T> value)? registerErrorStore,
  }) {
    return registerLoadingDoctor?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    TResult Function(RegisterLoadingDoctor<T> value)? registerLoadingDoctor,
    TResult Function(RegisterSuccessDoctor<T> value)? registerSuccessDoctor,
    TResult Function(RegisterErrorDoctor<T> value)? registerErrorDoctor,
    TResult Function(RegisterLoadingStore<T> value)? registerLoadingStore,
    TResult Function(RegisterSuccessStore<T> value)? registerSuccessStore,
    TResult Function(RegisterErrorStore<T> value)? registerErrorStore,
    required TResult orElse(),
  }) {
    if (registerLoadingDoctor != null) {
      return registerLoadingDoctor(this);
    }
    return orElse();
  }
}

abstract class RegisterLoadingDoctor<T> implements RegisterState<T> {
  const factory RegisterLoadingDoctor() = _$RegisterLoadingDoctorImpl<T>;
}

/// @nodoc
abstract class _$$RegisterSuccessDoctorImplCopyWith<T, $Res> {
  factory _$$RegisterSuccessDoctorImplCopyWith(
          _$RegisterSuccessDoctorImpl<T> value,
          $Res Function(_$RegisterSuccessDoctorImpl<T>) then) =
      __$$RegisterSuccessDoctorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$RegisterSuccessDoctorImplCopyWithImpl<T, $Res>
    extends _$RegisterStateCopyWithImpl<T, $Res, _$RegisterSuccessDoctorImpl<T>>
    implements _$$RegisterSuccessDoctorImplCopyWith<T, $Res> {
  __$$RegisterSuccessDoctorImplCopyWithImpl(
      _$RegisterSuccessDoctorImpl<T> _value,
      $Res Function(_$RegisterSuccessDoctorImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$RegisterSuccessDoctorImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$RegisterSuccessDoctorImpl<T> implements RegisterSuccessDoctor<T> {
  const _$RegisterSuccessDoctorImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'RegisterState<$T>.registerSuccessDoctor(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterSuccessDoctorImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterSuccessDoctorImplCopyWith<T, _$RegisterSuccessDoctorImpl<T>>
      get copyWith => __$$RegisterSuccessDoctorImplCopyWithImpl<T,
          _$RegisterSuccessDoctorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message) error,
    required TResult Function() registerLoadingDoctor,
    required TResult Function(T data) registerSuccessDoctor,
    required TResult Function(String message) registerErrorDoctor,
    required TResult Function() registerLoadingStore,
    required TResult Function(T data) registerSuccessStore,
    required TResult Function(String message) registerErrorStore,
  }) {
    return registerSuccessDoctor(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message)? error,
    TResult? Function()? registerLoadingDoctor,
    TResult? Function(T data)? registerSuccessDoctor,
    TResult? Function(String message)? registerErrorDoctor,
    TResult? Function()? registerLoadingStore,
    TResult? Function(T data)? registerSuccessStore,
    TResult? Function(String message)? registerErrorStore,
  }) {
    return registerSuccessDoctor?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message)? error,
    TResult Function()? registerLoadingDoctor,
    TResult Function(T data)? registerSuccessDoctor,
    TResult Function(String message)? registerErrorDoctor,
    TResult Function()? registerLoadingStore,
    TResult Function(T data)? registerSuccessStore,
    TResult Function(String message)? registerErrorStore,
    required TResult orElse(),
  }) {
    if (registerSuccessDoctor != null) {
      return registerSuccessDoctor(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
    required TResult Function(RegisterLoadingDoctor<T> value)
        registerLoadingDoctor,
    required TResult Function(RegisterSuccessDoctor<T> value)
        registerSuccessDoctor,
    required TResult Function(RegisterErrorDoctor<T> value) registerErrorDoctor,
    required TResult Function(RegisterLoadingStore<T> value)
        registerLoadingStore,
    required TResult Function(RegisterSuccessStore<T> value)
        registerSuccessStore,
    required TResult Function(RegisterErrorStore<T> value) registerErrorStore,
  }) {
    return registerSuccessDoctor(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
    TResult? Function(RegisterLoadingDoctor<T> value)? registerLoadingDoctor,
    TResult? Function(RegisterSuccessDoctor<T> value)? registerSuccessDoctor,
    TResult? Function(RegisterErrorDoctor<T> value)? registerErrorDoctor,
    TResult? Function(RegisterLoadingStore<T> value)? registerLoadingStore,
    TResult? Function(RegisterSuccessStore<T> value)? registerSuccessStore,
    TResult? Function(RegisterErrorStore<T> value)? registerErrorStore,
  }) {
    return registerSuccessDoctor?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    TResult Function(RegisterLoadingDoctor<T> value)? registerLoadingDoctor,
    TResult Function(RegisterSuccessDoctor<T> value)? registerSuccessDoctor,
    TResult Function(RegisterErrorDoctor<T> value)? registerErrorDoctor,
    TResult Function(RegisterLoadingStore<T> value)? registerLoadingStore,
    TResult Function(RegisterSuccessStore<T> value)? registerSuccessStore,
    TResult Function(RegisterErrorStore<T> value)? registerErrorStore,
    required TResult orElse(),
  }) {
    if (registerSuccessDoctor != null) {
      return registerSuccessDoctor(this);
    }
    return orElse();
  }
}

abstract class RegisterSuccessDoctor<T> implements RegisterState<T> {
  const factory RegisterSuccessDoctor(final T data) =
      _$RegisterSuccessDoctorImpl<T>;

  T get data;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterSuccessDoctorImplCopyWith<T, _$RegisterSuccessDoctorImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisterErrorDoctorImplCopyWith<T, $Res> {
  factory _$$RegisterErrorDoctorImplCopyWith(_$RegisterErrorDoctorImpl<T> value,
          $Res Function(_$RegisterErrorDoctorImpl<T>) then) =
      __$$RegisterErrorDoctorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$RegisterErrorDoctorImplCopyWithImpl<T, $Res>
    extends _$RegisterStateCopyWithImpl<T, $Res, _$RegisterErrorDoctorImpl<T>>
    implements _$$RegisterErrorDoctorImplCopyWith<T, $Res> {
  __$$RegisterErrorDoctorImplCopyWithImpl(_$RegisterErrorDoctorImpl<T> _value,
      $Res Function(_$RegisterErrorDoctorImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$RegisterErrorDoctorImpl<T>(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RegisterErrorDoctorImpl<T> implements RegisterErrorDoctor<T> {
  const _$RegisterErrorDoctorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'RegisterState<$T>.registerErrorDoctor(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterErrorDoctorImpl<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterErrorDoctorImplCopyWith<T, _$RegisterErrorDoctorImpl<T>>
      get copyWith => __$$RegisterErrorDoctorImplCopyWithImpl<T,
          _$RegisterErrorDoctorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message) error,
    required TResult Function() registerLoadingDoctor,
    required TResult Function(T data) registerSuccessDoctor,
    required TResult Function(String message) registerErrorDoctor,
    required TResult Function() registerLoadingStore,
    required TResult Function(T data) registerSuccessStore,
    required TResult Function(String message) registerErrorStore,
  }) {
    return registerErrorDoctor(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message)? error,
    TResult? Function()? registerLoadingDoctor,
    TResult? Function(T data)? registerSuccessDoctor,
    TResult? Function(String message)? registerErrorDoctor,
    TResult? Function()? registerLoadingStore,
    TResult? Function(T data)? registerSuccessStore,
    TResult? Function(String message)? registerErrorStore,
  }) {
    return registerErrorDoctor?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message)? error,
    TResult Function()? registerLoadingDoctor,
    TResult Function(T data)? registerSuccessDoctor,
    TResult Function(String message)? registerErrorDoctor,
    TResult Function()? registerLoadingStore,
    TResult Function(T data)? registerSuccessStore,
    TResult Function(String message)? registerErrorStore,
    required TResult orElse(),
  }) {
    if (registerErrorDoctor != null) {
      return registerErrorDoctor(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
    required TResult Function(RegisterLoadingDoctor<T> value)
        registerLoadingDoctor,
    required TResult Function(RegisterSuccessDoctor<T> value)
        registerSuccessDoctor,
    required TResult Function(RegisterErrorDoctor<T> value) registerErrorDoctor,
    required TResult Function(RegisterLoadingStore<T> value)
        registerLoadingStore,
    required TResult Function(RegisterSuccessStore<T> value)
        registerSuccessStore,
    required TResult Function(RegisterErrorStore<T> value) registerErrorStore,
  }) {
    return registerErrorDoctor(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
    TResult? Function(RegisterLoadingDoctor<T> value)? registerLoadingDoctor,
    TResult? Function(RegisterSuccessDoctor<T> value)? registerSuccessDoctor,
    TResult? Function(RegisterErrorDoctor<T> value)? registerErrorDoctor,
    TResult? Function(RegisterLoadingStore<T> value)? registerLoadingStore,
    TResult? Function(RegisterSuccessStore<T> value)? registerSuccessStore,
    TResult? Function(RegisterErrorStore<T> value)? registerErrorStore,
  }) {
    return registerErrorDoctor?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    TResult Function(RegisterLoadingDoctor<T> value)? registerLoadingDoctor,
    TResult Function(RegisterSuccessDoctor<T> value)? registerSuccessDoctor,
    TResult Function(RegisterErrorDoctor<T> value)? registerErrorDoctor,
    TResult Function(RegisterLoadingStore<T> value)? registerLoadingStore,
    TResult Function(RegisterSuccessStore<T> value)? registerSuccessStore,
    TResult Function(RegisterErrorStore<T> value)? registerErrorStore,
    required TResult orElse(),
  }) {
    if (registerErrorDoctor != null) {
      return registerErrorDoctor(this);
    }
    return orElse();
  }
}

abstract class RegisterErrorDoctor<T> implements RegisterState<T> {
  const factory RegisterErrorDoctor(final String message) =
      _$RegisterErrorDoctorImpl<T>;

  String get message;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterErrorDoctorImplCopyWith<T, _$RegisterErrorDoctorImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisterLoadingStoreImplCopyWith<T, $Res> {
  factory _$$RegisterLoadingStoreImplCopyWith(
          _$RegisterLoadingStoreImpl<T> value,
          $Res Function(_$RegisterLoadingStoreImpl<T>) then) =
      __$$RegisterLoadingStoreImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$RegisterLoadingStoreImplCopyWithImpl<T, $Res>
    extends _$RegisterStateCopyWithImpl<T, $Res, _$RegisterLoadingStoreImpl<T>>
    implements _$$RegisterLoadingStoreImplCopyWith<T, $Res> {
  __$$RegisterLoadingStoreImplCopyWithImpl(_$RegisterLoadingStoreImpl<T> _value,
      $Res Function(_$RegisterLoadingStoreImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RegisterLoadingStoreImpl<T> implements RegisterLoadingStore<T> {
  const _$RegisterLoadingStoreImpl();

  @override
  String toString() {
    return 'RegisterState<$T>.registerLoadingStore()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterLoadingStoreImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message) error,
    required TResult Function() registerLoadingDoctor,
    required TResult Function(T data) registerSuccessDoctor,
    required TResult Function(String message) registerErrorDoctor,
    required TResult Function() registerLoadingStore,
    required TResult Function(T data) registerSuccessStore,
    required TResult Function(String message) registerErrorStore,
  }) {
    return registerLoadingStore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message)? error,
    TResult? Function()? registerLoadingDoctor,
    TResult? Function(T data)? registerSuccessDoctor,
    TResult? Function(String message)? registerErrorDoctor,
    TResult? Function()? registerLoadingStore,
    TResult? Function(T data)? registerSuccessStore,
    TResult? Function(String message)? registerErrorStore,
  }) {
    return registerLoadingStore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message)? error,
    TResult Function()? registerLoadingDoctor,
    TResult Function(T data)? registerSuccessDoctor,
    TResult Function(String message)? registerErrorDoctor,
    TResult Function()? registerLoadingStore,
    TResult Function(T data)? registerSuccessStore,
    TResult Function(String message)? registerErrorStore,
    required TResult orElse(),
  }) {
    if (registerLoadingStore != null) {
      return registerLoadingStore();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
    required TResult Function(RegisterLoadingDoctor<T> value)
        registerLoadingDoctor,
    required TResult Function(RegisterSuccessDoctor<T> value)
        registerSuccessDoctor,
    required TResult Function(RegisterErrorDoctor<T> value) registerErrorDoctor,
    required TResult Function(RegisterLoadingStore<T> value)
        registerLoadingStore,
    required TResult Function(RegisterSuccessStore<T> value)
        registerSuccessStore,
    required TResult Function(RegisterErrorStore<T> value) registerErrorStore,
  }) {
    return registerLoadingStore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
    TResult? Function(RegisterLoadingDoctor<T> value)? registerLoadingDoctor,
    TResult? Function(RegisterSuccessDoctor<T> value)? registerSuccessDoctor,
    TResult? Function(RegisterErrorDoctor<T> value)? registerErrorDoctor,
    TResult? Function(RegisterLoadingStore<T> value)? registerLoadingStore,
    TResult? Function(RegisterSuccessStore<T> value)? registerSuccessStore,
    TResult? Function(RegisterErrorStore<T> value)? registerErrorStore,
  }) {
    return registerLoadingStore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    TResult Function(RegisterLoadingDoctor<T> value)? registerLoadingDoctor,
    TResult Function(RegisterSuccessDoctor<T> value)? registerSuccessDoctor,
    TResult Function(RegisterErrorDoctor<T> value)? registerErrorDoctor,
    TResult Function(RegisterLoadingStore<T> value)? registerLoadingStore,
    TResult Function(RegisterSuccessStore<T> value)? registerSuccessStore,
    TResult Function(RegisterErrorStore<T> value)? registerErrorStore,
    required TResult orElse(),
  }) {
    if (registerLoadingStore != null) {
      return registerLoadingStore(this);
    }
    return orElse();
  }
}

abstract class RegisterLoadingStore<T> implements RegisterState<T> {
  const factory RegisterLoadingStore() = _$RegisterLoadingStoreImpl<T>;
}

/// @nodoc
abstract class _$$RegisterSuccessStoreImplCopyWith<T, $Res> {
  factory _$$RegisterSuccessStoreImplCopyWith(
          _$RegisterSuccessStoreImpl<T> value,
          $Res Function(_$RegisterSuccessStoreImpl<T>) then) =
      __$$RegisterSuccessStoreImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$RegisterSuccessStoreImplCopyWithImpl<T, $Res>
    extends _$RegisterStateCopyWithImpl<T, $Res, _$RegisterSuccessStoreImpl<T>>
    implements _$$RegisterSuccessStoreImplCopyWith<T, $Res> {
  __$$RegisterSuccessStoreImplCopyWithImpl(_$RegisterSuccessStoreImpl<T> _value,
      $Res Function(_$RegisterSuccessStoreImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$RegisterSuccessStoreImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$RegisterSuccessStoreImpl<T> implements RegisterSuccessStore<T> {
  const _$RegisterSuccessStoreImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'RegisterState<$T>.registerSuccessStore(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterSuccessStoreImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterSuccessStoreImplCopyWith<T, _$RegisterSuccessStoreImpl<T>>
      get copyWith => __$$RegisterSuccessStoreImplCopyWithImpl<T,
          _$RegisterSuccessStoreImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message) error,
    required TResult Function() registerLoadingDoctor,
    required TResult Function(T data) registerSuccessDoctor,
    required TResult Function(String message) registerErrorDoctor,
    required TResult Function() registerLoadingStore,
    required TResult Function(T data) registerSuccessStore,
    required TResult Function(String message) registerErrorStore,
  }) {
    return registerSuccessStore(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message)? error,
    TResult? Function()? registerLoadingDoctor,
    TResult? Function(T data)? registerSuccessDoctor,
    TResult? Function(String message)? registerErrorDoctor,
    TResult? Function()? registerLoadingStore,
    TResult? Function(T data)? registerSuccessStore,
    TResult? Function(String message)? registerErrorStore,
  }) {
    return registerSuccessStore?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message)? error,
    TResult Function()? registerLoadingDoctor,
    TResult Function(T data)? registerSuccessDoctor,
    TResult Function(String message)? registerErrorDoctor,
    TResult Function()? registerLoadingStore,
    TResult Function(T data)? registerSuccessStore,
    TResult Function(String message)? registerErrorStore,
    required TResult orElse(),
  }) {
    if (registerSuccessStore != null) {
      return registerSuccessStore(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
    required TResult Function(RegisterLoadingDoctor<T> value)
        registerLoadingDoctor,
    required TResult Function(RegisterSuccessDoctor<T> value)
        registerSuccessDoctor,
    required TResult Function(RegisterErrorDoctor<T> value) registerErrorDoctor,
    required TResult Function(RegisterLoadingStore<T> value)
        registerLoadingStore,
    required TResult Function(RegisterSuccessStore<T> value)
        registerSuccessStore,
    required TResult Function(RegisterErrorStore<T> value) registerErrorStore,
  }) {
    return registerSuccessStore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
    TResult? Function(RegisterLoadingDoctor<T> value)? registerLoadingDoctor,
    TResult? Function(RegisterSuccessDoctor<T> value)? registerSuccessDoctor,
    TResult? Function(RegisterErrorDoctor<T> value)? registerErrorDoctor,
    TResult? Function(RegisterLoadingStore<T> value)? registerLoadingStore,
    TResult? Function(RegisterSuccessStore<T> value)? registerSuccessStore,
    TResult? Function(RegisterErrorStore<T> value)? registerErrorStore,
  }) {
    return registerSuccessStore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    TResult Function(RegisterLoadingDoctor<T> value)? registerLoadingDoctor,
    TResult Function(RegisterSuccessDoctor<T> value)? registerSuccessDoctor,
    TResult Function(RegisterErrorDoctor<T> value)? registerErrorDoctor,
    TResult Function(RegisterLoadingStore<T> value)? registerLoadingStore,
    TResult Function(RegisterSuccessStore<T> value)? registerSuccessStore,
    TResult Function(RegisterErrorStore<T> value)? registerErrorStore,
    required TResult orElse(),
  }) {
    if (registerSuccessStore != null) {
      return registerSuccessStore(this);
    }
    return orElse();
  }
}

abstract class RegisterSuccessStore<T> implements RegisterState<T> {
  const factory RegisterSuccessStore(final T data) =
      _$RegisterSuccessStoreImpl<T>;

  T get data;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterSuccessStoreImplCopyWith<T, _$RegisterSuccessStoreImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisterErrorStoreImplCopyWith<T, $Res> {
  factory _$$RegisterErrorStoreImplCopyWith(_$RegisterErrorStoreImpl<T> value,
          $Res Function(_$RegisterErrorStoreImpl<T>) then) =
      __$$RegisterErrorStoreImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$RegisterErrorStoreImplCopyWithImpl<T, $Res>
    extends _$RegisterStateCopyWithImpl<T, $Res, _$RegisterErrorStoreImpl<T>>
    implements _$$RegisterErrorStoreImplCopyWith<T, $Res> {
  __$$RegisterErrorStoreImplCopyWithImpl(_$RegisterErrorStoreImpl<T> _value,
      $Res Function(_$RegisterErrorStoreImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$RegisterErrorStoreImpl<T>(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RegisterErrorStoreImpl<T> implements RegisterErrorStore<T> {
  const _$RegisterErrorStoreImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'RegisterState<$T>.registerErrorStore(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterErrorStoreImpl<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterErrorStoreImplCopyWith<T, _$RegisterErrorStoreImpl<T>>
      get copyWith => __$$RegisterErrorStoreImplCopyWithImpl<T,
          _$RegisterErrorStoreImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message) error,
    required TResult Function() registerLoadingDoctor,
    required TResult Function(T data) registerSuccessDoctor,
    required TResult Function(String message) registerErrorDoctor,
    required TResult Function() registerLoadingStore,
    required TResult Function(T data) registerSuccessStore,
    required TResult Function(String message) registerErrorStore,
  }) {
    return registerErrorStore(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message)? error,
    TResult? Function()? registerLoadingDoctor,
    TResult? Function(T data)? registerSuccessDoctor,
    TResult? Function(String message)? registerErrorDoctor,
    TResult? Function()? registerLoadingStore,
    TResult? Function(T data)? registerSuccessStore,
    TResult? Function(String message)? registerErrorStore,
  }) {
    return registerErrorStore?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message)? error,
    TResult Function()? registerLoadingDoctor,
    TResult Function(T data)? registerSuccessDoctor,
    TResult Function(String message)? registerErrorDoctor,
    TResult Function()? registerLoadingStore,
    TResult Function(T data)? registerSuccessStore,
    TResult Function(String message)? registerErrorStore,
    required TResult orElse(),
  }) {
    if (registerErrorStore != null) {
      return registerErrorStore(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
    required TResult Function(RegisterLoadingDoctor<T> value)
        registerLoadingDoctor,
    required TResult Function(RegisterSuccessDoctor<T> value)
        registerSuccessDoctor,
    required TResult Function(RegisterErrorDoctor<T> value) registerErrorDoctor,
    required TResult Function(RegisterLoadingStore<T> value)
        registerLoadingStore,
    required TResult Function(RegisterSuccessStore<T> value)
        registerSuccessStore,
    required TResult Function(RegisterErrorStore<T> value) registerErrorStore,
  }) {
    return registerErrorStore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
    TResult? Function(RegisterLoadingDoctor<T> value)? registerLoadingDoctor,
    TResult? Function(RegisterSuccessDoctor<T> value)? registerSuccessDoctor,
    TResult? Function(RegisterErrorDoctor<T> value)? registerErrorDoctor,
    TResult? Function(RegisterLoadingStore<T> value)? registerLoadingStore,
    TResult? Function(RegisterSuccessStore<T> value)? registerSuccessStore,
    TResult? Function(RegisterErrorStore<T> value)? registerErrorStore,
  }) {
    return registerErrorStore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    TResult Function(RegisterLoadingDoctor<T> value)? registerLoadingDoctor,
    TResult Function(RegisterSuccessDoctor<T> value)? registerSuccessDoctor,
    TResult Function(RegisterErrorDoctor<T> value)? registerErrorDoctor,
    TResult Function(RegisterLoadingStore<T> value)? registerLoadingStore,
    TResult Function(RegisterSuccessStore<T> value)? registerSuccessStore,
    TResult Function(RegisterErrorStore<T> value)? registerErrorStore,
    required TResult orElse(),
  }) {
    if (registerErrorStore != null) {
      return registerErrorStore(this);
    }
    return orElse();
  }
}

abstract class RegisterErrorStore<T> implements RegisterState<T> {
  const factory RegisterErrorStore(final String message) =
      _$RegisterErrorStoreImpl<T>;

  String get message;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterErrorStoreImplCopyWith<T, _$RegisterErrorStoreImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}
