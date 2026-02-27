import 'package:flutter/material.dart';

class ActivityStatusScreen extends StatelessWidget {
  const ActivityStatusScreen({super.key});

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
          'Activity Status',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 20),

            /// Legend Row 1: Running, Jogging, Biking
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                LegendDot(color: Colors.black, label: "Running"),
                LegendDot(color: Colors.orange, label: "Jogging"),
                LegendDot(color: Colors.red, label: "Biking"),
              ],
            ),

            const SizedBox(height: 10),

            /// Legend Row 2: Weightlifting, Yoga
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                LegendDot(color: Colors.blue, label: "Weightlifting"),
                LegendDot(color: Colors.grey, label: "Yoga"),
              ],
            ),

            const SizedBox(height: 40),

            /// Boxes in diagonal
            Expanded(
              child: Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // Big center black box (68h)
                    Positioned(
                      left: 45,
                      top: 150,
                      child: Transform.rotate(
                        angle: 0.9,
                        child: Container(
                          width: 200,
                          height: 140,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            '68h',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),

                    // Top-left red box 7h
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Transform.rotate(
                        angle: 0.9,
                        child: Container(
                          width: 150,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            '7h',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),

                    // Top-right orange box 1h
                    Positioned(
                      right: 0,
                      top: 20,
                      child: Transform.rotate(
                        angle: -0.7,
                        child: Container(
                          width: 150,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            '1h',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),

                    // Bottom-left grey box 87h
                    Positioned(
                      left: 10,
                      bottom: 20,
                      child: Transform.rotate(
                        angle: -0.3,
                        child: Container(
                          width: 130,
                          height: 220,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            '87h',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          ),
                        ),
                      ),
                    ),

                    // Bottom-right blue box 15h
                    Positioned(
                      right: 10,
                      bottom: 0,
                      child: Transform.rotate(
                        angle: 0.7,
                        child: Container(
                          width: 150,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            '15h',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Legend Dot Widget
class LegendDot extends StatelessWidget {
  final Color color;
  final String label;

  const LegendDot({super.key, required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}