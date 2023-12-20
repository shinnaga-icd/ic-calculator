import 'package:flutter/material.dart';

class CalcHistoryItem extends StatelessWidget {
  final String calcDate;
  final String calcExpression;
  final String calcResult;

  const CalcHistoryItem({
    super.key,
    required this.calcDate,
    required this.calcExpression,
    required this.calcResult,
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
            '計算日時: $calcDate',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text('計算式: $calcExpression'),
          const SizedBox(height: 8),
          Text('計算結果: $calcResult'),
        ],
      ),
    );
  }
}
