import 'package:freezed_annotation/freezed_annotation.dart';
part 'error_model.g.dart';
part 'error_model.freezed.dart';

@freezed
class ErrorModel with _$ErrorModel {
  factory ErrorModel({
    @Default(0) int statusCode,
    @Default(false) bool success,
    @Default(false) bool error,
    @Default('') String timestamp,
    @Default('') String data,
  }) = _ErrorModel;


  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelFromJson(json);
}
