import 'package:flutter_api/api/photos/photos_dto/image_dto.dart';
import 'package:flutter_api/entities/image_entity.dart';

class ImageMapper {
  static ImageEntity map(ImageDto dto) {
    return ImageEntity(
      id: dto.id,
      urls: dto.urls,
    );
  }
}
