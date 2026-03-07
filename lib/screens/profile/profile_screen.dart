import 'package:flutter/material.dart';
import 'age_screen.dart';
import 'gender_screen.dart';
import 'weight_screen.dart';
import 'goal_screen.dart';
import '../../screens/auth/sign_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // 🔹 Logout Function
  Future<void> logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isLoggedIn", false);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => SignInScreen()),
    );
  }

  // 🔹 Reusable Navigation Tile
  Widget buildTile(BuildContext context, String title, Widget screen) {
    return Card(
      child: ListTile(
        title: Text(title),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => screen),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            SizedBox(height: 20),

            // 🔹 Profile Options
            buildTile(context, "Age", AgeScreen()),
            buildTile(context, "Gender", GenderScreen()),
            buildTile(context, "Weight", WeightScreen()),
            buildTile(context, "Goal", GoalScreen()),

            SizedBox(height: 30),

            // 🔹 Logout Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              onPressed: () => logout(context),
              child: Text(
                  "Logout",
               style:TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}