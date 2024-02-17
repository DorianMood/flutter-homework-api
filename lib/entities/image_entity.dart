import 'package:flutter/material.dart';

@immutable
class ImageEntity {
  const ImageEntity({
    required this.id,
    required this.urls,
    required this.description,
  });

  final String id;
  final Map<String, String> urls;
  final String? description;
}
