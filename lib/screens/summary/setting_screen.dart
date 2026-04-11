import 'package:fitness_app/widgets/summary/icon_box.dart';
import 'package:fitness_app/widgets/summary/section_title.dart';
import 'package:fitness_app/widgets/summary/setting_tile.dart';
import 'package:flutter/material.dart';
import 'notification_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkMode = true;

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
                  const SectionTitle(title: "General"),
                  SettingTile(
                    icon: Icons.notifications_none,
                    title: "Notification",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                          const NotificationsScreen(),
                        ),
                      );
                    },
                  ),

                  const SettingTile(
                    icon: Icons.person_outline,
                    title: "Personal Information",
                  ),

                  const SettingTile(
                    icon: Icons.phone_outlined,
                    title: "Coach Contact",
                  ),

                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        const IconBox(icon: Icons.dark_mode_outlined),
                        const SizedBox(width: 15),
                        const Expanded(
                          child: Text(
                            "Dark Mode",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Switch(
                          value: isDarkMode,
                          activeColor: Colors.orange,
                          onChanged: (value) {
                            setState(() {
                              isDarkMode = value;
                            });
                          },
                        )
                      ],
                    ),
                  ),

                  const SettingTile(
                    icon: Icons.lock_outline,
                    title: "Linked Devices",
                  ),

                  const SizedBox(height: 10),

                  const SectionTitle(title: "Security & Privacy"),

                  const SettingTile(
                    icon: Icons.lock,
                    title: "Main Security",
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
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.arrow_back, color: Colors.white),
            ),
          ),
          const SizedBox(width: 10),
          const Text(
            "Settings",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}