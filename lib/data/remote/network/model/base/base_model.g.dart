// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseModel<T> _$BaseModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseModel<T>(
      fromJsonT(json['data']),
      json['statusCode'] as int,
      json['success'] as bool,
      json['error'] as bool,
      json['duration'] as String,
    );
