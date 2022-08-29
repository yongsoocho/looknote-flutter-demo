// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationModel _$$_NotificationModelFromJson(Map<String, dynamic> json) =>
    _$_NotificationModel(
      pushId: json['push_id'] as int? ?? 0,
      userId: json['user_id'] as int? ?? 0,
      fromId: json['from_id'] as int? ?? 0,
      type: json['type'] as String? ?? '',
      imageURL: json['imageURL'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      from: json['from'] == null
          ? null
          : UserModel.fromJson(json['from'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_NotificationModelToJson(
        _$_NotificationModel instance) =>
    <String, dynamic>{
      'push_id': instance.pushId,
      'user_id': instance.userId,
      'from_id': instance.fromId,
      'type': instance.type,
      'imageURL': instance.imageURL,
      'created_at': instance.createdAt,
      'from': instance.from,
    };
