import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looknote/data/remote/network/model/comment/comment_list_model.dart';
import 'package:looknote/data/remote/network/model/comment/comment_model.dart';
import 'package:looknote/data/remote/network/model/user/user_model.dart';
part 'post_detail_model.g.dart';
part 'post_detail_model.freezed.dart';

@freezed
class PostDetailModel with _$PostDetailModel {
  factory PostDetailModel({
    @JsonKey(name: 'post_id') @Default(0) int postId,
    @Default([]) List<String> imageURL,
    @Default(0) int scrap,
    @Default(false) bool isScrap,
    UserModel? user,
    @Default(0) int comment,
    @Default([]) List<CommentModel> comments,

  }) = _PostDetailModel;


  factory PostDetailModel.fromJson(Map<String, dynamic> json) =>
      _$PostDetailModelFromJson(json);
}
