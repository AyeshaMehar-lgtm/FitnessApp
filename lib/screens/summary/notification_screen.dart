import 'package:fitness_app/widgets/summary/notification_badge.dart';
import 'package:fitness_app/widgets/summary/notification_tile.dart';
import 'package:fitness_app/widgets/summary/toggle_button.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() =>
      _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool isTodaySelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            header(),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(15),
                children: [
                  const Text(
                    "Earlier Today",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  NotificationTile(
                    icon: Icons.notifications,
                    title: "Unread AI Chatbot Messages",
                    subtitle: "8 new messages from Uplift.ai",
                    color: Colors.grey,
                    trailing: notificationBadge("2"),
                  ),

                  NotificationTile(
                    icon: Icons.bar_chart,
                    title: "Score Increased",
                    subtitle: "Uplift Score is 87",
                    color: Colors.orange,
                    trailing: notificationBadge("8+"),
                  ),

                  const NotificationTile(
                    icon: Icons.water_drop,
                    title: "Drink More Water",
                    subtitle: "You need to drink 1500ml left.",
                    color: Colors.blue,
                    isProgress: true,
                  ),

                  const NotificationTile(
                    icon: Icons.fitness_center,
                    title: "Workout Complete",
                    subtitle: "Upper Body Set Completed",
                    color: Colors.green,
                    trailing: Icon(Icons.check_box),
                  ),

                  const NotificationTile(
                    icon: Icons.local_dining,
                    title: "Nutrition Upgrade",
                    subtitle: "Take 87g of protein!",
                    color: Colors.purple,
                  ),

                  const NotificationTile(
                    icon: Icons.notifications_active,
                    title: "Fitness Data Ready!",
                    subtitle: "Here’s fitness data for November",
                    color: Colors.red,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget header() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xFF1E1E1E),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.arrow_back, color: Colors.white),
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            "Notifications",
            style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 15),

          Row(
            children: [
              Expanded(
                child: ToggleButton(
                  text: "Today",
                  isSelected: isTodaySelected,
                  onTap: () {
                    setState(() {
                      isTodaySelected = true;
                    });
                  },
                ),
              ),
              Expanded(
                child: ToggleButton(
                  text: "Past",
                  isSelected: !isTodaySelected,
                  onTap: () {
                    setState(() {
                      isTodaySelected = false;
                    });
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}



