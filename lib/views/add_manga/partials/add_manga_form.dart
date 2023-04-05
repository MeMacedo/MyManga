import 'package:get/get.dart';
import 'package:my_manga_app/components/add_manga/add_manga_button.dart';
import 'package:my_manga_app/components/add_manga/chapters_field.dart';
import 'package:my_manga_app/components/add_manga/favorite_checkbox.dart';
import 'package:my_manga_app/components/add_manga/image_field.dart';
import 'package:my_manga_app/components/add_manga/read_chapters_field.dart';
import 'package:my_manga_app/components/add_manga/reading_checkbox.dart';
import 'package:my_manga_app/components/add_manga/sinopse_field.dart';
import 'package:my_manga_app/components/add_manga/title_field.dart';
import 'package:flutter/material.dart';
import 'package:my_manga_app/constants/common/icons.dart';
import 'package:my_manga_app/controllers/add_manga/add_manga_controller.dart';
import 'package:my_manga_app/utils/extensions.dart';

class AddMangaForm extends StatefulWidget {
  const AddMangaForm({Key? key}) : super(key: key);

  @override
  State<AddMangaForm> createState() => _AddMangaFormState();
}

class _AddMangaFormState extends State<AddMangaForm> {
  final controller = Get.find<AddMangaController>();

  Widget _getMangaCoverImage() {
    return SizedBox(
      height: 100,
      width: 100,
      child: FittedBox(
        fit: BoxFit.fill,
        child: controller.imageUrlController.text.isNullOrEmpty()
            ? const Icon(Icons.image)
            : Image.network(controller.imageUrlController.text),
        //TODO lidar com exception das imagens
        //tODO Loading enquanto iamgem carrega
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Get.back();
                },
              )
            ],
          ),
          Row(
            children: [
              Obx(
                () => controller.hasImage.value
                    ? _getMangaCoverImage()
                    : const Icon(
                        Icons.add_a_photo_rounded,
                        size: 100,
                      ),
              ),
              const Expanded(child: TitleField()),
            ],
          ),
          const ImageField(),
          const SinopseField(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ReadChaptersField(),
              ChaptersField(),
            ],
          ),
          Row(children: const [
            Expanded(child: ReadingCheckBox()),
            Expanded(child: FavoriteCheckBox()),
          ]),
          const AddMangaButton(),
        ],
      ),
    );
  }
}
