import 'dart:convert';

import 'package:flutter/material.dart';

class Manga {
  const Manga({
    required this.title,
    this.sinopse = '',
    this.readChapters = '',
    this.chapters = '',
    this.imageUrl,
    this.isFavorite = false,
    this.isReading = false,
  });

  final String title;
  final String? sinopse;
  final String? readChapters;
  final String? chapters;
  final String? imageUrl;
  final bool? isReading;
  final bool? isFavorite;

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'sinopse': sinopse,
      'chapters': chapters,
      'readChapters': readChapters,
      'imageUrl': imageUrl,
      'isReading': isReading,
      'isFavorite': isFavorite,
    };
  }

  factory Manga.fromMap(Map<String, dynamic> map) {
    return Manga(title: map['title']);
  }

  String toJson() => json.encode(toMap());

  factory Manga.fromJson(String source) => Manga.fromMap(json.decode(source));
}
