// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_string_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseStringModel<T> _$BaseStringModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseStringModel<T>(
      json['data'] as String,
      json['statusCode'] as int,
      json['success'] as bool,
      json['error'] as bool,
      json['duration'] as String,
    );
