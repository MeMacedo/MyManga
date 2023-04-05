import 'package:flutter/material.dart';
import 'package:my_manga_app/constants/common/icons.dart';
import 'package:my_manga_app/models/manga/manga.dart';
import 'package:my_manga_app/theme/values.dart';
import 'package:my_manga_app/utils/extensions.dart';

class MangaInfoCard extends StatelessWidget {
  const MangaInfoCard({
    required this.manga,
    Key? key,
  }) : super(key: key);

  final Manga manga;

  _getMangaCoverImage() {
    return SizedBox(
      height: 180,
      width: 120,
      child: FittedBox(
        fit: BoxFit.fill,
        child: manga.imageUrl.isNullOrEmpty()
            ? const Icon(Icons.image)
            : Image.network(
                manga.imageUrl!,
              ),
      ),
    );
  }

  Row _getMangaReadChapters() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Capítulos lidos'),
        Text('${manga.readChapters}/${manga.chapters}'),
      ],
    );
  }

  Text _getMangaTitle() {
    return Text(
      manga.title,
      style: TextStyle(
        fontSize: Values.fontSize.large,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  _getSinopse() {
    return Text('${manga.sinopse}');
  }

  Padding _getMangaInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Values.spacing.small!),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getMangaTitle(),
          _getSinopse(),
          const Spacer(),
          _getMangaReadChapters(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(255, 252, 241, 1),
      height: 180,
      child: Row(
        children: [
          _getMangaCoverImage(),
          Expanded(child: _getMangaInfo()),
        ],
      ),
    );
  }
}
