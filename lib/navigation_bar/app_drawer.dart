import 'package:fitness_app/screens/summary/setting_screen.dart';
import 'package:flutter/material.dart';
import '../screens/auth/home_screen.dart';
import '../screens/activity/activity_screen.dart';
import '../screens/meal/meal_screen.dart';
import '../screens/profile/profile_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.orange, Colors.deepOrange],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            accountName: const Text(
              "Ayesha Mehar",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            accountEmail: const Text("ayesha@example.com"),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile2.png'),
            ),
          ),

          Expanded(
            child: ListView(
              children: [
                _buildDrawerItem(
                  context,
                  icon: Icons.home,
                  text: "Home",
                  screen: const HomeScreen(),
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.fitness_center,
                  text: "Workouts",
                  screen: const ActivityScreen(),
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.restaurant,
                  text: "Diet Plans",
                  screen: const MealScreen(),
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.person,
                  text: "Profile",
                  screen: const ProfileScreen(),
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.settings,
                  text: "Setting",
                  screen: const SettingsScreen(),
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text("Logout"),
                  onTap: () {
                    Navigator.pop(context);

                  },
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "v1.0.0",
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildDrawerItem(BuildContext context,
      {required IconData icon, required String text, required Widget screen}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: () {
        Navigator.pop(context);

        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => screen),
        );
        },
    );
  }
}