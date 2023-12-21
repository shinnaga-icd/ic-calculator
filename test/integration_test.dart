import 'package:flutter_test/flutter_test.dart';

import 'robot_pattern/calc_robot.dart';
import 'robot_pattern/history_robot.dart';
import 'robot_pattern/home_robot.dart';

void main() {
  /// integrationで使用するRobotのインスタンス取得
  (HomeRobot, CalcRobot, HistoryRobot) getRobotInstance(WidgetTester tester) =>
      (
        HomeRobot(tester),
        CalcRobot(tester),
        HistoryRobot(tester),
      );

  testWidgets('シナリオ1:任意の計算を実施すると、履歴に追加されていること', (widgetTester) async {
    final (homeRobot, calcRobot, historyRobot) = getRobotInstance(widgetTester);
    await homeRobot.init();

    // 1 + 2 + 3 - 10 = -4
    await calcRobot.tapCalc(CalcItem.$1);
    await calcRobot.tapCalc(CalcItem.plus);
    await calcRobot.tapCalc(CalcItem.$2);
    await calcRobot.tapCalc(CalcItem.plus);
    await calcRobot.tapCalc(CalcItem.$3);
    await calcRobot.tapCalc(CalcItem.minus);
    await calcRobot.tapCalc(CalcItem.$1);
    await calcRobot.tapCalc(CalcItem.$0);
    await calcRobot.tapCalc(CalcItem.done);

    calcRobot.checkResult('-4');

    // historyを参照
    await homeRobot.tapButtonNaviHist();
    historyRobot.checkResultExist('-4');
  });

  testWidgets('シナリオ2:計算を30回実施すると、履歴が30行作成されていること', (widgetTester) async {
    final (homeRobot, calcRobot, historyRobot) = getRobotInstance(widgetTester);
    await homeRobot.init();

    for (var i = 0; i < 30; i++) {
      await calcRobot.tapCalc(CalcItem.$1);
      await calcRobot.tapCalc(CalcItem.$0);
      await calcRobot.tapCalc(CalcItem.plus);
      await calcRobot.tapCalc(CalcItem.$2);
      await calcRobot.tapCalc(CalcItem.$0);
      await calcRobot.tapCalc(CalcItem.minus);
      await calcRobot.tapCalc(CalcItem.$3);
      await calcRobot.tapCalc(CalcItem.$0);
      await calcRobot.tapCalc(CalcItem.times);
      await calcRobot.tapCalc(CalcItem.$3);
      await calcRobot.tapCalc(CalcItem.divid);
      await calcRobot.tapCalc(CalcItem.$1);
      await calcRobot.tapCalc(CalcItem.$0);

      await calcRobot.tapCalc(CalcItem.done);
    }

    // historyを参照
    await homeRobot.tapButtonNaviHist();
    historyRobot.checkHistoryCount(30);
  });

  testWidgets('シナリオ3:計算途中で=を押さずに履歴へ行くと、No Data.となっていること', (widgetTester) async {
    final (homeRobot, calcRobot, historyRobot) = getRobotInstance(widgetTester);
    await homeRobot.init();

    // 1 + 2 + 3 - 10 = -4
    await calcRobot.tapCalc(CalcItem.$1);
    await calcRobot.tapCalc(CalcItem.plus);
    await calcRobot.tapCalc(CalcItem.$2);
    await calcRobot.tapCalc(CalcItem.plus);
    await calcRobot.tapCalc(CalcItem.$3);
    await calcRobot.tapCalc(CalcItem.minus);
    await calcRobot.tapCalc(CalcItem.$1);
    await calcRobot.tapCalc(CalcItem.$0);

    // historyを参照
    await homeRobot.tapButtonNaviHist();
    historyRobot.checkNoData();
  });
}
