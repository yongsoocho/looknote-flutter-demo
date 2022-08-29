// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pagination_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaginationModel _$PaginationModelFromJson(Map<String, dynamic> json) {
  return _PaginationModel.fromJson(json);
}

/// @nodoc
class _$PaginationModelTearOff {
  const _$PaginationModelTearOff();

  _PaginationModel call({int size = 0, int page = 0, int lastPage = 0}) {
    return _PaginationModel(
      size: size,
      page: page,
      lastPage: lastPage,
    );
  }

  PaginationModel fromJson(Map<String, Object?> json) {
    return PaginationModel.fromJson(json);
  }
}

/// @nodoc
const $PaginationModel = _$PaginationModelTearOff();

/// @nodoc
mixin _$PaginationModel {
  int get size => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get lastPage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginationModelCopyWith<PaginationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationModelCopyWith<$Res> {
  factory $PaginationModelCopyWith(
          PaginationModel value, $Res Function(PaginationModel) then) =
      _$PaginationModelCopyWithImpl<$Res>;
  $Res call({int size, int page, int lastPage});
}

/// @nodoc
class _$PaginationModelCopyWithImpl<$Res>
    implements $PaginationModelCopyWith<$Res> {
  _$PaginationModelCopyWithImpl(this._value, this._then);

  final PaginationModel _value;
  // ignore: unused_field
  final $Res Function(PaginationModel) _then;

  @override
  $Res call({
    Object? size = freezed,
    Object? page = freezed,
    Object? lastPage = freezed,
  }) {
    return _then(_value.copyWith(
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: lastPage == freezed
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$PaginationModelCopyWith<$Res>
    implements $PaginationModelCopyWith<$Res> {
  factory _$PaginationModelCopyWith(
          _PaginationModel value, $Res Function(_PaginationModel) then) =
      __$PaginationModelCopyWithImpl<$Res>;
  @override
  $Res call({int size, int page, int lastPage});
}

/// @nodoc
class __$PaginationModelCopyWithImpl<$Res>
    extends _$PaginationModelCopyWithImpl<$Res>
    implements _$PaginationModelCopyWith<$Res> {
  __$PaginationModelCopyWithImpl(
      _PaginationModel _value, $Res Function(_PaginationModel) _then)
      : super(_value, (v) => _then(v as _PaginationModel));

  @override
  _PaginationModel get _value => super._value as _PaginationModel;

  @override
  $Res call({
    Object? size = freezed,
    Object? page = freezed,
    Object? lastPage = freezed,
  }) {
    return _then(_PaginationModel(
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: lastPage == freezed
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaginationModel implements _PaginationModel {
  _$_PaginationModel({this.size = 0, this.page = 0, this.lastPage = 0});

  factory _$_PaginationModel.fromJson(Map<String, dynamic> json) =>
      _$$_PaginationModelFromJson(json);

  @JsonKey()
  @override
  final int size;
  @JsonKey()
  @override
  final int page;
  @JsonKey()
  @override
  final int lastPage;

  @override
  String toString() {
    return 'PaginationModel(size: $size, page: $page, lastPage: $lastPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaginationModel &&
            const DeepCollectionEquality().equals(other.size, size) &&
            const DeepCollectionEquality().equals(other.page, page) &&
            const DeepCollectionEquality().equals(other.lastPage, lastPage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(size),
      const DeepCollectionEquality().hash(page),
      const DeepCollectionEquality().hash(lastPage));

  @JsonKey(ignore: true)
  @override
  _$PaginationModelCopyWith<_PaginationModel> get copyWith =>
      __$PaginationModelCopyWithImpl<_PaginationModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaginationModelToJson(this);
  }
}

abstract class _PaginationModel implements PaginationModel {
  factory _PaginationModel({int size, int page, int lastPage}) =
      _$_PaginationModel;

  factory _PaginationModel.fromJson(Map<String, dynamic> json) =
      _$_PaginationModel.fromJson;

  @override
  int get size;
  @override
  int get page;
  @override
  int get lastPage;
  @override
  @JsonKey(ignore: true)
  _$PaginationModelCopyWith<_PaginationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
