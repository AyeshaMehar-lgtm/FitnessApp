import 'package:flutter/material.dart';

class DietCard extends StatelessWidget {
  const DietCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: const [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Salad & Egg",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
                SizedBox(height: 8),
                Text("548 kcal   20min",
                    style: TextStyle(color: Colors.grey))
              ],
            ),
          ),
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage("assets/images/salad.png"),
          )
        ],
      ),
    );
  }
}