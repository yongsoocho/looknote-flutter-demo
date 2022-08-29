// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CommentListModel _$$_CommentListModelFromJson(Map<String, dynamic> json) =>
    _$_CommentListModel(
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagenation: json['pagenation'] == null
          ? null
          : PaginationModel.fromJson(
              json['pagenation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CommentListModelToJson(_$_CommentListModel instance) =>
    <String, dynamic>{
      'comments': instance.comments,
      'pagenation': instance.pagenation,
    };
