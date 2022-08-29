import 'package:freezed_annotation/freezed_annotation.dart';
part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
class PostModel with _$PostModel {
  factory PostModel({
    @JsonKey(name: 'post_id') @Default(0) int postId,
    @JsonKey(name: 'updated_at') @Default('') String updatedAt,
    @Default([]) List<String> imageURL,
    @Default(0) int scrap,
    @Default(0) int comment,
    @JsonKey(name: 'is_scrap') @Default(false) bool isScrap,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);
}



@JsonSerializable()
class PostReceiveList {
  List<PostReceives> posts;
  PostReceiveList({required this.posts});
  factory PostReceiveList.fromJson(Map<String, dynamic> json) => _$PostReceiveListFromJson(json);
  Map<String, dynamic> toJson() => _$PostReceiveListToJson(this);
  List<PostModel> convertToPosts() {
    return posts.map((e) => e.post).toList();
  }
}

@JsonSerializable()
class PostReceives {
  int postId;
  int tagId;
  PostModel post;

  PostReceives({required this.postId, required this.tagId, required this.post});

  factory PostReceives.fromJson(Map<String, dynamic> json) => _$PostReceivesFromJson(json);
  Map<String, dynamic> toJson() => _$PostReceivesToJson(this);
}

@JsonSerializable()
class LikedUser {
  int authorId;
  int postId;
  UserProfile author;
  LikedUser({required this.authorId, required this.postId, required this.author});
  factory LikedUser.fromJson(Map<String, dynamic> json) => _$LikedUserFromJson(json);
  Map<String, dynamic> toJson() => _$LikedUserToJson(this);
}

@JsonSerializable()
class UserProfile {
  String? authorId;
  int id;
  String name;
  String? email;
  String nickname;

  UserProfile({
    required this.authorId,
    required this.id,
    required this.name,
    required this.email,
    required this.nickname,
  });
  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);
  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
}
