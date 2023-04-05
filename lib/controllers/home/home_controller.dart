import 'package:get/get.dart';
import 'package:my_manga_app/models/manga/manga.dart';
import 'package:my_manga_app/views/add_manga/add_manga_page.dart';

enum HomeviewStatus { loading, success }

class HomeController extends GetxController {
  HomeController();

  Rx<HomeviewStatus> currentViewStatus = HomeviewStatus.success.obs;

  final mangaCategories = ['Todos', 'Lendo', 'Favoritos', 'Lidos'];

  final mangas = <Manga>[
    const Manga(
      title: 'One Piece',
      imageUrl:
          'https://animecorner.me/wp-content/uploads/2022/11/jujutsu-kaisen-manga-volume-21.jpg',
      chapters: '1098',
      readChapters: '1097',
    ),
  ].obs;

  void addManga(manga) {
    currentViewStatus.value = HomeviewStatus.loading;

    Future.delayed(const Duration(seconds: 1));

    mangas.add(manga);

    currentViewStatus.value = HomeviewStatus.success;
  }

  void navigateToAddManga() {
    Get.to(() => const AddMangaView());
  }
}
