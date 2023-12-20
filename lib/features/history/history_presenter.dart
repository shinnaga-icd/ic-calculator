import 'package:flutter/material.dart';
import 'package:ic_calculator/core/models/calc_history_model.dart';
import 'package:ic_calculator/core/state/calc_history.dart';

class HistoryPresenter {
  /// 計算履歴取得
  CalcHistoryModel getCalcHistory(BuildContext context) =>
      CalcHistory.of(context).calcHistoryModel;
}
