import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_manga_app/controllers/add_manga/add_manga_controller.dart';
import 'package:my_manga_app/utils/extensions.dart';

class ImageField extends StatelessWidget {
  const ImageField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddMangaController>();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller.imageUrlController,
        onChanged: (value) {
          controller.hasImage.value = !value.isNullOrEmpty();
        },
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Capa',
        ),
      ),
    );
  }
}
