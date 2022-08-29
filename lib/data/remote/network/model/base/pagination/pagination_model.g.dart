// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaginationModel _$$_PaginationModelFromJson(Map<String, dynamic> json) =>
    _$_PaginationModel(
      size: json['size'] as int? ?? 0,
      page: json['page'] as int? ?? 0,
      lastPage: json['lastPage'] as int? ?? 0,
    );

Map<String, dynamic> _$$_PaginationModelToJson(_$_PaginationModel instance) =>
    <String, dynamic>{
      'size': instance.size,
      'page': instance.page,
      'lastPage': instance.lastPage,
    };
