// import 'package:fitness_app/screens/splash/splash_screen.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Fitness App',
//      debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.orange,
//       ),
//       home: SplashScreen(),
//     );
//   }
// }


import 'package:fitness_app/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;

  void toggleTheme() {
    setState(() {
      isDark = !isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness App',
      debugShowCheckedModeBanner: false,
      theme: isDark
          ? ThemeData.dark().copyWith(
        primaryColor: Colors.orange,
        colorScheme:
        ColorScheme.dark(primary: Colors.orange),
      )
          : ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const SplashScreen(),
    );
  }
}