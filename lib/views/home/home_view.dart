import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_manga_app/components/common/my_manga_scaffold.dart';
import 'package:my_manga_app/components/home/manga_list_tile.dart';
import 'package:my_manga_app/constants/common/strings.dart';
import 'package:my_manga_app/theme/values.dart';
import 'package:my_manga_app/controllers/home/home_controller.dart';
import 'package:my_manga_app/theme/app_colors.dart';

import '../../controllers/home/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  List<Widget> _getCategoryMangas(category) {
    final mangas =
        controller.mangas.map((manga) => MangaListTile(manga: manga));
    if (category == 'Favoritos') {
      return mangas
          .where((listTile) => (listTile.manga.isFavorite ?? false))
          .toList();
    } else if (category == 'Lendo') {
      return mangas
          .where((listTile) => (listTile.manga.isReading ?? false))
          .toList();
    }
    return mangas.toList();
  }

  List<Widget> _getMangaCategories() {
    if (controller.mangas.isNotEmpty) {
      final categoriesListing = controller.mangaCategories
          .map(
            (category) => ExpansionTile(
              title: Text(category),
              children: _getCategoryMangas(category),
            ),
          )
          .cast<Widget>()
          .toList();
      return categoriesListing;
    }
    return [
      Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'A fim de ler alguma coisa?',
            style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 0.70),
              fontWeight: FontWeight.bold,
              fontFamily: 'Inconsolata',
              fontSize: Values.fontSize.large,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      )
    ];
  }

  _getContent() {
    switch (controller.currentViewStatus.value) {
      case HomeViewStatus.loading:
        return const Center(
          child: CircularProgressIndicator(
            color: AppColors.font,
          ),
        );
      default:
        return Column(
          children: _getMangaCategories(),
        );
    }
  }

  Widget _getView() {
    return SingleChildScrollView(
        child: Obx(
      () => _getContent(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MyMangaScaffold(
        title: Strings.readingList,
        child: _getView(),
        hasFloatingButton: true,
        floatingButtonAction: controller.navigateToAddManga);
  }
}
