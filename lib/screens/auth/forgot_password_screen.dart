import 'package:flutter/material.dart';
import 'reset_password_screen.dart'; // Correct import
import '../../widgets/reset_option_tile.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // BACK BUTTON
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios_new),
              ),

              const SizedBox(height: 10),

              const Text(
                "Reset Password",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              const Text(
                "Select what method you'd like to reset.",
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 25),

              // EMAIL
              ResetOptionTile(
                icon: Icons.email_outlined,
                iconBg: Colors.orange,
                title: "Send via Email",
                subtitle: "Seamlessly reset your password via email address.",
                isSelected: selectedIndex == 0,
                onTap: () {
                  setState(() => selectedIndex = 0);
                },
              ),

              // 2FA
              ResetOptionTile(
                icon: Icons.lock_outline,
                iconBg: Colors.blue,
                title: "Send via 2FA",
                subtitle: "Seamlessly reset your password via 2 Factors.",
                isSelected: selectedIndex == 1,
                onTap: () {
                  setState(() => selectedIndex = 1);
                },
              ),

              // GOOGLE AUTH
              ResetOptionTile(
                icon: Icons.local_fire_department_outlined,
                iconBg: Colors.purple,
                title: "Send via Google Auth",
                subtitle: "Seamlessly reset your password via gAuth.",
                isSelected: selectedIndex == 2,
                onTap: () {
                  setState(() => selectedIndex = 2);
                },
              ),

              const Spacer(),

              // RESET PASSWORD BUTTON
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedIndex == -1 ? Colors.grey : Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: selectedIndex == -1
                      ? null
                      : () {
                    // ✅ Navigate to ResetPasswordScreen
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ResetScreen(),
                      ),
                    );
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Reset Password",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}