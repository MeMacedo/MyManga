import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_manga_app/controllers/home/home_controller.dart';
import 'package:my_manga_app/models/manga/manga.dart';

enum AddMangaViewStatus { loading, success }

class AddMangaController extends GetxController {
  AddMangaController();

  final homeController = Get.find<HomeController>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();
  TextEditingController sinopseController = TextEditingController();
  TextEditingController chaptersController = TextEditingController();
  TextEditingController readChaptersController = TextEditingController();
  Rx<bool> isReading = false.obs;
  Rx<bool> isFavorite = false.obs;

  Rx<bool> isEnabled = false.obs;
  Rx<bool> hasImage = false.obs;

  Rx<AddMangaViewStatus> currentViewStatus = AddMangaViewStatus.success.obs;

  void addManga() {
    final manga = Manga(
      title: titleController.value.text,
      imageUrl: imageUrlController.text,
      sinopse: sinopseController.text,
      chapters: chaptersController.text,
      readChapters: readChaptersController.text,
      isFavorite: isFavorite.value,
      isReading: isReading.value,
    );
    currentViewStatus.value = AddMangaViewStatus.loading;

    Future.delayed(const Duration(seconds: 3));

    homeController.mangas.add(manga);

    currentViewStatus.value = AddMangaViewStatus.success;
  }
}
