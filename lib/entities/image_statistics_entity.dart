class ImageStatisticsEntity {
  ImageStatisticsEntity({
    required this.id,
    required this.views,
    required this.downloads,
    required this.likes,
  });

  final String id;
  final int views;
  final int downloads;
  final int likes;
}
