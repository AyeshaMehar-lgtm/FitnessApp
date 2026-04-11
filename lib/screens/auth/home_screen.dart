// import 'package:fitness_app/widgets/home/activity_card.dart';
// import 'package:fitness_app/widgets/home/ai_card.dart';
// import 'package:fitness_app/widgets/home/category_chip.dart';
// import 'package:fitness_app/widgets/home/diet_card.dart';
// import 'package:fitness_app/widgets/home/home_header.dart';
// import 'package:fitness_app/widgets/home/workout_card.dart';
// import 'package:flutter/material.dart';
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   int selectedCategoryIndex = 0;
//
//   final List<String> categories = [
//     "Hydration",
//     "Score",
//     "Calorie",
//   ];
//
//   Widget sectionTitle(String title) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           title,
//           style: const TextStyle(
//               fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         TextButton(
//           onPressed: () {},
//           child: const Text(
//             "See All",
//             style: TextStyle(color: Colors.orange),
//           ),
//         )
//       ],
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffF5F5F5),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const HomeHeader(),
//               const SizedBox(height: 28),
//
//               /// Categories
//               sectionTitle("Browse Category"),
//               const SizedBox(height: 14),
//
//               SizedBox(
//                 height: 45,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: categories.length,
//                   itemBuilder: (context, index) {
//                     return GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           selectedCategoryIndex = index;
//                         });
//                       },
//                       child: CategoryChip(
//                         title: categories[index],
//                         active: selectedCategoryIndex == index,
//                       ),
//                     );
//                   },
//                 ),
//               ),
//
//               const SizedBox(height: 28),
//
//               /// Workouts
//               sectionTitle("Workouts"),
//               const SizedBox(height: 14),
//
//               Material(
//                 borderRadius: BorderRadius.circular(22),
//                 child: InkWell(
//                   borderRadius: BorderRadius.circular(22),
//                   onTap: () {},
//                   child: const WorkoutCard(
//                     title: "Upper Strength 2",
//                     duration: "24 min",
//                     kcal: "412 kcal",
//                   ),
//                 ),
//               ),
//
//               const SizedBox(height: 28),
//
//               /// Diet
//               sectionTitle("Diet & Nutrition"),
//               const SizedBox(height: 14),
//
//               Material(
//                 borderRadius: BorderRadius.circular(22),
//                 child: InkWell(
//                   borderRadius: BorderRadius.circular(22),
//                   onTap: () {},
//                   child: const DietCard(),
//                 ),
//               ),
//
//               const SizedBox(height: 28),
//
//               /// Activities
//               sectionTitle("Activities"),
//               const SizedBox(height: 14),
//               const ActivityCard(),
//
//               const SizedBox(height: 28),
//
//               /// AI Coach
//               sectionTitle("Virtual AI Coach"),
//               const SizedBox(height: 14),
//
//               Material(
//                 borderRadius: BorderRadius.circular(22),
//                 child: InkWell(
//                   borderRadius: BorderRadius.circular(22),
//                   onTap: () {},
//                   child: const AiCard(),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//





import 'package:fitness_app/navigation_bar/app_topbar.dart';
import 'package:fitness_app/navigation_bar/app_drawer.dart';
import 'package:fitness_app/widgets/home/activity_card.dart';
import 'package:fitness_app/widgets/home/ai_card.dart';
import 'package:fitness_app/widgets/home/category_chip.dart';
import 'package:fitness_app/widgets/home/diet_card.dart';
import 'package:fitness_app/widgets/home/home_header.dart';
import 'package:fitness_app/widgets/home/workout_card.dart';
import 'package:flutter/material.dart';

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
    "Calorie",
  ];

  Widget sectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            "See All",
            style: TextStyle(color: Colors.orange),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),

      drawer: const AppDrawer(),

      appBar: const AppTopBar(
        title: "FitnessApp",
        showDrawer: true,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeHeader(),
              const SizedBox(height: 28),

              sectionTitle("Browse Category"),
              const SizedBox(height: 14),

              SizedBox(
                height: 45,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategoryIndex = index;
                        });
                      },
                      child: CategoryChip(
                        title: categories[index],
                        active: selectedCategoryIndex == index,
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 28),

              sectionTitle("Workouts"),
              const SizedBox(height: 14),
              Material(
                borderRadius: BorderRadius.circular(22),
                child: InkWell(
                  borderRadius: BorderRadius.circular(22),
                  onTap: () {},
                  child: const WorkoutCard(
                    title: "Upper Strength 2",
                    duration: "24 min",
                    kcal: "412 kcal",
                  ),
                ),
              ),

              const SizedBox(height: 28),

              sectionTitle("Diet & Nutrition"),
              const SizedBox(height: 14),
              Material(
                borderRadius: BorderRadius.circular(22),
                child: InkWell(
                  borderRadius: BorderRadius.circular(22),
                  onTap: () {},
                  child: const DietCard(),
                ),
              ),

              const SizedBox(height: 28),

              sectionTitle("Activities"),
              const SizedBox(height: 14),
              const ActivityCard(),

              const SizedBox(height: 28),

              sectionTitle("Virtual AI Coach"),
              const SizedBox(height: 14),
              Material(
                borderRadius: BorderRadius.circular(22),
                child: InkWell(
                  borderRadius: BorderRadius.circular(22),
                  onTap: () {},
                  child: const AiCard(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}