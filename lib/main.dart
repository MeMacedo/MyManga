import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_manga_app/constants/common/strings.dart';
import 'package:my_manga_app/views/splash/splashscreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: Strings.myManga,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
