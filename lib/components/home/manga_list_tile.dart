import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_manga_app/constants/common/icons.dart';
import 'package:my_manga_app/theme/values.dart';
import 'package:my_manga_app/models/manga/manga.dart';
import 'package:my_manga_app/utils/extensions.dart';
import 'package:my_manga_app/views/manga_info/manga_info_view.dart';

class MangaListTile extends StatelessWidget {
  const MangaListTile({required this.manga, Key? key}) : super(key: key);

  final Manga manga;

  _getMangaCoverImage() {
    return SizedBox(
      height: 100,
      width: 75,
      child: FittedBox(
        fit: BoxFit.fill,
        child: manga.imageUrl.isNullOrEmpty()
            ? Image.asset(AppIcons.image)
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

  Padding _getMangaInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Values.spacing.small!),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _getMangaTitle(),
          _getMangaReadChapters(),
        ],
      ),
    );
  }

  void _goToMangaInfoView() {
    Get.to(() => const MangaInfoView());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(255, 252, 241, 1),
      height: 100,
      child: Row(
        children: [
          _getMangaCoverImage(),
          Expanded(child: _getMangaInfo()),
        ],
      ),
    );
  }
}
