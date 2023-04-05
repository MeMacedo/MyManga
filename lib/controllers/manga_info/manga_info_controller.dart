import 'package:get/get.dart';
import 'package:my_manga_app/models/manga/manga.dart';

class MangaInfoController extends GetxController {
  Manga? manga;

  @override
  void onInit() {
    manga = Get.arguments['manga'];
    super.onInit();
  }
}
