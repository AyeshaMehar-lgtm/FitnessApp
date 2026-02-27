import 'package:fitness_app/screens/auth/home_screen.dart';
import 'package:flutter/material.dart';
import '../../widgets/meal_card.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/next_navigation.dart';
import 'package:fitness_app/screens/profile/age_screen.dart';

class AddNewMeal extends StatefulWidget {
  const AddNewMeal({super.key});

  @override
  State<AddNewMeal> createState() => _AddNewMealState();
}

class _AddNewMealState extends State<AddNewMeal> {
  int selectedMeal = 1;
  double protein = 20;
  double carbs = 22;
  double fats = 15;

  int selectedInputOption = 0;

  // ✅ Meal select karne par slider values update karna
  void updateMacrosByMeal(int mealIndex) {
    setState(() {
      selectedMeal = mealIndex;

      if (mealIndex == 0) {
        // Breakfast
        protein = 25;
        carbs = 20;
        fats = 10;
      } else if (mealIndex == 1) {
        // Dinner
        protein = 30;
        carbs = 15;
        fats = 20;
      } else {
        // Snack
        protein = 15;
        carbs = 25;
        fats = 12;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isKeyboardOpen =
        MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,

      /// ✅ Continue Button Keyboard Safe
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 12,
        ),
        child: NextNavigation(
          nextScreen: const AgeScreen(),
          buttonText: "Continue",
        ),
      ),

      body: Column(
        children: [

          /// 🔥 HEADER
          SafeArea(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// Back + Title
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => const HomeScreen()),
                          );
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        "Add New Meal",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// Manual / AI Toggle
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => selectedInputOption = 0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(
                              color: selectedInputOption == 0 ? Colors.white70 : Colors.grey[800],
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: const Center(
                              child: Text(
                                "Manual",
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => selectedInputOption = 1),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(
                              color: selectedInputOption == 1 ? Colors.white70 : Colors.grey[800],
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: const Center(
                              child: Text(
                                "AI Scan",
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          /// BODY
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// Meal Name
                  const Text(
                    "Meal Name",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 5),
                  const CustomTextField(
                    hintText: "Enter your meal name...",
                    icon: Icons.restaurant,
                  ),

                  const SizedBox(height: 15),

                  /// Meal Type
                  const Text(
                    "Meal Type",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 8),

                  Row(
                    children: [
                      Expanded(
                        child: MealCard(
                          title: "Breakfast",
                          selected: selectedMeal == 0,
                          onTap: () => updateMacrosByMeal(0),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: MealCard(
                          title: "Dinner",
                          selected: selectedMeal == 1,
                          onTap: () => updateMacrosByMeal(1),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: MealCard(
                          title: "Snack",
                          selected: selectedMeal == 2,
                          onTap: () => updateMacrosByMeal(2),
                        ),
                      ),
                    ],
                  ),

                  /// 🔥 Sliders Hide When Keyboard Open
                  if (!isKeyboardOpen) ...[
                    const SizedBox(height: 10),
                    buildSlider("Total Protein", protein, (value) => setState(() => protein = value)),
                    buildSlider("Total Carbs", carbs, (value) => setState(() => carbs = value)),
                    buildSlider("Total Fats", fats, (value) => setState(() => fats = value)),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// SLIDER WITH LABELS
  Widget buildSlider(String title, double value, Function(double) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title (${value.toInt()}g)", // 👈 show current value
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 5),
        Slider(
          value: value,
          min: 10,
          max: 30,
          divisions: 20,
          activeColor: Colors.orange,
          onChanged: onChanged,
        ),
        /// 10 20 30 Labels
        Row(
          children: const [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("10", style: TextStyle(fontSize: 12, color: Colors.grey)),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text("20", style: TextStyle(fontSize: 12, color: Colors.grey)),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text("30", style: TextStyle(fontSize: 12, color: Colors.grey)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}