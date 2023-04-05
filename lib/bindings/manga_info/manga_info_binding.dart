import 'package:get/get.dart';
import 'package:my_manga_app/controllers/manga_info/manga_info_controller.dart';

class MangaInfoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MangaInfoController>(
      () => MangaInfoController(),
      fenix: true,
    );
  }
}
