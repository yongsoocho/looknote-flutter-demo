import 'package:freezed_annotation/freezed_annotation.dart';
part 'pagination_model.g.dart';
part 'pagination_model.freezed.dart';

@freezed
class PaginationModel with _$PaginationModel {
  factory PaginationModel({
    @Default(0) int size,
    @Default(0) int page,
    @Default(0) int lastPage,
  }) = _PaginationModel;


  factory PaginationModel.fromJson(Map<String, dynamic> json) =>
      _$PaginationModelFromJson(json);
}
