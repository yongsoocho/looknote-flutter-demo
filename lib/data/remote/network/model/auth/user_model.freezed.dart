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

UserSignUpModel _$UserSignUpModelFromJson(Map<String, dynamic> json) {
  return _UserSignUpModel.fromJson(json);
}

/// @nodoc
class _$UserSignUpModelTearOff {
  const _$UserSignUpModelTearOff();

  _UserSignUpModel call(
      {required String email,
      required String password,
      required String name,
      required String nickname,
      @JsonKey(name: 'date_of_birth') int dateOfBirth = 0,
      String gender = 'ETC',
      String height = '',
      String weight = ''}) {
    return _UserSignUpModel(
      email: email,
      password: password,
      name: name,
      nickname: nickname,
      dateOfBirth: dateOfBirth,
      gender: gender,
      height: height,
      weight: weight,
    );
  }

  UserSignUpModel fromJson(Map<String, Object?> json) {
    return UserSignUpModel.fromJson(json);
  }
}

/// @nodoc
const $UserSignUpModel = _$UserSignUpModelTearOff();

/// @nodoc
mixin _$UserSignUpModel {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_of_birth')
  int get dateOfBirth => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String get height => throw _privateConstructorUsedError;
  String get weight => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserSignUpModelCopyWith<UserSignUpModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSignUpModelCopyWith<$Res> {
  factory $UserSignUpModelCopyWith(
          UserSignUpModel value, $Res Function(UserSignUpModel) then) =
      _$UserSignUpModelCopyWithImpl<$Res>;
  $Res call(
      {String email,
      String password,
      String name,
      String nickname,
      @JsonKey(name: 'date_of_birth') int dateOfBirth,
      String gender,
      String height,
      String weight});
}

/// @nodoc
class _$UserSignUpModelCopyWithImpl<$Res>
    implements $UserSignUpModelCopyWith<$Res> {
  _$UserSignUpModelCopyWithImpl(this._value, this._then);

  final UserSignUpModel _value;
  // ignore: unused_field
  final $Res Function(UserSignUpModel) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? name = freezed,
    Object? nickname = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? height = freezed,
    Object? weight = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
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
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as String,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$UserSignUpModelCopyWith<$Res>
    implements $UserSignUpModelCopyWith<$Res> {
  factory _$UserSignUpModelCopyWith(
          _UserSignUpModel value, $Res Function(_UserSignUpModel) then) =
      __$UserSignUpModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String email,
      String password,
      String name,
      String nickname,
      @JsonKey(name: 'date_of_birth') int dateOfBirth,
      String gender,
      String height,
      String weight});
}

/// @nodoc
class __$UserSignUpModelCopyWithImpl<$Res>
    extends _$UserSignUpModelCopyWithImpl<$Res>
    implements _$UserSignUpModelCopyWith<$Res> {
  __$UserSignUpModelCopyWithImpl(
      _UserSignUpModel _value, $Res Function(_UserSignUpModel) _then)
      : super(_value, (v) => _then(v as _UserSignUpModel));

  @override
  _UserSignUpModel get _value => super._value as _UserSignUpModel;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? name = freezed,
    Object? nickname = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? height = freezed,
    Object? weight = freezed,
  }) {
    return _then(_UserSignUpModel(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
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
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as String,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserSignUpModel implements _UserSignUpModel {
  _$_UserSignUpModel(
      {required this.email,
      required this.password,
      required this.name,
      required this.nickname,
      @JsonKey(name: 'date_of_birth') this.dateOfBirth = 0,
      this.gender = 'ETC',
      this.height = '',
      this.weight = ''});

  factory _$_UserSignUpModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserSignUpModelFromJson(json);

  @override
  final String email;
  @override
  final String password;
  @override
  final String name;
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
  final String height;
  @JsonKey()
  @override
  final String weight;

  @override
  String toString() {
    return 'UserSignUpModel(email: $email, password: $password, name: $name, nickname: $nickname, dateOfBirth: $dateOfBirth, gender: $gender, height: $height, weight: $weight)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserSignUpModel &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.nickname, nickname) &&
            const DeepCollectionEquality()
                .equals(other.dateOfBirth, dateOfBirth) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality().equals(other.height, height) &&
            const DeepCollectionEquality().equals(other.weight, weight));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(nickname),
      const DeepCollectionEquality().hash(dateOfBirth),
      const DeepCollectionEquality().hash(gender),
      const DeepCollectionEquality().hash(height),
      const DeepCollectionEquality().hash(weight));

  @JsonKey(ignore: true)
  @override
  _$UserSignUpModelCopyWith<_UserSignUpModel> get copyWith =>
      __$UserSignUpModelCopyWithImpl<_UserSignUpModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserSignUpModelToJson(this);
  }
}

abstract class _UserSignUpModel implements UserSignUpModel {
  factory _UserSignUpModel(
      {required String email,
      required String password,
      required String name,
      required String nickname,
      @JsonKey(name: 'date_of_birth') int dateOfBirth,
      String gender,
      String height,
      String weight}) = _$_UserSignUpModel;

  factory _UserSignUpModel.fromJson(Map<String, dynamic> json) =
      _$_UserSignUpModel.fromJson;

  @override
  String get email;
  @override
  String get password;
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
  String get height;
  @override
  String get weight;
  @override
  @JsonKey(ignore: true)
  _$UserSignUpModelCopyWith<_UserSignUpModel> get copyWith =>
      throw _privateConstructorUsedError;
}

AppleUserSignUpModel _$AppleUserSignUpModelFromJson(Map<String, dynamic> json) {
  return _AppleUserSignUpModel.fromJson(json);
}

/// @nodoc
class _$AppleUserSignUpModelTearOff {
  const _$AppleUserSignUpModelTearOff();

  _AppleUserSignUpModel call(
      {required String code,
      required String name,
      required String nickname,
      required String dateOfBirth,
      required String gender,
      required String height,
      required String weight,
      required bool agree}) {
    return _AppleUserSignUpModel(
      code: code,
      name: name,
      nickname: nickname,
      dateOfBirth: dateOfBirth,
      gender: gender,
      height: height,
      weight: weight,
      agree: agree,
    );
  }

  AppleUserSignUpModel fromJson(Map<String, Object?> json) {
    return AppleUserSignUpModel.fromJson(json);
  }
}

/// @nodoc
const $AppleUserSignUpModel = _$AppleUserSignUpModelTearOff();

/// @nodoc
mixin _$AppleUserSignUpModel {
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  String get dateOfBirth => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String get height => throw _privateConstructorUsedError;
  String get weight => throw _privateConstructorUsedError;
  bool get agree => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppleUserSignUpModelCopyWith<AppleUserSignUpModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppleUserSignUpModelCopyWith<$Res> {
  factory $AppleUserSignUpModelCopyWith(AppleUserSignUpModel value,
          $Res Function(AppleUserSignUpModel) then) =
      _$AppleUserSignUpModelCopyWithImpl<$Res>;
  $Res call(
      {String code,
      String name,
      String nickname,
      String dateOfBirth,
      String gender,
      String height,
      String weight,
      bool agree});
}

/// @nodoc
class _$AppleUserSignUpModelCopyWithImpl<$Res>
    implements $AppleUserSignUpModelCopyWith<$Res> {
  _$AppleUserSignUpModelCopyWithImpl(this._value, this._then);

  final AppleUserSignUpModel _value;
  // ignore: unused_field
  final $Res Function(AppleUserSignUpModel) _then;

  @override
  $Res call({
    Object? code = freezed,
    Object? name = freezed,
    Object? nickname = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? agree = freezed,
  }) {
    return _then(_value.copyWith(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
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
              as String,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as String,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String,
      agree: agree == freezed
          ? _value.agree
          : agree // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$AppleUserSignUpModelCopyWith<$Res>
    implements $AppleUserSignUpModelCopyWith<$Res> {
  factory _$AppleUserSignUpModelCopyWith(_AppleUserSignUpModel value,
          $Res Function(_AppleUserSignUpModel) then) =
      __$AppleUserSignUpModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String code,
      String name,
      String nickname,
      String dateOfBirth,
      String gender,
      String height,
      String weight,
      bool agree});
}

/// @nodoc
class __$AppleUserSignUpModelCopyWithImpl<$Res>
    extends _$AppleUserSignUpModelCopyWithImpl<$Res>
    implements _$AppleUserSignUpModelCopyWith<$Res> {
  __$AppleUserSignUpModelCopyWithImpl(
      _AppleUserSignUpModel _value, $Res Function(_AppleUserSignUpModel) _then)
      : super(_value, (v) => _then(v as _AppleUserSignUpModel));

  @override
  _AppleUserSignUpModel get _value => super._value as _AppleUserSignUpModel;

  @override
  $Res call({
    Object? code = freezed,
    Object? name = freezed,
    Object? nickname = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? agree = freezed,
  }) {
    return _then(_AppleUserSignUpModel(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
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
              as String,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as String,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String,
      agree: agree == freezed
          ? _value.agree
          : agree // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppleUserSignUpModel implements _AppleUserSignUpModel {
  const _$_AppleUserSignUpModel(
      {required this.code,
      required this.name,
      required this.nickname,
      required this.dateOfBirth,
      required this.gender,
      required this.height,
      required this.weight,
      required this.agree});

  factory _$_AppleUserSignUpModel.fromJson(Map<String, dynamic> json) =>
      _$$_AppleUserSignUpModelFromJson(json);

  @override
  final String code;
  @override
  final String name;
  @override
  final String nickname;
  @override
  final String dateOfBirth;
  @override
  final String gender;
  @override
  final String height;
  @override
  final String weight;
  @override
  final bool agree;

  @override
  String toString() {
    return 'AppleUserSignUpModel(code: $code, name: $name, nickname: $nickname, dateOfBirth: $dateOfBirth, gender: $gender, height: $height, weight: $weight, agree: $agree)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppleUserSignUpModel &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.nickname, nickname) &&
            const DeepCollectionEquality()
                .equals(other.dateOfBirth, dateOfBirth) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality().equals(other.height, height) &&
            const DeepCollectionEquality().equals(other.weight, weight) &&
            const DeepCollectionEquality().equals(other.agree, agree));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(nickname),
      const DeepCollectionEquality().hash(dateOfBirth),
      const DeepCollectionEquality().hash(gender),
      const DeepCollectionEquality().hash(height),
      const DeepCollectionEquality().hash(weight),
      const DeepCollectionEquality().hash(agree));

  @JsonKey(ignore: true)
  @override
  _$AppleUserSignUpModelCopyWith<_AppleUserSignUpModel> get copyWith =>
      __$AppleUserSignUpModelCopyWithImpl<_AppleUserSignUpModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppleUserSignUpModelToJson(this);
  }
}

abstract class _AppleUserSignUpModel implements AppleUserSignUpModel {
  const factory _AppleUserSignUpModel(
      {required String code,
      required String name,
      required String nickname,
      required String dateOfBirth,
      required String gender,
      required String height,
      required String weight,
      required bool agree}) = _$_AppleUserSignUpModel;

  factory _AppleUserSignUpModel.fromJson(Map<String, dynamic> json) =
      _$_AppleUserSignUpModel.fromJson;

  @override
  String get code;
  @override
  String get name;
  @override
  String get nickname;
  @override
  String get dateOfBirth;
  @override
  String get gender;
  @override
  String get height;
  @override
  String get weight;
  @override
  bool get agree;
  @override
  @JsonKey(ignore: true)
  _$AppleUserSignUpModelCopyWith<_AppleUserSignUpModel> get copyWith =>
      throw _privateConstructorUsedError;
}
