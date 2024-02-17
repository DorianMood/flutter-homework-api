// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_statistics_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageStatisticsDto _$ImageStatisticsDtoFromJson(Map<String, dynamic> json) =>
    ImageStatisticsDto(
      id: json['id'] as String,
      views: json['views'] as int,
      downloads: json['downloads'] as int,
      likes: json['likes'] as int,
      urls: Map<String, String>.from(json['urls'] as Map),
    );

Map<String, dynamic> _$ImageStatisticsDtoToJson(ImageStatisticsDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'views': instance.views,
      'downloads': instance.downloads,
      'likes': instance.likes,
      'urls': instance.urls,
    };
