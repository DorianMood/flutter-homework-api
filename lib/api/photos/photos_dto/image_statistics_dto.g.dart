// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_statistics_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailsDto _$DetailsDtoFromJson(Map<String, dynamic> json) => DetailsDto(
      total: json['total'] as int,
    );

Map<String, dynamic> _$DetailsDtoToJson(DetailsDto instance) =>
    <String, dynamic>{
      'total': instance.total,
    };

ImageStatisticsDto _$ImageStatisticsDtoFromJson(Map<String, dynamic> json) =>
    ImageStatisticsDto(
      id: json['id'] as String,
      views: DetailsDto.fromJson(json['views'] as Map<String, dynamic>),
      downloads: DetailsDto.fromJson(json['downloads'] as Map<String, dynamic>),
      likes: DetailsDto.fromJson(json['likes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ImageStatisticsDtoToJson(ImageStatisticsDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'views': instance.views.toJson(),
      'downloads': instance.downloads.toJson(),
      'likes': instance.likes.toJson(),
    };
