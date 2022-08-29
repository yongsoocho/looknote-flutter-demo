import 'package:json_annotation/json_annotation.dart';

part 'base_model.g.dart';

@JsonSerializable(genericArgumentFactories: true, createToJson: false)
class BaseModel<T> {
  @JsonKey(name: 'data')
  final T data;

  @JsonKey(name: 'success')
  final bool success;

  @JsonKey(name: 'error')
  final bool error;

  @JsonKey(name: 'duration')
  final String duration;


  @JsonKey(name: 'statusCode')
  final int statusCode;

  BaseModel(
      this.data, this.statusCode, this.success, this.error, this.duration);

  factory BaseModel.fromJson(
    Map<String, dynamic> json,
    Function(Map<String, dynamic>) fromJsonT,
  ) => _$BaseModelFromJson(
        json,
        (json) => fromJsonT(json as Map<String, dynamic>),
      );
}
