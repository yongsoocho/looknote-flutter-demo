// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserSignUpModel _$$_UserSignUpModelFromJson(Map<String, dynamic> json) =>
    _$_UserSignUpModel(
      email: json['email'] as String,
      password: json['password'] as String,
      name: json['name'] as String,
      nickname: json['nickname'] as String,
      dateOfBirth: json['date_of_birth'] as int? ?? 0,
      gender: json['gender'] as String? ?? 'ETC',
      height: json['height'] as String? ?? '',
      weight: json['weight'] as String? ?? '',
    );

Map<String, dynamic> _$$_UserSignUpModelToJson(_$_UserSignUpModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'nickname': instance.nickname,
      'date_of_birth': instance.dateOfBirth,
      'gender': instance.gender,
      'height': instance.height,
      'weight': instance.weight,
    };

_$_AppleUserSignUpModel _$$_AppleUserSignUpModelFromJson(
        Map<String, dynamic> json) =>
    _$_AppleUserSignUpModel(
      code: json['code'] as String,
      name: json['name'] as String,
      nickname: json['nickname'] as String,
      dateOfBirth: json['dateOfBirth'] as String,
      gender: json['gender'] as String,
      height: json['height'] as String,
      weight: json['weight'] as String,
      agree: json['agree'] as bool,
    );

Map<String, dynamic> _$$_AppleUserSignUpModelToJson(
        _$_AppleUserSignUpModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'nickname': instance.nickname,
      'dateOfBirth': instance.dateOfBirth,
      'gender': instance.gender,
      'height': instance.height,
      'weight': instance.weight,
      'agree': instance.agree,
    };
