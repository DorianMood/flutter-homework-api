import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api/api/photos/images_api.dart';
import 'package:flutter_api/entities/image_entity.dart';
import 'package:flutter_api/widgets/photo_detailed.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter api homework',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ImageEntity>? images;

  @override
  Widget build(BuildContext context) {
    final httpClient = Dio(
      BaseOptions(
        baseUrl: 'https://api.unsplash.com',
        headers: {'Authorization': 'Client-ID ${dotenv.get('ACCESS_KEY')}'},
      ),
    );

    final imagesApi = ImagesApi(httpClient: httpClient);

    imagesApi.getImages().then((value) {
      if (mounted) {
        setState(() {
          images = value;
        });
      }
    });

    return Scaffold(
      body: ListView(
        children: images == null
            ? [const Text('Loading...')]
            : images!
                .map(
                  (item) => Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    clipBehavior: Clip.antiAlias,
                    elevation: 1,
                    margin: const EdgeInsets.all(4),
                    child: Stack(children: [
                      Image.network(item.urls['regular'] ?? ''),
                      Positioned.fill(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (builder) => PhotoDetailed(
                                    id: item.id,
                                    url: item.urls['regular'] ?? '',
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ]),
                  ),
                )
                .toList(),
      ),
    );
  }
}
