import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api/api/photos/images_api.dart';
import 'package:flutter_api/entities/image_statistics_entity.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PhotoDetailed extends StatefulWidget {
  const PhotoDetailed({
    super.key,
    required this.id,
    required this.url,
  });

  final String id;
  final String url;

  @override
  State<PhotoDetailed> createState() => _PhotoDetailedState();
}

class _PhotoDetailedState extends State<PhotoDetailed> {
  ImageStatisticsEntity? image;

  @override
  Widget build(BuildContext context) {
    final httpClient = Dio(
      BaseOptions(
        baseUrl: 'https://api.unsplash.com',
        headers: {'Authorization': 'Client-ID ${dotenv.get('ACCESS_KEY')}'},
      ),
    );

    final imagesApi = ImagesApi(httpClient: httpClient);

    imagesApi.getImageStatistics(widget.id).then((value) {
      if (mounted) {
        setState(() {
          image = value;
        });
      }
    });

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Statistics of ${widget.id}"),
        centerTitle: true,
      ),
      body: Column(children: [
        Image.network(widget.url),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Likes: ${image?.likes.toString() ?? ''}'),
            Text('Views: ${image?.views.toString() ?? ''}'),
            Text('Downloads: ${image?.downloads.toString() ?? ''}'),
          ],
        ),
      ]),
    );
  }
}
