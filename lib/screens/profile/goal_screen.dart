import 'package:fitness_app/screens/activity/activity_status.dart';
import 'package:flutter/material.dart';
import '../../widgets/profile/goal_option_card.dart';
import '../../widgets/next_navigation.dart';


class GoalScreen extends StatefulWidget {
  const GoalScreen({super.key});

  @override
  State<GoalScreen> createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  String? selectedGoal;

  final List<Map<String, dynamic>> goals = [
    {"title": "I wanna lose weight", "icon": Icons.fitness_center},
    {"title": "I wanna try AI Coach", "icon": Icons.smart_toy},
    {"title": "I wanna get bulks", "icon": Icons.sports_gymnastics},
    {"title": "I wanna gain endurance", "icon": Icons.show_chart},
    {"title": "Just trying out the app! 👍", "icon": Icons.emoji_emotions},
  ];

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
              '6 of 6',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 10),
        Align(
          alignment: Alignment.center,
          child: RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              children: [
                const TextSpan(text: "What's your fitness\n"),
                WidgetSpan(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 35), // shift right
                    child: const Text(
                      'goal/target?',
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
            const SizedBox(height: 16),

            /// Goal Options
            Expanded(
              child: ListView.builder(
                itemCount: goals.length,
                itemBuilder: (context, index) {
                  final goal = goals[index];
                  return GoalOptionCard(
                    title: goal["title"],
                    icon: goal["icon"],
                    isSelected: selectedGoal == goal["title"],
                    onTap: () => setState(() => selectedGoal = goal["title"]),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            /// Continue Button
            NextNavigation(
              nextScreen: const ActivityStatusScreen(),
              buttonText: 'Continue →',
            ),
          ],
        ),
      ),
    );
  }
}