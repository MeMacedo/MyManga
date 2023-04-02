import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_tesrt/views/add_manga/add_manga_form_controller.dart';

class FavoriteCheckBox extends StatefulWidget {
  const FavoriteCheckBox({Key? key}) : super(key: key);

  @override
  State<FavoriteCheckBox> createState() => _FavoriteCheckBoxState();
}

class _FavoriteCheckBoxState extends State<FavoriteCheckBox> {
  bool? isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final controller = context.read<AddMangaFormController>();

    return Expanded(
      child: CheckboxListTile(
        activeColor: const Color.fromRGBO(255, 235, 169, 1),
        title: const Text(
          'Favorito?',
          style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 0.7), fontWeight: FontWeight.bold),
        ),
        value: isFavorite,
        onChanged: (value) {
          setState(() {
            isFavorite = value;
          });
          controller.newManga.isFavorite = isFavorite;
          controller.isFavorite = isFavorite;
        },
      ),
    );
  }
}
