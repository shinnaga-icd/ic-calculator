import 'package:flutter/material.dart';

class CalculationHistoryItem extends StatelessWidget {
  final String calculationDate;
  final String calculationExpression;
  final String calculationResult;

  const CalculationHistoryItem({
    super.key,
    required this.calculationDate,
    required this.calculationExpression,
    required this.calculationResult,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '計算日時: $calculationDate',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text('計算式: $calculationExpression'),
          const SizedBox(height: 8),
          Text('計算結果: $calculationResult'),
        ],
      ),
    );
  }
}
