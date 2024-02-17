import 'package:flutter/material.dart';

@immutable
class ImageEntity {
  const ImageEntity({
    required this.id,
    required this.urls,
  });

  final String id;
  final Map<String, String> urls;
}
