import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looknote/data/remote/network/model/post/post_model.dart';
part 'scrap_model.g.dart';

@JsonSerializable()
class ScrapList {
  List<ScrapModel>? scraps;
  int? lastPage;
  ScrapList({required this.scraps, required this.lastPage});
  factory ScrapList.fromJson(Map<String, dynamic> json) => _$ScrapListFromJson(json);
  Map<String, dynamic> toJson() => _$ScrapListToJson(this);
}

@JsonSerializable()
class ScrapModel {
  PostModel? post;
  ScrapModel({required this.post});
  factory ScrapModel.fromJson(Map<String, dynamic> json) => _$ScrapModelFromJson(json);
  Map<String, dynamic> toJson() => _$ScrapModelToJson(this);
}