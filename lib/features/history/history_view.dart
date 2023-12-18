import 'package:flutter/material.dart';
import 'package:ic_calculator/features/history/history_presenter.dart';
import 'package:ic_calculator/features/history/widgets/calc_history_item.dart';

class HistoryView extends StatelessWidget {
  HistoryView({super.key});

  final HistoryPresenter presenter = HistoryPresenter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (final item in mock)
                    CalculationHistoryItem(
                        calculationDate: item.$1,
                        calculationExpression: item.$2,
                        calculationResult: item.$3),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => presenter.backPage(context),
        child: const Icon(Icons.calculate),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}

List<(String, String, String)> mock = [
  ('2023/12/01 01:01:01', '1 + 2 + 3', '6'),
  ('2023/12/01 01:01:01', '1 + 2 + 3', '6'),
  ('2023/12/01 01:01:01', '1 + 2 + 3', '6'),
  ('2023/12/01 01:01:01', '1 + 2 + 3', '6'),
  ('2023/12/01 01:01:01', '1 + 2 + 3', '6'),
  ('2023/12/01 01:01:01', '1 + 2 + 3', '6'),
  ('2023/12/01 01:01:01', '1 + 2 + 3', '6'),
  ('2023/12/01 01:01:01', '1 + 2 + 3', '6'),
  ('2023/12/01 01:01:01', '1 + 2 + 3', '6'),
  ('2023/12/01 01:01:01', '1 + 2 + 3', '6'),
  ('2023/12/01 01:01:01', '1 + 2 + 3', '6'),
  ('2023/12/01 01:01:01', '1 + 2 + 3', '6'),
];
