// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostReceiveList _$PostReceiveListFromJson(Map<String, dynamic> json) =>
    PostReceiveList(
      posts: (json['posts'] as List<dynamic>)
          .map((e) => PostReceives.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PostReceiveListToJson(PostReceiveList instance) =>
    <String, dynamic>{
      'posts': instance.posts,
    };

PostReceives _$PostReceivesFromJson(Map<String, dynamic> json) => PostReceives(
      postId: json['postId'] as int,
      tagId: json['tagId'] as int,
      post: PostModel.fromJson(json['post'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostReceivesToJson(PostReceives instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'tagId': instance.tagId,
      'post': instance.post,
    };

LikedUser _$LikedUserFromJson(Map<String, dynamic> json) => LikedUser(
      authorId: json['authorId'] as int,
      postId: json['postId'] as int,
      author: UserProfile.fromJson(json['author'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LikedUserToJson(LikedUser instance) => <String, dynamic>{
      'authorId': instance.authorId,
      'postId': instance.postId,
      'author': instance.author,
    };

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => UserProfile(
      authorId: json['authorId'] as String?,
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String?,
      nickname: json['nickname'] as String,
    );

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'authorId': instance.authorId,
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'nickname': instance.nickname,
    };

_$_PostModel _$$_PostModelFromJson(Map<String, dynamic> json) => _$_PostModel(
      postId: json['post_id'] as int? ?? 0,
      updatedAt: json['updated_at'] as String? ?? '',
      imageURL: (json['imageURL'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      scrap: json['scrap'] as int? ?? 0,
      comment: json['comment'] as int? ?? 0,
      isScrap: json['is_scrap'] as bool? ?? false,
    );

Map<String, dynamic> _$$_PostModelToJson(_$_PostModel instance) =>
    <String, dynamic>{
      'post_id': instance.postId,
      'updated_at': instance.updatedAt,
      'imageURL': instance.imageURL,
      'scrap': instance.scrap,
      'comment': instance.comment,
      'is_scrap': instance.isScrap,
    };
