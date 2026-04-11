import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ActivityComplete extends StatefulWidget {
  const ActivityComplete({super.key});

  @override
  State<ActivityComplete> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityComplete> {

  double distancePercent = 26;
  double caloriePercent = 24;
  double bpmPercent = 54;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [

              const SizedBox(height: 20),
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: const Icon(Icons.arrow_back_ios_new, size: 18),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "Jogging Completed",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 40),

              SizedBox(
                height: 260,
                child: PieChart(
                  PieChartData(
                    centerSpaceRadius: 70,
                    sectionsSpace: 3,
                    sections: _buildSections(),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _legendItem(const Color(0xffF7941D), "Distance"),
                  const SizedBox(width: 15),
                  _legendItem(const Color(0xff9B7BDB), "Calorie"),
                  const SizedBox(width: 15),
                  _legendItem(const Color(0xff4A4A4A), "BPM"),
                ],
              ),

              const Spacer(),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffE8E1F5),
                  foregroundColor: const Color(0xff6B4BB6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30, vertical: 12),
                ),
                onPressed: () {
                  setState(() {
                    distancePercent = 40;
                    caloriePercent = 30;
                    bpmPercent = 30;
                  });
                },
                child: const Text(
                  "Simulate New Data",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),

              const SizedBox(height: 20),

              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Great! Keep pushing 💪"),
                    ),
                  );
                },
                child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Great, Thanks",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
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

  List<PieChartSectionData> _buildSections() {
    return [
      PieChartSectionData(
        value: distancePercent,
        color: const Color(0xffF7941D),
        radius: 55,
        title: "${distancePercent.toInt()}%",
        titleStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color:Colors.white,
        ),
      ),
      PieChartSectionData(
        value: caloriePercent,
        color: const Color(0xff9B7BDB),
        radius: 55,
        title: "${caloriePercent.toInt()}%",
        titleStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color:Colors.white,
        ),
      ),
      PieChartSectionData(
        value: bpmPercent,
        color: const Color(0xff4A4A4A),
        radius: 55,
        title: "${bpmPercent.toInt()}%",
        titleStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color:Colors.white,
        ),
      ),
    ];
  }

  Widget _legendItem(Color color, String text) {
    return Row(
      children: [
        CircleAvatar(radius: 6, backgroundColor: color),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}