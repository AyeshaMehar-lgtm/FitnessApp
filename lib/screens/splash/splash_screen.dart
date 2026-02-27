import 'dart:async';
import 'package:fitness_app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import '../auth/welcome_screen.dart';
import '../auth/home_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    // 3 seconds delay then navigate
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pulseOrange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // 🔹 Logo (replace with your asset image if needed)
            Image.asset(
              "assets/images/logo.png",
              width: 120,
              height: 120,
            ),

            const SizedBox(height: 20),

            // 🔹 App Name
            const Text(
              "Uplift.ai",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 10),

            // 🔹 Tagline
            const Text(
              "Your personal AI fitness coach",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}