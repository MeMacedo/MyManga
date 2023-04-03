import 'package:my_manga_app/models/manga/manga.dart';

class User {
  final int id;
  final String firstName;
  final List<Manga?> mangaList;

  const User({
    required this.id,
    required this.firstName,
    this.mangaList = const [],
  });
}
