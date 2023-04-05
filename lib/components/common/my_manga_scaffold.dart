import 'package:flutter/material.dart';
import 'package:my_manga_app/theme/app_colors.dart';

class MyMangaScaffold extends StatelessWidget {
  const MyMangaScaffold({
    Key? key,
    required this.title,
    required this.child,
    this.hasFloatingButton = false,
    this.floatingButtonAction,
    this.hasAppBar = true,
  }) : super(key: key);

  final String title;
  final Widget child;
  final bool hasFloatingButton;
  final Function? floatingButtonAction;
  final bool hasAppBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: hasAppBar
          ? AppBar(
              title: Text(title),
              automaticallyImplyLeading: false,
            )
          : null,
      floatingActionButton: hasFloatingButton
          ? FloatingActionButton(
              child: const Icon(
                Icons.add,
                color: Colors.black54,
              ),
              backgroundColor: AppColors.primary,
              onPressed: () {
                floatingButtonAction?.call();
              },
            )
          : null,
      body: SafeArea(child: child),
    );
  }
}
