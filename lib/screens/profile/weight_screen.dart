import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../widgets/back_navigation.dart';
import '../../widgets/profile/unit_toggle.dart';
import '../../widgets/profile/weight_ruler.dart';
import 'gender_screen.dart'; //

class WeightScreen extends StatefulWidget {
  const WeightScreen({super.key});

  @override
  State<WeightScreen> createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {

  String selectedUnit = "Kg";
  double weight = 62;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pulseOrange,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const BackNavigation(),
                  const Text(
                    "Assessment",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text("2 of 6"),

                  )
                ],
              ),

              const SizedBox(height: 40),

              const Text(
                "What’s your current\nweight right now?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 30),

              UnitToggle(
                selectedUnit: selectedUnit,
                onChanged: (value) {
                  setState(() => selectedUnit = value);
                },
              ),

              const SizedBox(height: 50),

              Text(
                "${weight.toInt()} $selectedUnit",
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 20),

              WeightRuler(
                onChanged: (value) {
                  setState(() => weight = value);
                },
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const GenderScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}