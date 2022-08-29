// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scrap_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScrapList _$ScrapListFromJson(Map<String, dynamic> json) => ScrapList(
      scraps: (json['scraps'] as List<dynamic>?)
          ?.map((e) => ScrapModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastPage: json['lastPage'] as int?,
    );

Map<String, dynamic> _$ScrapListToJson(ScrapList instance) => <String, dynamic>{
      'scraps': instance.scraps,
      'lastPage': instance.lastPage,
    };

ScrapModel _$ScrapModelFromJson(Map<String, dynamic> json) => ScrapModel(
      post: json['post'] == null
          ? null
          : PostModel.fromJson(json['post'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ScrapModelToJson(ScrapModel instance) =>
    <String, dynamic>{
      'post': instance.post,
    };
