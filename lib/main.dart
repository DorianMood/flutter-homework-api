import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api/api/photos/images_api.dart';
import 'package:flutter_api/entities/image_entity.dart';
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
      setState(() {
        images = value;
      });
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: images == null
              ? [const Text('Loading...')]
              : images!.map((item) => Text(item.id)).toList(),
        ),
      ),
    );
  }
}
