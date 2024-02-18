import 'package:flutter_api/api/photos/photos_dto/dto.dart';
import 'package:flutter_api/entities/image_statistics_entity.dart';

class ImageStatisticsMapper {
  static ImageStatisticsEntity map(ImageStatisticsDto dto) {
    return ImageStatisticsEntity(
      id: dto.id,
      views: dto.views?.total ?? 0,
      downloads: dto.downloads?.total ?? 0,
      likes: dto.likes?.total ?? 0,
    );
  }
}
