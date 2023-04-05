import 'package:get/get.dart';
import 'package:my_manga_app/controllers/add_manga/add_manga_controller.dart';
import 'package:flutter/material.dart';

class SinopseField extends StatelessWidget {
  const SinopseField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddMangaController>();

    return TextFormField(
      controller: controller.sinopseController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        alignLabelWithHint: true,
        labelText: 'Sinopse',
      ),
      maxLength: 200,
      maxLines: 20,
    );
  }
}
