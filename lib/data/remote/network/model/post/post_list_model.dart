import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looknote/data/remote/network/model/base/pagination/pagination_model.dart';
import 'package:looknote/data/remote/network/model/post/post_model.dart';

part 'post_list_model.freezed.dart';

part 'post_list_model.g.dart';

@freezed
class PostListModel with _$PostListModel {
  factory PostListModel({List<PostModel>? posts, PaginationModel? pagenation}) =
      _PostListModel;

  factory PostListModel.fromJson(Map<String, dynamic> json) =>
      _$PostListModelFromJson(json);
}
