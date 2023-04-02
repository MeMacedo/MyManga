import 'package:app_tesrt/views/add_manga/add_manga_form_controller.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddMangaButton extends StatelessWidget {
  const AddMangaButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AddMangaFormController>();

    return ElevatedButton(
      onPressed: (controller.state == AddMangaFormState.loading)
          ? null
          : () async {
              await controller.postManga();
              if (controller.state == AddMangaFormState.success) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Manga adicionada à lista'),
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
            },
      child: const Text(
        'Adicionar',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
