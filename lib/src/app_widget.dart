import 'package:app_tesrt/src/features/add_manga/add_manga_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/splash/frontpage.dart';

class MyApp extends StatelessWidget {
  static const title = 'Lista de Leitura';

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AddMangaFormController()),
      ],
      child: MaterialApp(
        title: title,
        theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(255, 235, 169, 1),
                  onPrimary: const Color.fromRGBO(0, 0, 0, 0.7))),
          primaryColor: const Color.fromRGBO(255, 235, 169, 1),
          fontFamily: 'Inconsolata',
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromRGBO(255, 235, 169, 1),
            centerTitle: true,
            titleTextStyle: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 0.70),
                fontWeight: FontWeight.bold,
                fontSize: 26,
                fontFamily: 'Inconsolata'),
          ),
        ),
        home: const FrontPageScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
