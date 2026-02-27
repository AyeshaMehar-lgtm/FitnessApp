import 'package:fitness_app/screens/profile/goal_screen.dart';
import 'package:flutter/material.dart';
import '../../widgets/profile/gender_card.dart';
import '../../widgets/next_navigation.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Assessment',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              '4 of 6',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'What is your gender?',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),

            /// Gender Cards
            GenderCard(
              title: 'Male',
              imagePath: 'assets/images/male.png',
              isSelected: selectedGender == 'Male',
              onTap: () => setState(() => selectedGender = 'Male'),
            ),
            const SizedBox(height: 16),
            GenderCard(
              title: 'Female',
              imagePath: 'assets/images/female.png',
              isSelected: selectedGender == 'Female',
              onTap: () => setState(() => selectedGender = 'Female'),
            ),

            const SizedBox(height: 40),

            /// Skip Button
            GestureDetector(
              onTap: () => setState(() => selectedGender = null),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.orange[50],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    'Prefer to skip, thanks! ✖',
                    style: TextStyle(
                        color: Colors.orange, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// Continue Button via NextNavigation
            NextNavigation(
              nextScreen: const GoalScreen(),
              buttonText: 'Continue →',
            ),
          ],
        ),
      ),
    );
  }
}