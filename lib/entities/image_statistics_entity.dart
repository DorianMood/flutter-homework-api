class ImageStatisticsEntity {
  ImageStatisticsEntity({
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
}
