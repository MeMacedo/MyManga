import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_manga_app/bindings/bindings.dart';
import 'package:my_manga_app/constants/common/strings.dart';
import 'package:my_manga_app/theme/values.dart';
import 'package:my_manga_app/theme/app_colors.dart';
import 'package:my_manga_app/views/splash/splashscreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Strings.myManga,
      initialBinding: InitialBinding(),
      theme: ThemeData(
        primaryColor: AppColors.primary,
        fontFamily: 'Inconsolata',
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primary,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: AppColors.font,
            fontWeight: FontWeight.bold,
            fontSize: Values.fontSize.extraLarge,
            fontFamily: 'Inconsolata',
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
