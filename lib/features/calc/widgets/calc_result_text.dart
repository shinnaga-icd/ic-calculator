import 'package:flutter/material.dart';

class CalcResultText extends StatelessWidget {
  const CalcResultText({super.key, required this.dispValue});

  final String dispValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      alignment: Alignment.centerRight,
      child: Text(
        dispValue,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
