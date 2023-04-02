import 'package:my_manga_app/views/add_manga/add_manga_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TitleField extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const TitleField(this.formKey, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AddMangaFormController controller =
        context.read<AddMangaFormController>();

    final TextEditingController _titleController = TextEditingController();

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: _titleController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Por favor, dê um título';
            }
            return null;
          },
          onChanged: (title) {
            controller.newManga.title = title;
            controller.formKey = formKey;
            controller.titleController = _titleController;
          },
          decoration: const InputDecoration(
              border: OutlineInputBorder(), labelText: 'Título'),
        ),
      ),
      flex: 2,
    );
  }
}
