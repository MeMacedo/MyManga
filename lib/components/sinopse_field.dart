// import 'package:my_manga_app/views/add_manga/add_manga_form_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class SinopseField extends StatelessWidget {
//   const SinopseField({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController _sinopseController = TextEditingController();

//     final controller = context.read<AddMangaFormController>();

//     return TextFormField(
//       controller: _sinopseController,
//       onChanged: (sinopse) {
//         controller.newManga.sinopse = sinopse;
//         controller.sinopseController = _sinopseController;
//       },
//       decoration: const InputDecoration(
//         border: OutlineInputBorder(),
//         alignLabelWithHint: true,
//         labelText: 'Sinopse',
//       ),
//       maxLength: 200,
//       maxLines: 20,
//     );
//   }
// }
