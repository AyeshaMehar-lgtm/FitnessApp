// import 'package:flutter/material.dart';
// import '../../widgets/next_navigation.dart';
// import 'sign_in_screen.dart';
// import 'sign_up_screen.dart';
//
// class WelcomeScreen extends StatelessWidget {
//   const WelcomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//
//           /// Background Image
//           Container(
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage("assets/images/jym.png"),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//
//           /// Dark Overlay
//           Container(
//             color: Colors.black.withOpacity(0.6),
//           ),
//
//           /// Content
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//
//                 /// Logo
//                 Image.asset(
//                   "assets/images/logo.png",
//                   width: 60,
//                   height: 60,
//                   color: Colors.white,
//                 ),
//
//                 const SizedBox(height: 20),
//
//                 /// Title
//                 const Text(
//                   "Welcome To\nUplift.ai",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 32,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//
//                 const SizedBox(height: 12),
//
//                 /// Subtitle
//                 const Text(
//                   "Your personal fitness AI Assistant 🤖",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Colors.white70,
//                     fontSize: 16,
//                   ),
//                 ),
//
//                 const SizedBox(height: 40),
//
//                 /// ✅ Get Started Button
//                 NextNavigation(
//                   nextScreen: const SignInScreen(),
//                   buttonText: "Get Started",
//                 ),
//
//                 const SizedBox(height: 20),
//
//                 /// Sign In / Sign Up Row
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//
//                     const Text(
//                       "Already have an account? ",
//                       style: TextStyle(color: Colors.white70),
//                     ),
//
//                     /// Sign In
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) => const SignInScreen(),
//                           ),
//                         );
//                       },
//                       child: const Text(
//                         "Sign In",
//                         style: TextStyle(
//                           color: Colors.orange,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//
//                     const SizedBox(width: 10),
//
//                     /// Sign Up
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) => const SignUpScreen(),
//                           ),
//                         );
//                       },
//                       child: const Text(
//                         "Sign Up",
//                         style: TextStyle(
//                           color: Colors.orange,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//
//                 const SizedBox(height: 40),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//

import 'package:flutter/material.dart';
import 'sign_in_screen.dart';
import 'sign_up_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          /// Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/jym.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// Dark Overlay
          Container(
            color: Colors.black.withOpacity(0.6),
          ),

          /// Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                /// Logo
                Image.asset(
                  "assets/images/logo.png",
                  width: 60,
                  height: 60,
                  color: Colors.white,
                ),

                const SizedBox(height: 20),

                /// Title
                const Text(
                  "Welcome To\nUplift.ai",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                /// Subtitle
                const Text(
                  "Your personal fitness AI Assistant 🤖",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 40),

                /// ✅ Get Started Button (direct navigation)
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SignInScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Button white
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 90),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Get Started",
                    style: TextStyle(
                      color: Colors.black, // Text black
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// Sign In / Sign Up Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    const Text(
                      "Already have an account? ",
                      style: TextStyle(color: Colors.white70),
                    ),

                    /// Sign In
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SignInScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    /// Sign Up
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SignUpScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
