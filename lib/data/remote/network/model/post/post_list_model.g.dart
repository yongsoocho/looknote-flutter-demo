// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostListModel _$$_PostListModelFromJson(Map<String, dynamic> json) =>
    _$_PostListModel(
      posts: (json['posts'] as List<dynamic>?)
          ?.map((e) => PostModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagenation: json['pagenation'] == null
          ? null
          : PaginationModel.fromJson(
              json['pagenation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PostListModelToJson(_$_PostListModel instance) =>
    <String, dynamic>{
      'posts': instance.posts,
      'pagenation': instance.pagenation,
    };
