import 'package:json_annotation/json_annotation.dart';

part 'image_dto.g.dart';

@JsonSerializable()
class ImageDto {
  const ImageDto({
    required this.id,
    required this.urls,
  });

  final String id;
  final Map<String, String> urls;

  factory ImageDto.fromJson(Map<String, dynamic> json) =>
      _$ImageDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ImageDtoToJson(this);
}
