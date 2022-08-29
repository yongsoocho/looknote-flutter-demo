import 'package:json_annotation/json_annotation.dart';
part 'base_bool_model.g.dart';

@JsonSerializable(genericArgumentFactories: true, createToJson: false)
class BaseBoolModel<T> {
  @JsonKey(name: 'data')
  final bool data;

  @JsonKey(name: 'success')
  final bool success;

  @JsonKey(name: 'error')
  final bool error;

  @JsonKey(name: 'duration')
  final String duration;

  @JsonKey(name: 'statusCode')
  final int statusCode;

  BaseBoolModel(
      this.data, this.statusCode, this.success, this.error, this.duration);

  factory BaseBoolModel.fromJson(
      Map<String, dynamic> json,
      Function(Map<String, dynamic>) fromJsonT,
      ) => _$BaseBoolModelFromJson(
    json,
        (json) => fromJsonT(json as Map<String, dynamic>),
  );
}
