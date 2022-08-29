// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_with_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserWithTokenModel _$$_UserWithTokenModelFromJson(
        Map<String, dynamic> json) =>
    _$_UserWithTokenModel(
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      accessToken: json['access_token'] as String? ?? '',
    );

Map<String, dynamic> _$$_UserWithTokenModelToJson(
        _$_UserWithTokenModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'access_token': instance.accessToken,
    };

_$_NewUserWithTokenModel _$$_NewUserWithTokenModelFromJson(
        Map<String, dynamic> json) =>
    _$_NewUserWithTokenModel(
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      newUser: json['newUser'] == null
          ? null
          : UserModel.fromJson(json['newUser'] as Map<String, dynamic>),
      accessToken: json['access_token'] as String? ?? '',
    );

Map<String, dynamic> _$$_NewUserWithTokenModelToJson(
        _$_NewUserWithTokenModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'newUser': instance.newUser,
      'access_token': instance.accessToken,
    };
