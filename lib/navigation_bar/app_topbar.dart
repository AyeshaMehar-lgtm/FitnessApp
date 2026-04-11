import 'package:flutter/material.dart';
import '../main.dart';

class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showDrawer;

  const AppTopBar({Key? key, required this.title, this.showDrawer = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: Text(title),

      leading: showDrawer
          ? IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      )
          : (Navigator.canPop(context)
          ? IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      )
          : null),

      actions: [
        IconButton(
          icon: const Icon(Icons.dark_mode),
          onPressed: () {
            final appState = MyApp.of(context);
            if (appState != null) {
              appState.toggleTheme();
            }
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}