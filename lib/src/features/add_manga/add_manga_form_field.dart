import 'package:flutter/material.dart';

import 'components/favorite_checkbox.dart';
import 'components/read_chapters_field.dart';
import 'components/sinopse_field.dart';
import 'components/chapters_field.dart';
import 'components/title_field.dart';
import 'add_manga_form_controller.dart';
import 'components/add_manga_button.dart';
import 'components/reading_checkbox.dart';

class AddMangaForm extends StatefulWidget {
  const AddMangaForm({Key? key}) : super(key: key);

  @override
  State<AddMangaForm> createState() => _AddMangaFormState();
}

class _AddMangaFormState extends State<AddMangaForm> {
  late final AddMangaFormController controller;

  final _formKey = GlobalKey<FormState>();

  void _postImage() {}

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: IconButton(
                  iconSize: 100.0,
                  icon: const Icon(Icons.add_a_photo_rounded),
                  onPressed: _postImage,
                ),
                flex: 1,
              ),
              TitleField(_formKey),
            ],
          ),
          const SinopseField(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ReadChaptersField(_formKey),
              ChaptersField(_formKey),
            ],
          ),
          Row(children: const [
            ReadingCheckBox(),
            FavoriteCheckBox(),
          ]),
          const AddMangaButton(),
        ],
      ),
    );
  }
}
