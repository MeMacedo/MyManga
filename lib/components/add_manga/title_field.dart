import 'package:get/get.dart';
import 'package:my_manga_app/controllers/add_manga/add_manga_controller.dart';
import 'package:flutter/material.dart';
import 'package:my_manga_app/utils/extensions.dart';

class TitleField extends StatelessWidget {
  const TitleField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddMangaController>();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller.titleController.value,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor, dê um título';
          }
          return null;
        },
        onChanged: (value) {
          controller.isEnabled.value = !value.isNullOrEmpty();
        },
        decoration: const InputDecoration(
            border: OutlineInputBorder(), labelText: 'Título'),
      ),
    );
  }
}
