import 'package:flutter/material.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {

  bool isWeekly = true;
  int selectedIndex = 1;

  List<double> weeklyData = [70,95,85,65,75,90,70];
  List<double> monthlyData = [80,88,92,70,85,95,78];

  List<String> days = ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"];

  @override
  Widget build(BuildContext context) {

    List<double> currentData = isWeekly ? weeklyData : monthlyData;

    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [

                Container(
                  height: 220,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    image: DecorationImage(
                      image: AssetImage("assets/images/profile_img.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -40,
                  left: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: (){
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Profile Clicked"))
                      );
                    },
                    child: CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.white,
                      child: const CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage("assets/images/profile2.png"),
                      ),
                    ),
                  ),
                )
              ],
            ),

            const SizedBox(height: 50),

            const Text(
              "Makise Kurisu",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Tokyo, Japan", style: TextStyle(color: Colors.grey)),
                SizedBox(width: 15),
                Text("Basic Member", style: TextStyle(color: Colors.grey)),
              ],
            ),

            const SizedBox(height: 25),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 10)
                ],
              ),

              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Row(
                        children: const [
                          Icon(Icons.local_fire_department,color: Colors.orange),
                          SizedBox(width: 8),
                          Text(
                            "Uplift Score",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            isWeekly = !isWeekly;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(isWeekly ? "Weekly" : "Monthly"),
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      currentData.length,
                          (index) => _bar(currentData[index],days[index],index),
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),

              child: Row(
                children: [

                  Expanded(
                    child: _infoCard(
                        Icons.cake,
                        "17yr",
                        "Current Age",
                        Colors.orange,
                            (){
                          _showDialog("Age","17 Years Old");
                        }
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: _infoCard(
                        Icons.monitor_weight,
                        "68kg",
                        "Weight",
                        Colors.blue,
                            (){
                          _showDialog("Weight","68 Kilograms");
                        }
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: _infoCard(
                        Icons.star,
                        "978kcal",
                        "Daily Intake",
                        Colors.red,
                            (){
                          _showDialog("Calories","978 kcal daily intake");
                        }
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
  Widget _bar(double value,String day,int index){

    bool highlight = selectedIndex == index;

    return GestureDetector(

      onTap: (){
        setState(() {
          selectedIndex = index;
        });
      },

      child: Column(
        children: [

          if(highlight)
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              child: Text(
                value.toInt().toString(),
                style: const TextStyle(color: Colors.white,fontSize: 10),
              ),
            ),

          const SizedBox(height: 6),

          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 10,
            height: value,
            decoration: BoxDecoration(
              color: highlight ? Colors.black : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(6),
            ),
          ),

          const SizedBox(height: 6),

          Text(day,style: const TextStyle(fontSize: 12))
        ],
      ),
    );
  }

  Widget _infoCard(IconData icon,String title,String subtitle,Color color,VoidCallback onTap){

    return GestureDetector(

      onTap: onTap,

      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(color: Colors.black12,blurRadius: 8)
          ],
        ),

        child: Column(
          children: [

            Icon(icon,color: color),

            const SizedBox(height: 10),

            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showDialog(String title,String message){

    showDialog(
        context: context,
        builder: (context){

          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: const Text("OK"),
              )
            ],
          );
        }
    );
  }
}