import 'package:flutter/material.dart';
import 'package:ic_calculator/core/models/calc_history_model.dart';

/// 計算結果履歴の状態管理アクセス用Widget
class CalcHistory extends StatefulWidget {
  const CalcHistory({
    super.key,
    required this.child,
    this.calcHistory,
  });

  final Widget child;
  final CalcHistoryModel? calcHistory;

  /// ofコンストラクタ
  /// contextからInheritedWidgetを遡って取得
  static CalcHistoryState of(BuildContext context,
          {bool rebuild = true}) =>
      rebuild
          ? context
              .dependOnInheritedWidgetOfExactType<_CalcHistoryInherited>()!
              .data
          : (context
                  .getElementForInheritedWidgetOfExactType<
                      _CalcHistoryInherited>()!
                  .widget as _CalcHistoryInherited)
              .data;

  @override
  State<CalcHistory> createState() => CalcHistoryState();
}

class CalcHistoryState extends State<CalcHistory> {
  late CalcHistoryModel calcHistoryData;

  CalcHistoryState();

  /// CalcHisotryへ計算結果追加
  void addCalcHistory(CalcHistoryResultModel result) =>
      calcHistoryData.history.add(result);

  @override
  void initState() {
    super.initState();
    calcHistoryData = widget.calcHistory ?? CalcHistoryModel.empty();
  }

  @override
  Widget build(BuildContext context) {
    return _CalcHistoryInherited(data: this, child: widget.child);
  }
}

/// 計算結果履歴の状態管理用Widget
class _CalcHistoryInherited extends InheritedWidget {
  const _CalcHistoryInherited({
    required this.data,
    required super.child,
  });

  // 計算履歴
  final CalcHistoryState data;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
