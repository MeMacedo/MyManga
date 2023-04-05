import 'package:get/get.dart';
import 'package:my_manga_app/components/add_manga/add_manga_button.dart';
import 'package:my_manga_app/components/common/my_manga_scaffold.dart';
import 'package:my_manga_app/constants/common/strings.dart';
import 'package:my_manga_app/views/add_manga/partials/add_manga_form.dart';
import 'package:flutter/material.dart';

class AddMangaView extends GetView {
  const AddMangaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyMangaScaffold(
      title: Strings.add,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              AddMangaForm(),
            ],
          ),
        ),
      ),
      hasAppBar: false,
      hasFloatingButton: false,
    );
  }

  //void _postImage() {}

}
