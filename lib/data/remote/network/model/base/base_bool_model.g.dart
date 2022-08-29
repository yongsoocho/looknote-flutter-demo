// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_bool_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseBoolModel<T> _$BaseBoolModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseBoolModel<T>(
      json['data'] as bool,
      json['statusCode'] as int,
      json['success'] as bool,
      json['error'] as bool,
      json['duration'] as String,
    );
