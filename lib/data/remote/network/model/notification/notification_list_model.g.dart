// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationListModel _$$_NotificationListModelFromJson(
        Map<String, dynamic> json) =>
    _$_NotificationListModel(
      pushs: (json['pushs'] as List<dynamic>?)
          ?.map((e) => NotificationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagenation: json['pagenation'] == null
          ? null
          : PaginationModel.fromJson(
              json['pagenation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_NotificationListModelToJson(
        _$_NotificationListModel instance) =>
    <String, dynamic>{
      'pushs': instance.pushs,
      'pagenation': instance.pagenation,
    };
