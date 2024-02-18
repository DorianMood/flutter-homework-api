import 'package:dio/dio.dart';
import 'package:flutter_api/api/photos/i_images_api.dart';
import 'package:flutter_api/api/photos/photos_dto/dto.dart';
import 'package:flutter_api/api/photos/photos_mappers/mappers.dart';
import 'package:flutter_api/entities/image_entity.dart';
import 'package:flutter_api/entities/image_statistics_entity.dart';

class ImagesApi implements IImagesApi {
  const ImagesApi({
    required this.httpClient,
  });

  final Dio httpClient;

  @override
  Future<List<ImageEntity>> getImages() async {
    return httpClient.get('/photos').then((value) {
      return (value.data as List<dynamic>).map((e) => ImageDto.fromJson(e));
    }).then((dto) => dto.map((item) => ImageMapper.map(item)).toList());
  }

  @override
  Future<ImageStatisticsEntity> getImageStatistics(String id) async {
    return httpClient
        .get('/photos/$id/statistics')
        .then((value) {
          return value;
        })
        .then((response) => ImageStatisticsDto.fromJson(response.data))
        .then((dto) => ImageStatisticsMapper.map(dto));
  }
}
