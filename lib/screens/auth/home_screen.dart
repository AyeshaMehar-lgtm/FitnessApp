import 'package:flutter/material.dart';
import 'package:fitness_app/widgets/home/home_header.dart';
import 'package:fitness_app/widgets/home/category_chip.dart';
import 'package:fitness_app/widgets/home/workout_card.dart';
import 'package:fitness_app/widgets/home/diet_card.dart';
import 'package:fitness_app/widgets/home/activity_card.dart';
import 'package:fitness_app/widgets/home/ai_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int selectedCategoryIndex = 0;

  final List<String> categories = [
    "Hydration",
    "Score",
    "Calorie"
  ];

  Widget sectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("$title See All Clicked")),
            );
          },
          child: const Text("See All",
              style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.w500)),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const HomeHeader(),
              const SizedBox(height: 24),

              /// Browse Category
              sectionTitle("Browse Category"),
              const SizedBox(height: 12),

              Row(
                children: List.generate(
                  categories.length,
                      (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategoryIndex = index;
                      });
                    },
                    child: CategoryChip(
                      title: categories[index],
                      active: selectedCategoryIndex == index,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              /// Workouts
              sectionTitle("Workouts"),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  print("Workout Clicked");
                },
                child: const WorkoutCard(),
              ),

              const SizedBox(height: 24),

              /// Diet
              sectionTitle("Diet & Nutrition"),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  print("Diet Clicked");
                },
                child: const DietCard(),
              ),

              const SizedBox(height: 24),

              /// Activities
              sectionTitle("Activities"),
              const SizedBox(height: 12),
              const ActivityCard(),

              const SizedBox(height: 24),

              /// AI Coach
              sectionTitle("Virtual AI Coach"),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  print("AI Coach Clicked");
                },
                child: const AiCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

