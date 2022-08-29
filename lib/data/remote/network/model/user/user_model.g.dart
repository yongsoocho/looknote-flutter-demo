// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      email: json['email'] as String? ?? '',
      userId: json['user_id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      nickname: json['nickname'] as String? ?? '',
      dateOfBirth: json['date_of_birth'] as int? ?? 0,
      gender: json['gender'] as String? ?? '',
      provider: json['provider'] as String? ?? '',
      createAt: json['createAt'] as String? ?? '',
      active: json['active'] as bool? ?? true,
      coin: json['coin'] == null
          ? null
          : CoinModel.fromJson(json['coin'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'user_id': instance.userId,
      'name': instance.name,
      'nickname': instance.nickname,
      'date_of_birth': instance.dateOfBirth,
      'gender': instance.gender,
      'provider': instance.provider,
      'createAt': instance.createAt,
      'active': instance.active,
      'coin': instance.coin,
    };
