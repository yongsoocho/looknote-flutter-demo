// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) {
  return _NotificationModel.fromJson(json);
}

/// @nodoc
class _$NotificationModelTearOff {
  const _$NotificationModelTearOff();

  _NotificationModel call(
      {@JsonKey(name: 'push_id') int pushId = 0,
      @JsonKey(name: 'user_id') int userId = 0,
      @JsonKey(name: 'from_id') int fromId = 0,
      String type = '',
      String imageURL = '',
      @JsonKey(name: 'created_at') String createdAt = '',
      UserModel? from}) {
    return _NotificationModel(
      pushId: pushId,
      userId: userId,
      fromId: fromId,
      type: type,
      imageURL: imageURL,
      createdAt: createdAt,
      from: from,
    );
  }

  NotificationModel fromJson(Map<String, Object?> json) {
    return NotificationModel.fromJson(json);
  }
}

/// @nodoc
const $NotificationModel = _$NotificationModelTearOff();

/// @nodoc
mixin _$NotificationModel {
  @JsonKey(name: 'push_id')
  int get pushId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'from_id')
  int get fromId => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get imageURL => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  UserModel? get from => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationModelCopyWith<NotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationModelCopyWith<$Res> {
  factory $NotificationModelCopyWith(
          NotificationModel value, $Res Function(NotificationModel) then) =
      _$NotificationModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'push_id') int pushId,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'from_id') int fromId,
      String type,
      String imageURL,
      @JsonKey(name: 'created_at') String createdAt,
      UserModel? from});

  $UserModelCopyWith<$Res>? get from;
}

/// @nodoc
class _$NotificationModelCopyWithImpl<$Res>
    implements $NotificationModelCopyWith<$Res> {
  _$NotificationModelCopyWithImpl(this._value, this._then);

  final NotificationModel _value;
  // ignore: unused_field
  final $Res Function(NotificationModel) _then;

  @override
  $Res call({
    Object? pushId = freezed,
    Object? userId = freezed,
    Object? fromId = freezed,
    Object? type = freezed,
    Object? imageURL = freezed,
    Object? createdAt = freezed,
    Object? from = freezed,
  }) {
    return _then(_value.copyWith(
      pushId: pushId == freezed
          ? _value.pushId
          : pushId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      fromId: fromId == freezed
          ? _value.fromId
          : fromId // ignore: cast_nullable_to_non_nullable
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      imageURL: imageURL == freezed
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      from: from == freezed
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }

  @override
  $UserModelCopyWith<$Res>? get from {
    if (_value.from == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.from!, (value) {
      return _then(_value.copyWith(from: value));
    });
  }
}

/// @nodoc
abstract class _$NotificationModelCopyWith<$Res>
    implements $NotificationModelCopyWith<$Res> {
  factory _$NotificationModelCopyWith(
          _NotificationModel value, $Res Function(_NotificationModel) then) =
      __$NotificationModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'push_id') int pushId,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'from_id') int fromId,
      String type,
      String imageURL,
      @JsonKey(name: 'created_at') String createdAt,
      UserModel? from});

  @override
  $UserModelCopyWith<$Res>? get from;
}

/// @nodoc
class __$NotificationModelCopyWithImpl<$Res>
    extends _$NotificationModelCopyWithImpl<$Res>
    implements _$NotificationModelCopyWith<$Res> {
  __$NotificationModelCopyWithImpl(
      _NotificationModel _value, $Res Function(_NotificationModel) _then)
      : super(_value, (v) => _then(v as _NotificationModel));

  @override
  _NotificationModel get _value => super._value as _NotificationModel;

  @override
  $Res call({
    Object? pushId = freezed,
    Object? userId = freezed,
    Object? fromId = freezed,
    Object? type = freezed,
    Object? imageURL = freezed,
    Object? createdAt = freezed,
    Object? from = freezed,
  }) {
    return _then(_NotificationModel(
      pushId: pushId == freezed
          ? _value.pushId
          : pushId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      fromId: fromId == freezed
          ? _value.fromId
          : fromId // ignore: cast_nullable_to_non_nullable
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      imageURL: imageURL == freezed
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      from: from == freezed
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationModel implements _NotificationModel {
  _$_NotificationModel(
      {@JsonKey(name: 'push_id') this.pushId = 0,
      @JsonKey(name: 'user_id') this.userId = 0,
      @JsonKey(name: 'from_id') this.fromId = 0,
      this.type = '',
      this.imageURL = '',
      @JsonKey(name: 'created_at') this.createdAt = '',
      this.from});

  factory _$_NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationModelFromJson(json);

  @override
  @JsonKey(name: 'push_id')
  final int pushId;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  @JsonKey(name: 'from_id')
  final int fromId;
  @JsonKey()
  @override
  final String type;
  @JsonKey()
  @override
  final String imageURL;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  final UserModel? from;

  @override
  String toString() {
    return 'NotificationModel(pushId: $pushId, userId: $userId, fromId: $fromId, type: $type, imageURL: $imageURL, createdAt: $createdAt, from: $from)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationModel &&
            const DeepCollectionEquality().equals(other.pushId, pushId) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.fromId, fromId) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.imageURL, imageURL) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.from, from));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(pushId),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(fromId),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(imageURL),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(from));

  @JsonKey(ignore: true)
  @override
  _$NotificationModelCopyWith<_NotificationModel> get copyWith =>
      __$NotificationModelCopyWithImpl<_NotificationModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationModelToJson(this);
  }
}

abstract class _NotificationModel implements NotificationModel {
  factory _NotificationModel(
      {@JsonKey(name: 'push_id') int pushId,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'from_id') int fromId,
      String type,
      String imageURL,
      @JsonKey(name: 'created_at') String createdAt,
      UserModel? from}) = _$_NotificationModel;

  factory _NotificationModel.fromJson(Map<String, dynamic> json) =
      _$_NotificationModel.fromJson;

  @override
  @JsonKey(name: 'push_id')
  int get pushId;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  @JsonKey(name: 'from_id')
  int get fromId;
  @override
  String get type;
  @override
  String get imageURL;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  UserModel? get from;
  @override
  @JsonKey(ignore: true)
  _$NotificationModelCopyWith<_NotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
