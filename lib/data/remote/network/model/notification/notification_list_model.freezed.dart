// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notification_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationListModel _$NotificationListModelFromJson(
    Map<String, dynamic> json) {
  return _NotificationListModel.fromJson(json);
}

/// @nodoc
class _$NotificationListModelTearOff {
  const _$NotificationListModelTearOff();

  _NotificationListModel call(
      {List<NotificationModel>? pushs, PaginationModel? pagenation}) {
    return _NotificationListModel(
      pushs: pushs,
      pagenation: pagenation,
    );
  }

  NotificationListModel fromJson(Map<String, Object?> json) {
    return NotificationListModel.fromJson(json);
  }
}

/// @nodoc
const $NotificationListModel = _$NotificationListModelTearOff();

/// @nodoc
mixin _$NotificationListModel {
  List<NotificationModel>? get pushs => throw _privateConstructorUsedError;
  PaginationModel? get pagenation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationListModelCopyWith<NotificationListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationListModelCopyWith<$Res> {
  factory $NotificationListModelCopyWith(NotificationListModel value,
          $Res Function(NotificationListModel) then) =
      _$NotificationListModelCopyWithImpl<$Res>;
  $Res call({List<NotificationModel>? pushs, PaginationModel? pagenation});

  $PaginationModelCopyWith<$Res>? get pagenation;
}

/// @nodoc
class _$NotificationListModelCopyWithImpl<$Res>
    implements $NotificationListModelCopyWith<$Res> {
  _$NotificationListModelCopyWithImpl(this._value, this._then);

  final NotificationListModel _value;
  // ignore: unused_field
  final $Res Function(NotificationListModel) _then;

  @override
  $Res call({
    Object? pushs = freezed,
    Object? pagenation = freezed,
  }) {
    return _then(_value.copyWith(
      pushs: pushs == freezed
          ? _value.pushs
          : pushs // ignore: cast_nullable_to_non_nullable
              as List<NotificationModel>?,
      pagenation: pagenation == freezed
          ? _value.pagenation
          : pagenation // ignore: cast_nullable_to_non_nullable
              as PaginationModel?,
    ));
  }

  @override
  $PaginationModelCopyWith<$Res>? get pagenation {
    if (_value.pagenation == null) {
      return null;
    }

    return $PaginationModelCopyWith<$Res>(_value.pagenation!, (value) {
      return _then(_value.copyWith(pagenation: value));
    });
  }
}

/// @nodoc
abstract class _$NotificationListModelCopyWith<$Res>
    implements $NotificationListModelCopyWith<$Res> {
  factory _$NotificationListModelCopyWith(_NotificationListModel value,
          $Res Function(_NotificationListModel) then) =
      __$NotificationListModelCopyWithImpl<$Res>;
  @override
  $Res call({List<NotificationModel>? pushs, PaginationModel? pagenation});

  @override
  $PaginationModelCopyWith<$Res>? get pagenation;
}

/// @nodoc
class __$NotificationListModelCopyWithImpl<$Res>
    extends _$NotificationListModelCopyWithImpl<$Res>
    implements _$NotificationListModelCopyWith<$Res> {
  __$NotificationListModelCopyWithImpl(_NotificationListModel _value,
      $Res Function(_NotificationListModel) _then)
      : super(_value, (v) => _then(v as _NotificationListModel));

  @override
  _NotificationListModel get _value => super._value as _NotificationListModel;

  @override
  $Res call({
    Object? pushs = freezed,
    Object? pagenation = freezed,
  }) {
    return _then(_NotificationListModel(
      pushs: pushs == freezed
          ? _value.pushs
          : pushs // ignore: cast_nullable_to_non_nullable
              as List<NotificationModel>?,
      pagenation: pagenation == freezed
          ? _value.pagenation
          : pagenation // ignore: cast_nullable_to_non_nullable
              as PaginationModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationListModel implements _NotificationListModel {
  _$_NotificationListModel({this.pushs, this.pagenation});

  factory _$_NotificationListModel.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationListModelFromJson(json);

  @override
  final List<NotificationModel>? pushs;
  @override
  final PaginationModel? pagenation;

  @override
  String toString() {
    return 'NotificationListModel(pushs: $pushs, pagenation: $pagenation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationListModel &&
            const DeepCollectionEquality().equals(other.pushs, pushs) &&
            const DeepCollectionEquality()
                .equals(other.pagenation, pagenation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(pushs),
      const DeepCollectionEquality().hash(pagenation));

  @JsonKey(ignore: true)
  @override
  _$NotificationListModelCopyWith<_NotificationListModel> get copyWith =>
      __$NotificationListModelCopyWithImpl<_NotificationListModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationListModelToJson(this);
  }
}

abstract class _NotificationListModel implements NotificationListModel {
  factory _NotificationListModel(
      {List<NotificationModel>? pushs,
      PaginationModel? pagenation}) = _$_NotificationListModel;

  factory _NotificationListModel.fromJson(Map<String, dynamic> json) =
      _$_NotificationListModel.fromJson;

  @override
  List<NotificationModel>? get pushs;
  @override
  PaginationModel? get pagenation;
  @override
  @JsonKey(ignore: true)
  _$NotificationListModelCopyWith<_NotificationListModel> get copyWith =>
      throw _privateConstructorUsedError;
}
