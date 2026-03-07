import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget {
  final String title;
  final String duration;
  final String kcal;

  const WorkoutCard({
    super.key,
    required this.title,
    required this.duration,
    required this.kcal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        image: const DecorationImage(
          image: AssetImage("assets/images/strength.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding:
        const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withOpacity(0.85),
              Colors.transparent,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(duration,
                    style: const TextStyle(
                        color: Colors.white70)),
                const SizedBox(width: 12),
                Text(kcal,
                    style: const TextStyle(
                        color: Colors.white70)),
              ],
            ),
            const Spacer(),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              "8 Series Workout",
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}