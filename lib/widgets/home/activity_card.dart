import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({super.key});

  Widget activityBox(
      String text,
      Color color,
      double rotationAngle,
      ) {
    return Transform.rotate(
      angle: rotationAngle,
      child: Container(
        padding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190, // Increased for safety
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [

            /// Center Black Box
            Transform.rotate(
              angle: -0.6,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 45, vertical: 26),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: const Text(
                  '68h',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ),
            ),

            /// Top Left
            Positioned(
              top: -15,
              left: -25,
              child: activityBox(
                '1h',
                Colors.orange,
                0.3,
              ),
            ),

            /// Bottom Left
            Positioned(
              bottom: -15,
              left: -45,
              child: activityBox(
                '7h',
                Colors.red,
                -0.4,
              ),
            ),

            /// Top Right
            Positioned(
              top: -10,
              right: -60,
              child: activityBox(
                '15h',
                Colors.blue,
                0.4,
              ),
            ),

            /// Bottom Right
            Positioned(
              bottom: -38,
              right: -20,
              child: Transform.rotate(
                angle: 0.8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 19, vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Text(
                    '87h',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}