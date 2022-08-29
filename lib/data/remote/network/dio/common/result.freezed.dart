// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ResultTearOff {
  const _$ResultTearOff();

  Success<T, R> success<T, R>(T data) {
    return Success<T, R>(
      data,
    );
  }

  Error<T, R> error<T, R>(R data) {
    return Error<T, R>(
      data,
    );
  }
}

/// @nodoc
const $Result = _$ResultTearOff();

/// @nodoc
mixin _$Result<T, R> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(R data) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(R data)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(R data)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T, R> value) success,
    required TResult Function(Error<T, R> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Success<T, R> value)? success,
    TResult Function(Error<T, R> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T, R> value)? success,
    TResult Function(Error<T, R> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCopyWith<T, R, $Res> {
  factory $ResultCopyWith(
          Result<T, R> value, $Res Function(Result<T, R>) then) =
      _$ResultCopyWithImpl<T, R, $Res>;
}

/// @nodoc
class _$ResultCopyWithImpl<T, R, $Res> implements $ResultCopyWith<T, R, $Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  final Result<T, R> _value;
  // ignore: unused_field
  final $Res Function(Result<T, R>) _then;
}

/// @nodoc
abstract class $SuccessCopyWith<T, R, $Res> {
  factory $SuccessCopyWith(
          Success<T, R> value, $Res Function(Success<T, R>) then) =
      _$SuccessCopyWithImpl<T, R, $Res>;
  $Res call({T data});
}

/// @nodoc
class _$SuccessCopyWithImpl<T, R, $Res> extends _$ResultCopyWithImpl<T, R, $Res>
    implements $SuccessCopyWith<T, R, $Res> {
  _$SuccessCopyWithImpl(
      Success<T, R> _value, $Res Function(Success<T, R>) _then)
      : super(_value, (v) => _then(v as Success<T, R>));

  @override
  Success<T, R> get _value => super._value as Success<T, R>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(Success<T, R>(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$Success<T, R> implements Success<T, R> {
  const _$Success(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'Result<$T, $R>.success(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Success<T, R> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  $SuccessCopyWith<T, R, Success<T, R>> get copyWith =>
      _$SuccessCopyWithImpl<T, R, Success<T, R>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(R data) error,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(R data)? error,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(R data)? error,
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
    required TResult Function(Success<T, R> value) success,
    required TResult Function(Error<T, R> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Success<T, R> value)? success,
    TResult Function(Error<T, R> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T, R> value)? success,
    TResult Function(Error<T, R> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success<T, R> implements Result<T, R> {
  const factory Success(T data) = _$Success<T, R>;

  T get data;
  @JsonKey(ignore: true)
  $SuccessCopyWith<T, R, Success<T, R>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorCopyWith<T, R, $Res> {
  factory $ErrorCopyWith(Error<T, R> value, $Res Function(Error<T, R>) then) =
      _$ErrorCopyWithImpl<T, R, $Res>;
  $Res call({R data});
}

/// @nodoc
class _$ErrorCopyWithImpl<T, R, $Res> extends _$ResultCopyWithImpl<T, R, $Res>
    implements $ErrorCopyWith<T, R, $Res> {
  _$ErrorCopyWithImpl(Error<T, R> _value, $Res Function(Error<T, R>) _then)
      : super(_value, (v) => _then(v as Error<T, R>));

  @override
  Error<T, R> get _value => super._value as Error<T, R>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(Error<T, R>(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as R,
    ));
  }
}

/// @nodoc

class _$Error<T, R> implements Error<T, R> {
  const _$Error(this.data);

  @override
  final R data;

  @override
  String toString() {
    return 'Result<$T, $R>.error(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Error<T, R> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  $ErrorCopyWith<T, R, Error<T, R>> get copyWith =>
      _$ErrorCopyWithImpl<T, R, Error<T, R>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(R data) error,
  }) {
    return error(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(R data)? error,
  }) {
    return error?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(R data)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T, R> value) success,
    required TResult Function(Error<T, R> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Success<T, R> value)? success,
    TResult Function(Error<T, R> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T, R> value)? success,
    TResult Function(Error<T, R> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error<T, R> implements Result<T, R> {
  const factory Error(R data) = _$Error<T, R>;

  R get data;
  @JsonKey(ignore: true)
  $ErrorCopyWith<T, R, Error<T, R>> get copyWith =>
      throw _privateConstructorUsedError;
}
