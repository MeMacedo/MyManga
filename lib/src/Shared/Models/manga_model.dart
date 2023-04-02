import 'dart:convert';

import 'package:flutter/material.dart';

class Manga {
  String title;
  String? sinopse;
  String? readChapters;
  String? chapters;
  String? image;
  bool? isReading;
  bool? isFavorite;

  Manga(this.title,
      {this.sinopse = '',
      this.readChapters = '',
      this.chapters = '',
      this.image,
      this.isFavorite = false,
      this.isReading = false});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'sinopse': sinopse,
      'chapters': chapters,
      'readChapters': readChapters,
      'image': image,
      'isReading': isReading,
      'isFavorite': isFavorite,
    };
  }

  factory Manga.fromMap(Map<String, dynamic> map) {
    return Manga(map['title']);
  }

  String toJson() => json.encode(toMap());

  factory Manga.fromJson(String source) => Manga.fromMap(json.decode(source));

  Widget toListTile() {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      leading: (image == null)
          ? Image.asset(
              "assets/free image icon png vector.png",
            )
          : Image.asset(image!),
      trailing: const Icon(
        Icons.close,
        size: 20,
      ),
    );
  }
}
