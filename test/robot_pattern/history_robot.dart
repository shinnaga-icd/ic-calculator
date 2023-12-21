import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ic_calculator/core/models/calc_history_model.dart';
import 'package:ic_calculator/core/state/calc_history.dart';
import 'package:ic_calculator/features/history/history_view.dart';
import 'package:ic_calculator/features/history/widgets/calc_history_item.dart';

class HistoryRobot {
  final WidgetTester tester;
  HistoryRobot(this.tester);

  /// 初期化
  Future<void> init({CalcHistoryModel? calcHistory}) async {
    TestWidgetsFlutterBinding.ensureInitialized();

    await tester.pumpWidget(
      MaterialApp(
        home: CalcHistory(
          calcHistory: calcHistory,
          child: HistoryView(),
        ),
      ),
    );
  }

  /// 所定の数の空要素を持つCalcHistoryを取得
  CalcHistoryModel getCalcHistoryEmpty(int recordCount) {
    final historyData =
        List.generate(recordCount, (_) => CalcHistoryResultModel.empty());
    return CalcHistoryModel(historyData);
  }

  /// 履歴データが存在しない場合のチェック
  void checkNoData() {
    expect(find.text('No Data.'), findsOneWidget);
  }

  /// 履歴データの行数チェック
  void checkHistoryCount(int count) {
    expect(find.byType(CalcHistoryItem), findsNWidgets(count));
    // expect(find.text('0'), findsNWidgets(count));
  }

  /// 計算結果が1つ以上存在すること
  void checkResultExist(String result) {
    expect(find.text('計算結果: $result'), findsAny);
  }
}
