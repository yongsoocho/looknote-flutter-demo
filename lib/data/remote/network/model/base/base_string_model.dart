import 'package:json_annotation/json_annotation.dart';

part 'base_string_model.g.dart';

@JsonSerializable(genericArgumentFactories: true, createToJson: false)
class BaseStringModel<T> {
  @JsonKey(name: 'data')
  final String data;

  @JsonKey(name: 'success')
  final bool success;

  @JsonKey(name: 'error')
  final bool error;

  @JsonKey(name: 'duration')
  final String duration;

  @JsonKey(name: 'statusCode')
  final int statusCode;

  BaseStringModel(
      this.data, this.statusCode, this.success, this.error, this.duration);

  factory BaseStringModel.fromJson(
      Map<String, dynamic> json,
      Function(Map<String, dynamic>) fromJsonT,
      ) => _$BaseStringModelFromJson(
    json,
        (json) => fromJsonT(json as Map<String, dynamic>),
  );
}
