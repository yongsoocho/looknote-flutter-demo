import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looknote/data/remote/network/model/base/pagination/pagination_model.dart';
import 'package:looknote/data/remote/network/model/comment/comment_model.dart';

part 'comment_list_model.freezed.dart';

part 'comment_list_model.g.dart';

@freezed
class CommentListModel with _$CommentListModel {
  factory CommentListModel(
      {List<CommentModel>? comments,
      PaginationModel? pagenation}) = _CommentListModel;

  factory CommentListModel.fromJson(Map<String, dynamic> json) =>
      _$CommentListModelFromJson(json);
}
