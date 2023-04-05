import 'package:get/get.dart';
import 'package:my_manga_app/controllers/add_manga/add_manga_controller.dart';

class AddMangaBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddMangaController>(
      () => AddMangaController(),
      fenix: true,
    );
  }
}
