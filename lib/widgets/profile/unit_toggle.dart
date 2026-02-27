import 'package:flutter/material.dart';

class UnitToggle extends StatelessWidget {
  final String selectedUnit;
  final Function(String) onChanged;

  const UnitToggle({
    super.key,
    required this.selectedUnit,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    Widget buildButton(String unit) {
      bool isSelected = selectedUnit == unit;

      return GestureDetector(
        onTap: () => onChanged(unit),
        child: Container(
          width: 120,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected
                ? Colors.white
                : Colors.white.withOpacity(.6),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Text(
            unit,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildButton("Kg"),
        const SizedBox(width: 20),
        buildButton("Lbs"),
      ],
    );
  }
}