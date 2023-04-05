import 'package:get/get.dart';
import 'package:my_manga_app/models/manga/manga.dart';
import 'package:my_manga_app/views/add_manga/add_manga_view.dart';

enum HomeViewStatus { loading, success }

class HomeController extends GetxController {
  HomeController();

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 10)).then((_) {
      currentViewStatus.value = HomeViewStatus.success;
    });
    super.onInit();
  }

  Rx<HomeViewStatus> currentViewStatus = HomeViewStatus.loading.obs;

  final mangaCategories = [
    'Todos',
    'Lendo',
    'Favoritos',
  ];

  final mangas = <Manga>[].obs;

  void navigateToAddManga() {
    Get.to(() => const AddMangaView());
  }
}
