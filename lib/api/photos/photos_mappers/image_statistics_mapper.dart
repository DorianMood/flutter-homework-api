import 'package:flutter_api/api/photos/photos_dto/dto.dart';
import 'package:flutter_api/entities/image_statistics_entity.dart';

class ImageStatisticsMapper {
  static ImageStatisticsEntity map(ImageStatisticsDto dto) {
    return ImageStatisticsEntity(
      id: dto.id,
      urls: dto.urls,
      views: dto.views,
      downloads: dto.downloads,
      likes: dto.likes,
    );
  }
}
