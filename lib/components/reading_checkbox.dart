import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_manga_app/views/add_manga/add_manga_form_controller.dart';

class ReadingCheckBox extends StatefulWidget {
  const ReadingCheckBox({Key? key}) : super(key: key);

  @override
  State<ReadingCheckBox> createState() => _ReadingCheckBoxState();
}

class _ReadingCheckBoxState extends State<ReadingCheckBox> {
  bool? isReading = false;

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AddMangaFormController>();

    return Expanded(
      child: CheckboxListTile(
        activeColor: const Color.fromRGBO(255, 235, 169, 1),
        title: const Text(
          'Está lendo?',
          style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 0.7), fontWeight: FontWeight.bold),
        ),
        value: isReading,
        onChanged: (value) {
          setState(() {
            isReading = value;
          });
          controller.newManga.isReading = isReading;
          controller.isReading = isReading;
        },
      ),
    );
  }
}
