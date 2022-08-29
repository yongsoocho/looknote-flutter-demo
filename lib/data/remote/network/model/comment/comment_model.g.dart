// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CommentModel _$$_CommentModelFromJson(Map<String, dynamic> json) =>
    _$_CommentModel(
      commentId: json['comment_id'] as int? ?? 0,
      content: json['content'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CommentModelToJson(_$_CommentModel instance) =>
    <String, dynamic>{
      'comment_id': instance.commentId,
      'content': instance.content,
      'updated_at': instance.updatedAt,
      'user': instance.user,
    };
