import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_manga_app/views/add_manga/add_manga_form_controller.dart';

class ReadChaptersField extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  ReadChaptersField(this.formKey, {Key? key}) : super(key: key);

  final TextEditingController _readChaptersController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = context.read<AddMangaFormController>();

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: _readChaptersController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return null;
            } else {
              try {
                int.parse(value);
                return null;
              } catch (e) {
                return 'Escreva um número';
              }
            }
          },
          onChanged: (readChapters) {
            controller.newManga.readChapters = readChapters;
            controller.readChaptersController = _readChaptersController;
            controller.formKey = formKey;
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Capítulos Lidos',
          ),
          maxLines: 1,
        ),
      ),
    );
  }
}
