import 'package:my_manga_app/views/home/home.dart';
import 'package:flutter/material.dart';

class FrontPageScreen extends StatelessWidget {
  const FrontPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreenPage()),
        ),
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/noun-book-21025.png",
                  height: 60,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                ),
                const Text(
                  'Bem-vindo',
                  style: TextStyle(
                    color: Color.fromRGBO(41, 40, 36, 1),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inconsolata',
                  ),
                )
              ],
            ),
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
        ),
      ),
    );
  }
}
