import 'package:app_tesrt/components/add_manga_button.dart';
import 'package:app_tesrt/components/chapters_field.dart';
import 'package:app_tesrt/components/favorite_checkbox.dart';
import 'package:app_tesrt/components/read_chapters_field.dart';
import 'package:app_tesrt/components/reading_checkbox.dart';
import 'package:app_tesrt/components/sinopse_field.dart';
import 'package:app_tesrt/components/title_field.dart';
import 'package:app_tesrt/views/add_manga/add_manga_form_controller.dart';
import 'package:flutter/material.dart';

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
