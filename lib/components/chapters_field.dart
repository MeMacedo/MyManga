// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:my_manga_app/views/add_manga/add_manga_form_controller.dart';

// class ChaptersField extends StatelessWidget {
//   final GlobalKey<FormState> formKey;

//   ChaptersField(this.formKey, {Key? key}) : super(key: key);

//   final TextEditingController _chaptersController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final AddMangaFormController controller =
//         context.read<AddMangaFormController>();

//     return Expanded(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: TextFormField(
//           controller: _chaptersController,
//           validator: (value) {
//             if (value == null || value.isEmpty) {
//               return null;
//             } else {
//               try {
//                 int.parse(value);
//                 return null;
//               } catch (e) {
//                 return 'Escreva um número';
//               }
//             }
//           },
//           onChanged: (chapters) {
//             controller.newManga.chapters = chapters;
//             controller.chaptersController = _chaptersController;
//             controller.formKey = formKey;
//           },
//           decoration: const InputDecoration(
//             border: OutlineInputBorder(),
//             labelText: 'Qnt. de Capítulos',
//           ),
//           maxLines: 1,
//         ),
//       ),
//     );
//   }
// }
