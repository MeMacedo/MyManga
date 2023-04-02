import 'package:app_tesrt/models/manga.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

enum AddMangaFormState { idle, success, error, loading }

class AddMangaFormController extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController sinopseController = TextEditingController();
  TextEditingController chaptersController = TextEditingController();
  TextEditingController readChaptersController = TextEditingController();
  bool? isReading = false;
  bool? isFavorite = false;

  Manga newManga = Manga('');

  var state = AddMangaFormState.idle;

  Future<void> postManga() async {
    final url = Uri.https(
        'readinglist-app-d7cb6-default-rtdb.firebaseio.com', '/mangas.json');

    if (formKey.currentState == null) {
    } else if (formKey.currentState!.validate()) {
      state = AddMangaFormState.loading;
      notifyListeners();

      try {
        await http.post(url, body: newManga.toJson());
        state = AddMangaFormState.success;
        cleanAll();
        notifyListeners();
      } catch (e) {
        state = AddMangaFormState.error;
        notifyListeners();
      }
    }
  }

  void cleanAll() {
    titleController.clear();
    sinopseController.clear();
    chaptersController.clear();
    readChaptersController.clear();
    newManga.isFavorite = false;
    newManga.isReading = false;
  }
}
