import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_manga_app/components/common/my_manga_scaffold.dart';
import 'package:my_manga_app/components/home/manga_list_tile.dart';
import 'package:my_manga_app/constants/common/strings.dart';
import 'package:my_manga_app/controllers/home/home_controller.dart';
import 'package:my_manga_app/theme/app_colors.dart';

import '../../controllers/home/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  List<Widget> _getCategoryMangas() {
    return controller.mangas
        .map((manga) => MangaListTile(manga: manga))
        .toList();
  }

  List<Widget> _getMangaCategories() {
    if (controller.mangas.isNotEmpty) {
      final categoriesListing = controller.mangaCategories
          .map(
            (categories) => ExpansionTile(
              title: Text(categories),
              children: _getCategoryMangas(),
            ),
          )
          .cast<Widget>()
          .toList();
      return categoriesListing;
    }
    return const [
      Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'A fim de ler alguma coisa?',
            style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 0.70),
              fontWeight: FontWeight.bold,
              fontFamily: 'Inconsolata',
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      )
    ];
  }

  _getContent() {
    switch (controller.currentViewStatus.value) {
      case HomeviewStatus.loading:
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
