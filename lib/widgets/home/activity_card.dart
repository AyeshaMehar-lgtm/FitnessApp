import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({super.key});

  Widget activityBox(String text, Color color, double rotationAngle) {
    return Transform.rotate(
      angle: rotationAngle,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, 2),
            )
          ],
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            // Center black box (68h), rotated diagonally, thoda chhota karke
            Transform.rotate(
              angle: -0.6, // about -34 degrees
              child: Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                child: const Text(
                  '68h',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
              ),
            ),

            // Top-left orange box "1h" (thoda zyada bahar)
            Positioned(
              top: -19,  // negative to push outside container
              left: -10, // negative to push outside container
              child: activityBox('1h', Colors.orange, 0.3),
            ),

            // Bottom-left red box "7h" (thoda bahar niche aur left)
            Positioned(
              bottom: -18,
              left: -55,
              child: activityBox('7h', Colors.red, -0.4),
            ),

            // Top-right blue box "15h" (thoda upar aur right bahar)
            Positioned(
              top: -10,
              right: -60,
              child: activityBox('15h', Colors.blue, 0.4),
            ),

            // Bottom-right gray box "87h" (thoda niche aur right bahar)
            Positioned(
              bottom: -15,
              right: -17,
              child: Transform.rotate(
                angle: 0.8,
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 3,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: const Text(
                    '87h',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
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