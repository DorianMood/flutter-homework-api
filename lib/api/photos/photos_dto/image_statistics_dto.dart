import 'package:json_annotation/json_annotation.dart';

part 'image_statistics_dto.g.dart';

@JsonSerializable()
class DetailsDto {
  const DetailsDto({
    required this.total,
  });

  final int total;

  factory DetailsDto.fromJson(Map<String, dynamic> json) =>
      _$DetailsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DetailsDtoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ImageStatisticsDto {
  const ImageStatisticsDto({
    required this.id,
    required this.views,
    required this.downloads,
    required this.likes,
  });

  final String id;
  final DetailsDto views;
  final DetailsDto downloads;
  final DetailsDto likes;

  factory ImageStatisticsDto.fromJson(Map<String, dynamic> json) =>
      _$ImageStatisticsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ImageStatisticsDtoToJson(this);
}
