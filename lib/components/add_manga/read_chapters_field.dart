import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_manga_app/controllers/add_manga/add_manga_controller.dart';

class ReadChaptersField extends StatelessWidget {
  ReadChaptersField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddMangaController>();

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: controller.readChaptersController,
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
