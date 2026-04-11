import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import 'sign_in_screen.dart';
import 'forgot_password_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();

  bool showPasswordError = false;

  bool isEmailHidden = false;
  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;

  void signUp() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }

    if (password != confirmPassword) {
      setState(() {
        showPasswordError = true;
      });
      return;
    }

    setState(() {
      showPasswordError = false;
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ForgotPasswordScreen(),
      ),
    );
  }

  InputDecoration customInputDecoration({
    required String hint,
    required IconData icon,
    Widget? suffix,
  }) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: Icon(icon),

      suffixIcon: suffix,

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.grey,
          width: 1.5,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.pulseOrange,
          width: 2,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),

              Center(
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: AppColors.pulseOrange,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/images/logo.png",
                      width: 50,
                      height: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              const Center(
                child: Text(
                  "Sign Up For Free",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              const Text("Email Address"),
              const SizedBox(height: 8),

              TextField(
                controller: emailController,
                obscureText: isEmailHidden,
                decoration: customInputDecoration(
                  hint: "Enter your email",
                  icon: Icons.email_outlined,
                  suffix: IconButton(
                    icon: Icon(
                      isEmailHidden
                          ? Icons.visibility_off_outlined
                          : Icons.remove_red_eye_outlined,
                    ),
                    onPressed: () {
                      setState(() {
                        isEmailHidden = !isEmailHidden;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 15),

              const Text("Password"),
              const SizedBox(height: 8),

              TextField(
                controller: passwordController,
                obscureText: isPasswordHidden,
                decoration: customInputDecoration(
                  hint: "Enter your password",
                  icon: Icons.lock_outline,
                  suffix: IconButton(
                    icon: Icon(
                      isPasswordHidden
                          ? Icons.remove_red_eye_outlined
                          : Icons.visibility_off_outlined,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordHidden = !isPasswordHidden;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 15),

              const Text("Confirm Password"),
              const SizedBox(height: 8),

              TextField(
                controller: confirmPasswordController,
                obscureText: isConfirmPasswordHidden,
                decoration: customInputDecoration(
                  hint: "Confirm your password",
                  icon: Icons.lock_outline,
                  suffix: IconButton(
                    icon: Icon(
                      isConfirmPasswordHidden
                          ? Icons.remove_red_eye_outlined
                          : Icons.visibility_off_outlined,
                    ),
                    onPressed: () {
                      setState(() {
                        isConfirmPasswordHidden =
                        !isConfirmPasswordHidden;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 10),

              if (showPasswordError)
                Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.red),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.warning, color: Colors.red),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          "Error: Password don't match",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              const SizedBox(height: 60),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: signUp,
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
