import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage("assets/images/strength.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black.withOpacity(0.4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Top line: 24 min and 412 kcal
            Row(
              children: const [
                Text(
                  "24 min",
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
                SizedBox(width: 12), // gap between texts
                Text(
                  "412 kcal",
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),

            const Spacer(), // push remaining text to bottom

            /// Bottom-left text
            const Text(
              "Upper Strength 2",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              "8 Series Workout",
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
