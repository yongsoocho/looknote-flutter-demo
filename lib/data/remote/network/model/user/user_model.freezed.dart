// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
class _$UserModelTearOff {
  const _$UserModelTearOff();

  _UserModel call(
      {String email = '',
      @JsonKey(name: 'user_id') int userId = 0,
      String name = '',
      String nickname = '',
      @JsonKey(name: 'date_of_birth') int dateOfBirth = 0,
      String gender = '',
      String provider = '',
      String createAt = '',
      bool active = true,
      CoinModel? coin}) {
    return _UserModel(
      email: email,
      userId: userId,
      name: name,
      nickname: nickname,
      dateOfBirth: dateOfBirth,
      gender: gender,
      provider: provider,
      createAt: createAt,
      active: active,
      coin: coin,
    );
  }

  UserModel fromJson(Map<String, Object?> json) {
    return UserModel.fromJson(json);
  }
}

/// @nodoc
const $UserModel = _$UserModelTearOff();

/// @nodoc
mixin _$UserModel {
// update any properties as needed
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_of_birth')
  int get dateOfBirth => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String get provider => throw _privateConstructorUsedError;
  String get createAt => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  CoinModel? get coin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res>;
  $Res call(
      {String email,
      @JsonKey(name: 'user_id') int userId,
      String name,
      String nickname,
      @JsonKey(name: 'date_of_birth') int dateOfBirth,
      String gender,
      String provider,
      String createAt,
      bool active,
      CoinModel? coin});

  $CoinModelCopyWith<$Res>? get coin;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res> implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  final UserModel _value;
  // ignore: unused_field
  final $Res Function(UserModel) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? userId = freezed,
    Object? name = freezed,
    Object? nickname = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? provider = freezed,
    Object? createAt = freezed,
    Object? active = freezed,
    Object? coin = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: nickname == freezed
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: dateOfBirth == freezed
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as int,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      provider: provider == freezed
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      createAt: createAt == freezed
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as String,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      coin: coin == freezed
          ? _value.coin
          : coin // ignore: cast_nullable_to_non_nullable
              as CoinModel?,
    ));
  }

  @override
  $CoinModelCopyWith<$Res>? get coin {
    if (_value.coin == null) {
      return null;
    }

    return $CoinModelCopyWith<$Res>(_value.coin!, (value) {
      return _then(_value.copyWith(coin: value));
    });
  }
}

/// @nodoc
abstract class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(
          _UserModel value, $Res Function(_UserModel) then) =
      __$UserModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String email,
      @JsonKey(name: 'user_id') int userId,
      String name,
      String nickname,
      @JsonKey(name: 'date_of_birth') int dateOfBirth,
      String gender,
      String provider,
      String createAt,
      bool active,
      CoinModel? coin});

  @override
  $CoinModelCopyWith<$Res>? get coin;
}

/// @nodoc
class __$UserModelCopyWithImpl<$Res> extends _$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(_UserModel _value, $Res Function(_UserModel) _then)
      : super(_value, (v) => _then(v as _UserModel));

  @override
  _UserModel get _value => super._value as _UserModel;

  @override
  $Res call({
    Object? email = freezed,
    Object? userId = freezed,
    Object? name = freezed,
    Object? nickname = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? provider = freezed,
    Object? createAt = freezed,
    Object? active = freezed,
    Object? coin = freezed,
  }) {
    return _then(_UserModel(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: nickname == freezed
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfBirth: dateOfBirth == freezed
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as int,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      provider: provider == freezed
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      createAt: createAt == freezed
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as String,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      coin: coin == freezed
          ? _value.coin
          : coin // ignore: cast_nullable_to_non_nullable
              as CoinModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserModel implements _UserModel {
  _$_UserModel(
      {this.email = '',
      @JsonKey(name: 'user_id') this.userId = 0,
      this.name = '',
      this.nickname = '',
      @JsonKey(name: 'date_of_birth') this.dateOfBirth = 0,
      this.gender = '',
      this.provider = '',
      this.createAt = '',
      this.active = true,
      this.coin});

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelFromJson(json);

  @JsonKey()
  @override // update any properties as needed
  final String email;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey()
  @override
  final String name;
  @JsonKey()
  @override
  final String nickname;
  @override
  @JsonKey(name: 'date_of_birth')
  final int dateOfBirth;
  @JsonKey()
  @override
  final String gender;
  @JsonKey()
  @override
  final String provider;
  @JsonKey()
  @override
  final String createAt;
  @JsonKey()
  @override
  final bool active;
  @override
  final CoinModel? coin;

  @override
  String toString() {
    return 'UserModel(email: $email, userId: $userId, name: $name, nickname: $nickname, dateOfBirth: $dateOfBirth, gender: $gender, provider: $provider, createAt: $createAt, active: $active, coin: $coin)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserModel &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.nickname, nickname) &&
            const DeepCollectionEquality()
                .equals(other.dateOfBirth, dateOfBirth) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality().equals(other.provider, provider) &&
            const DeepCollectionEquality().equals(other.createAt, createAt) &&
            const DeepCollectionEquality().equals(other.active, active) &&
            const DeepCollectionEquality().equals(other.coin, coin));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(nickname),
      const DeepCollectionEquality().hash(dateOfBirth),
      const DeepCollectionEquality().hash(gender),
      const DeepCollectionEquality().hash(provider),
      const DeepCollectionEquality().hash(createAt),
      const DeepCollectionEquality().hash(active),
      const DeepCollectionEquality().hash(coin));

  @JsonKey(ignore: true)
  @override
  _$UserModelCopyWith<_UserModel> get copyWith =>
      __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserModelToJson(this);
  }
}

abstract class _UserModel implements UserModel {
  factory _UserModel(
      {String email,
      @JsonKey(name: 'user_id') int userId,
      String name,
      String nickname,
      @JsonKey(name: 'date_of_birth') int dateOfBirth,
      String gender,
      String provider,
      String createAt,
      bool active,
      CoinModel? coin}) = _$_UserModel;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override // update any properties as needed
  String get email;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  String get name;
  @override
  String get nickname;
  @override
  @JsonKey(name: 'date_of_birth')
  int get dateOfBirth;
  @override
  String get gender;
  @override
  String get provider;
  @override
  String get createAt;
  @override
  bool get active;
  @override
  CoinModel? get coin;
  @override
  @JsonKey(ignore: true)
  _$UserModelCopyWith<_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
