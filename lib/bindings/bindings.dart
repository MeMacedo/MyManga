import 'package:get/get.dart';
import 'package:my_manga_app/bindings/add_manga/add_manga_binding.dart';
import 'package:my_manga_app/bindings/home/home_binding.dart';
import 'package:my_manga_app/bindings/manga_info/manga_info_binding.dart';

class InitialBinding implements Bindings {
  final bindings = <Bindings>[
    HomeBinding(),
    AddMangaBinding(),
    MangaInfoBinding(),
  ];

  @override
  void dependencies() {
    for (final binding in bindings) {
      binding.dependencies();
    }
  }
}
