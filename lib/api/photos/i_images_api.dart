import 'package:flutter_api/entities/image_entity.dart';
import 'package:flutter_api/entities/image_statistics_entity.dart';

abstract class IImagesApi {
  Future<List<ImageEntity>> getImages();
  Future<ImageStatisticsEntity> getImageStatistics(String id);
}
