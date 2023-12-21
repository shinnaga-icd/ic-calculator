import 'package:flutter/material.dart';
import 'package:ic_calculator/core/extentions/datetime_extentions.dart';
import 'package:ic_calculator/core/extentions/num_extentions.dart';
import 'package:ic_calculator/features/history/history_presenter.dart';
import 'package:ic_calculator/features/history/widgets/calc_history_item.dart';

class HistoryView extends StatelessWidget {
  HistoryView({super.key});

  final HistoryPresenter presenter = HistoryPresenter();

  @override
  Widget build(BuildContext context) {
    final historyData = presenter.getCalcHistory(context);

    return historyData.history.isEmpty
        ? const Center(child: Text('No Data.'))
        : Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Builder(builder: (context) {
                    return Column(
                      children: [
                        for (final item in historyData.history.reversed)
                          CalcHistoryItem(
                            calcDate: item.execDateTime.toStringWithFormat(),
                            calcExpression: item.formula.join(' '),
                            calcResult: item.result.formatWithCommas(),
                          ),
                      ],
                    );
                  }),
                ),
              ),
            ],
          );
  }
}
