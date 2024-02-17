import 'package:json_annotation/json_annotation.dart';

part 'image_statistics_dto.g.dart';

@JsonSerializable()
class ImageStatisticsDto {
  const ImageStatisticsDto({
    required this.id,
    required this.views,
    required this.downloads,
    required this.likes,
    required this.urls,
  });

  final String id;
  final int views;
  final int downloads;
  final int likes;
  final Map<String, String> urls;

  factory ImageStatisticsDto.fromJson(Map<String, dynamic> json) =>
      _$ImageStatisticsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ImageStatisticsDtoToJson(this);
}
