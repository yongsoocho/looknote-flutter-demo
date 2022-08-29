import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looknote/data/remote/network/model/user/user_model.dart';
part 'comment_model.g.dart';
part 'comment_model.freezed.dart';

@freezed
class CommentModel with _$CommentModel {
  factory CommentModel({
    @JsonKey(name: 'comment_id') @Default(0) int commentId,
    @Default('') String content,
    @JsonKey(name: 'updated_at') @Default('') String updatedAt,
    UserModel? user,
  }) = _CommentModel;

  factory CommentModel.fromJson(Map<String, dynamic> json) => _$CommentModelFromJson(json);
}
