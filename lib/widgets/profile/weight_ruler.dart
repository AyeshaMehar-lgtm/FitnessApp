import 'package:flutter/material.dart';

class WeightRuler extends StatefulWidget {
  final Function(double) onChanged;

  const WeightRuler({super.key, required this.onChanged});

  @override
  State<WeightRuler> createState() => _WeightRulerState();
}

class _WeightRulerState extends State<WeightRuler> {

  final ScrollController _controller = ScrollController();

  final double itemWidth = 18;
  final int minWeight = 40;
  final int maxWeight = 150;

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      double value =
          minWeight + (_controller.offset / itemWidth);

      widget.onChanged(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ListView.builder(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            itemCount: maxWeight - minWeight,
            itemBuilder: (context, index) {

              int value = minWeight + index;
              bool isMajor = value % 5 == 0;

              return SizedBox(
                width: itemWidth,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 3,
                    height: isMajor ? 70 : 35,
                    color: Colors.white,
                  ),
                ),
              );
            },
          ),

          IgnorePointer(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: maxWeight - minWeight,
              itemBuilder: (context, index) {

                int value = minWeight + index;
                bool isMajor = value % 5 == 0;

                return SizedBox(
                  width: itemWidth,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 85),
                      child: isMajor
                          ? Text(
                        value.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      )
                          : const SizedBox(),
                    ),
                  ),
                );
              },
            ),
          ),

          Align(
            alignment:Alignment.bottomCenter,
            child:Padding(
              padding:const EdgeInsets.only(top:10),
              child:Container(
                width:4,
                height:90,
                color:Colors.white,

              ),
            ),
          ),
        ],
      ),
    );
  }
}