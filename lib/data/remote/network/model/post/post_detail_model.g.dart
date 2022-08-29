// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostDetailModel _$$_PostDetailModelFromJson(Map<String, dynamic> json) =>
    _$_PostDetailModel(
      postId: json['post_id'] as int? ?? 0,
      imageURL: (json['imageURL'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      scrap: json['scrap'] as int? ?? 0,
      isScrap: json['isScrap'] as bool? ?? false,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      comment: json['comment'] as int? ?? 0,
      comments: (json['comments'] as List<dynamic>?)
              ?.map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_PostDetailModelToJson(_$_PostDetailModel instance) =>
    <String, dynamic>{
      'post_id': instance.postId,
      'imageURL': instance.imageURL,
      'scrap': instance.scrap,
      'isScrap': instance.isScrap,
      'user': instance.user,
      'comment': instance.comment,
      'comments': instance.comments,
    };
