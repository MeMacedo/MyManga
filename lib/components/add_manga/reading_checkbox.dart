import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_manga_app/constants/common/strings.dart';
import 'package:my_manga_app/controllers/add_manga/add_manga_controller.dart';
import 'package:my_manga_app/theme/app_colors.dart';

class ReadingCheckBox extends StatelessWidget {
  const ReadingCheckBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddMangaController>();

    return Obx(
      () => CheckboxListTile(
        activeColor: AppColors.primary,
        title: const Text(
          Strings.reading,
          style: TextStyle(
            color: AppColors.font,
            fontWeight: FontWeight.bold,
          ),
        ),
        value: controller.isReading.value,
        onChanged: (value) {
          controller.isReading.value = !controller.isReading.value;
        },
      ),
    );
  }
}
