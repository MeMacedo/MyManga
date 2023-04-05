import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_manga_app/constants/common/icons.dart';
import 'package:my_manga_app/constants/common/strings.dart';
import 'package:my_manga_app/theme/values.dart';
import 'package:my_manga_app/views/home/home_view.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 4)).then((_) {
      Get.off(() => const HomeView());
    });
    super.initState();
  }

  Container _getSplashScreen() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppIcons.open_book,
            height: Values.icons.extraLarge,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: Values.spacing.small!),
          ),
          Text(
            Strings.welcome,
            style: TextStyle(
              color: const Color.fromRGBO(41, 40, 36, 1),
              fontSize: Values.fontSize.extraLarge,
              fontWeight: FontWeight.bold,
              fontFamily: 'Inconsolata',
            ),
          )
        ],
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            Color.fromRGBO(255, 252, 241, 1),
            Color.fromRGBO(255, 248, 222, 1),
            Color.fromRGBO(255, 235, 169, 0.5)
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _getSplashScreen();
  }
}
