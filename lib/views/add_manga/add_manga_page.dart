import 'package:my_manga_app/views/add_manga/add_manga_form_field.dart';
import 'package:flutter/material.dart';

class AddMidiaPage extends StatefulWidget {
  const AddMidiaPage({Key? key}) : super(key: key);

  @override
  State<AddMidiaPage> createState() => _AddMidiaPageState();
}

class _AddMidiaPageState extends State<AddMidiaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                AddMangaForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //void _postImage() {}

}
