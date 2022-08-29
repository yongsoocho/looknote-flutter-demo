// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_with_token_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserWithTokenModel _$UserWithTokenModelFromJson(Map<String, dynamic> json) {
  return _UserWithTokenModel.fromJson(json);
}

/// @nodoc
class _$UserWithTokenModelTearOff {
  const _$UserWithTokenModelTearOff();

  _UserWithTokenModel call(
      {required UserModel user,
      @JsonKey(name: 'access_token') String accessToken = ''}) {
    return _UserWithTokenModel(
      user: user,
      accessToken: accessToken,
    );
  }

  UserWithTokenModel fromJson(Map<String, Object?> json) {
    return UserWithTokenModel.fromJson(json);
  }
}

/// @nodoc
const $UserWithTokenModel = _$UserWithTokenModelTearOff();

/// @nodoc
mixin _$UserWithTokenModel {
  UserModel get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'access_token')
  String get accessToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserWithTokenModelCopyWith<UserWithTokenModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserWithTokenModelCopyWith<$Res> {
  factory $UserWithTokenModelCopyWith(
          UserWithTokenModel value, $Res Function(UserWithTokenModel) then) =
      _$UserWithTokenModelCopyWithImpl<$Res>;
  $Res call(
      {UserModel user, @JsonKey(name: 'access_token') String accessToken});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$UserWithTokenModelCopyWithImpl<$Res>
    implements $UserWithTokenModelCopyWith<$Res> {
  _$UserWithTokenModelCopyWithImpl(this._value, this._then);

  final UserWithTokenModel _value;
  // ignore: unused_field
  final $Res Function(UserWithTokenModel) _then;

  @override
  $Res call({
    Object? user = freezed,
    Object? accessToken = freezed,
  }) {
    return _then(_value.copyWith(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$UserWithTokenModelCopyWith<$Res>
    implements $UserWithTokenModelCopyWith<$Res> {
  factory _$UserWithTokenModelCopyWith(
          _UserWithTokenModel value, $Res Function(_UserWithTokenModel) then) =
      __$UserWithTokenModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {UserModel user, @JsonKey(name: 'access_token') String accessToken});

  @override
  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$UserWithTokenModelCopyWithImpl<$Res>
    extends _$UserWithTokenModelCopyWithImpl<$Res>
    implements _$UserWithTokenModelCopyWith<$Res> {
  __$UserWithTokenModelCopyWithImpl(
      _UserWithTokenModel _value, $Res Function(_UserWithTokenModel) _then)
      : super(_value, (v) => _then(v as _UserWithTokenModel));

  @override
  _UserWithTokenModel get _value => super._value as _UserWithTokenModel;

  @override
  $Res call({
    Object? user = freezed,
    Object? accessToken = freezed,
  }) {
    return _then(_UserWithTokenModel(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserWithTokenModel implements _UserWithTokenModel {
  const _$_UserWithTokenModel(
      {required this.user,
      @JsonKey(name: 'access_token') this.accessToken = ''});

  factory _$_UserWithTokenModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserWithTokenModelFromJson(json);

  @override
  final UserModel user;
  @override
  @JsonKey(name: 'access_token')
  final String accessToken;

  @override
  String toString() {
    return 'UserWithTokenModel(user: $user, accessToken: $accessToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserWithTokenModel &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality()
                .equals(other.accessToken, accessToken));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(accessToken));

  @JsonKey(ignore: true)
  @override
  _$UserWithTokenModelCopyWith<_UserWithTokenModel> get copyWith =>
      __$UserWithTokenModelCopyWithImpl<_UserWithTokenModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserWithTokenModelToJson(this);
  }
}

abstract class _UserWithTokenModel implements UserWithTokenModel {
  const factory _UserWithTokenModel(
          {required UserModel user,
          @JsonKey(name: 'access_token') String accessToken}) =
      _$_UserWithTokenModel;

  factory _UserWithTokenModel.fromJson(Map<String, dynamic> json) =
      _$_UserWithTokenModel.fromJson;

  @override
  UserModel get user;
  @override
  @JsonKey(name: 'access_token')
  String get accessToken;
  @override
  @JsonKey(ignore: true)
  _$UserWithTokenModelCopyWith<_UserWithTokenModel> get copyWith =>
      throw _privateConstructorUsedError;
}

NewUserWithTokenModel _$NewUserWithTokenModelFromJson(
    Map<String, dynamic> json) {
  return _NewUserWithTokenModel.fromJson(json);
}

/// @nodoc
class _$NewUserWithTokenModelTearOff {
  const _$NewUserWithTokenModelTearOff();

  _NewUserWithTokenModel call(
      {required UserModel? user,
      required UserModel? newUser,
      @JsonKey(name: 'access_token') String accessToken = ''}) {
    return _NewUserWithTokenModel(
      user: user,
      newUser: newUser,
      accessToken: accessToken,
    );
  }

  NewUserWithTokenModel fromJson(Map<String, Object?> json) {
    return NewUserWithTokenModel.fromJson(json);
  }
}

/// @nodoc
const $NewUserWithTokenModel = _$NewUserWithTokenModelTearOff();

/// @nodoc
mixin _$NewUserWithTokenModel {
  UserModel? get user => throw _privateConstructorUsedError;
  UserModel? get newUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'access_token')
  String get accessToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewUserWithTokenModelCopyWith<NewUserWithTokenModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewUserWithTokenModelCopyWith<$Res> {
  factory $NewUserWithTokenModelCopyWith(NewUserWithTokenModel value,
          $Res Function(NewUserWithTokenModel) then) =
      _$NewUserWithTokenModelCopyWithImpl<$Res>;
  $Res call(
      {UserModel? user,
      UserModel? newUser,
      @JsonKey(name: 'access_token') String accessToken});

  $UserModelCopyWith<$Res>? get user;
  $UserModelCopyWith<$Res>? get newUser;
}

/// @nodoc
class _$NewUserWithTokenModelCopyWithImpl<$Res>
    implements $NewUserWithTokenModelCopyWith<$Res> {
  _$NewUserWithTokenModelCopyWithImpl(this._value, this._then);

  final NewUserWithTokenModel _value;
  // ignore: unused_field
  final $Res Function(NewUserWithTokenModel) _then;

  @override
  $Res call({
    Object? user = freezed,
    Object? newUser = freezed,
    Object? accessToken = freezed,
  }) {
    return _then(_value.copyWith(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      newUser: newUser == freezed
          ? _value.newUser
          : newUser // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $UserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }

  @override
  $UserModelCopyWith<$Res>? get newUser {
    if (_value.newUser == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.newUser!, (value) {
      return _then(_value.copyWith(newUser: value));
    });
  }
}

/// @nodoc
abstract class _$NewUserWithTokenModelCopyWith<$Res>
    implements $NewUserWithTokenModelCopyWith<$Res> {
  factory _$NewUserWithTokenModelCopyWith(_NewUserWithTokenModel value,
          $Res Function(_NewUserWithTokenModel) then) =
      __$NewUserWithTokenModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {UserModel? user,
      UserModel? newUser,
      @JsonKey(name: 'access_token') String accessToken});

  @override
  $UserModelCopyWith<$Res>? get user;
  @override
  $UserModelCopyWith<$Res>? get newUser;
}

/// @nodoc
class __$NewUserWithTokenModelCopyWithImpl<$Res>
    extends _$NewUserWithTokenModelCopyWithImpl<$Res>
    implements _$NewUserWithTokenModelCopyWith<$Res> {
  __$NewUserWithTokenModelCopyWithImpl(_NewUserWithTokenModel _value,
      $Res Function(_NewUserWithTokenModel) _then)
      : super(_value, (v) => _then(v as _NewUserWithTokenModel));

  @override
  _NewUserWithTokenModel get _value => super._value as _NewUserWithTokenModel;

  @override
  $Res call({
    Object? user = freezed,
    Object? newUser = freezed,
    Object? accessToken = freezed,
  }) {
    return _then(_NewUserWithTokenModel(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      newUser: newUser == freezed
          ? _value.newUser
          : newUser // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NewUserWithTokenModel implements _NewUserWithTokenModel {
  const _$_NewUserWithTokenModel(
      {required this.user,
      required this.newUser,
      @JsonKey(name: 'access_token') this.accessToken = ''});

  factory _$_NewUserWithTokenModel.fromJson(Map<String, dynamic> json) =>
      _$$_NewUserWithTokenModelFromJson(json);

  @override
  final UserModel? user;
  @override
  final UserModel? newUser;
  @override
  @JsonKey(name: 'access_token')
  final String accessToken;

  @override
  String toString() {
    return 'NewUserWithTokenModel(user: $user, newUser: $newUser, accessToken: $accessToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NewUserWithTokenModel &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.newUser, newUser) &&
            const DeepCollectionEquality()
                .equals(other.accessToken, accessToken));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(newUser),
      const DeepCollectionEquality().hash(accessToken));

  @JsonKey(ignore: true)
  @override
  _$NewUserWithTokenModelCopyWith<_NewUserWithTokenModel> get copyWith =>
      __$NewUserWithTokenModelCopyWithImpl<_NewUserWithTokenModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NewUserWithTokenModelToJson(this);
  }
}

abstract class _NewUserWithTokenModel implements NewUserWithTokenModel {
  const factory _NewUserWithTokenModel(
          {required UserModel? user,
          required UserModel? newUser,
          @JsonKey(name: 'access_token') String accessToken}) =
      _$_NewUserWithTokenModel;

  factory _NewUserWithTokenModel.fromJson(Map<String, dynamic> json) =
      _$_NewUserWithTokenModel.fromJson;

  @override
  UserModel? get user;
  @override
  UserModel? get newUser;
  @override
  @JsonKey(name: 'access_token')
  String get accessToken;
  @override
  @JsonKey(ignore: true)
  _$NewUserWithTokenModelCopyWith<_NewUserWithTokenModel> get copyWith =>
      throw _privateConstructorUsedError;
}
