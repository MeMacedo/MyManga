import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_manga_app/components/common/my_manga_scaffold.dart';
import 'package:my_manga_app/components/manga_info/manga_info_card.dart';
import 'package:my_manga_app/controllers/manga_info/manga_info_controller.dart';
import 'package:my_manga_app/models/manga/chapter.dart';
import 'package:my_manga_app/theme/app_colors.dart';
import 'package:my_manga_app/theme/values.dart';
import 'package:my_manga_app/utils/extensions.dart';

class MangaInfoView extends GetView<MangaInfoController> {
  const MangaInfoView({Key? key}) : super(key: key);

  //Capitulos mockados para efeito de teste. Melhorias por vir

  final chapters = const [
    MangaChapter(chapterNumber: 1, url: 'asdasa'),
    MangaChapter(chapterNumber: 2),
    MangaChapter(chapterNumber: 3),
  ];

  Widget _getMangaChaptersList() {
    return ListView.builder(
      itemCount: 4,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return Container(
            color: AppColors.font,
            child: Text(
              'Capítulos',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: Values.fontSize.large),
            ),
          );
        }
        return Row(
          children: [
            Text(
              'Capítulo ${chapters[index - 1].chapterNumber}',
              style: TextStyle(
                  color: AppColors.font,
                  fontSize: Values.fontSize.medium,
                  decoration: !chapters[index - 1].url.isNullOrEmpty()
                      ? TextDecoration.underline
                      : null),
            )
          ],
        );
      },
    );
  }

  Widget _getMangaInfo() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: MangaInfoCard(manga: controller.manga!),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MyMangaScaffold(
      title: controller.manga?.title ?? '',
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
        ),
        color: AppColors.font,
        onPressed: () {
          Get.back();
        },
      ),
      child: Column(
        children: [_getMangaInfo(), Expanded(child: _getMangaChaptersList())],
      ),
    );
  }
}
