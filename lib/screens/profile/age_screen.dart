import 'package:flutter/material.dart';
import 'weight_screen.dart';

class AgeScreen extends StatefulWidget {
  const AgeScreen({super.key});

  @override
  State<AgeScreen> createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  final FixedExtentScrollController scrollController =
  FixedExtentScrollController(initialItem: 2);

  int selectedAge = 19;

  final int minAge = 17;
  final int maxAge = 21;

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<int> ages =
    List.generate(maxAge - minAge + 1, (i) => minAge + i);

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: false,

        leading: const BackButton(color: Colors.black),

        titleSpacing: 8, // 👈 thora right shift

        title: const Text(
          'Assessment',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),

        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                '1 of 6',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          )
        ],

        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFEDEDED),
                Color(0xFFD6D6D6),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),

      body: Column(
        children: [
          const SizedBox(height: 32),

          const Text(
            "What’s your Age?",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 40),

          Expanded(
            child: Center(
              child: SizedBox(
                height: 450,
                child: ListWheelScrollView.useDelegate(
                  controller: scrollController,
                  itemExtent: 70,
                  physics: const FixedExtentScrollPhysics(),
                  diameterRatio: 1.8,
                  onSelectedItemChanged: (index) {
                    setState(() {
                      selectedAge = ages[index];
                    });
                  },
                  childDelegate: ListWheelChildBuilderDelegate(
                    childCount: ages.length,
                    builder: (context, index) {
                      final age = ages[index];
                      final bool isSelected = age == selectedAge;

                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.symmetric(horizontal: 100),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.orange
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          age.toString(),
                          style: TextStyle(
                            fontSize: isSelected ? 52 : 28,
                            color: isSelected
                                ? Colors.white
                                : Colors.grey.shade400,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const WeightScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}