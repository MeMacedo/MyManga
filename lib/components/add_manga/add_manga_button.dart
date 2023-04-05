import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_manga_app/constants/common/strings.dart';
import 'package:my_manga_app/theme/values.dart';
import 'package:my_manga_app/controllers/add_manga/add_manga_controller.dart';
import 'package:my_manga_app/theme/app_colors.dart';
import 'package:my_manga_app/utils/extensions.dart';

class AddMangaButton extends StatelessWidget {
  const AddMangaButton({Key? key}) : super(key: key);

  _showSnackBar(context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(Strings.mangaAdded),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Ok!',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddMangaController>();

    return SizedBox(
      height: 60,
      child: Obx(
        () => ElevatedButton(
          child: Text(
            Strings.add,
            style: TextStyle(
              fontSize: Values.fontSize.large,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: controller.isEnabled.value
                ? AppColors.button
                : AppColors.disabled,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
            ),
          ),
          onPressed: () {
            if ((controller.formKey.currentState?.validate() ?? false) &&
                controller.isEnabled.value) {
              controller.addManga();
              if (controller.currentViewStatus.value ==
                  AddMangaViewStatus.success) {
                _showSnackBar(context);
              }
            }
          },
        ),
      ),
    );
  }
}
