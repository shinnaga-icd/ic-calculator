import 'package:flutter_test/flutter_test.dart';

import '../robot_pattern/history_robot.dart';

void historyWidgetTest() {
  testWidgets('データ5件', (widgetTester) async {
    HistoryRobot robot = HistoryRobot(widgetTester);

    final dummyData = robot.getCalcHistoryEmpty(5);
    await robot.init(calcHistory: dummyData);

    robot.checkHistoryCount(5);
  });

  testWidgets('データ100件', (widgetTester) async {
    HistoryRobot robot = HistoryRobot(widgetTester);

    final dummyData = robot.getCalcHistoryEmpty(100);
    await robot.init(calcHistory: dummyData);

    robot.checkHistoryCount(100);
  });

  testWidgets('データ0件', (widgetTester) async {
    HistoryRobot robot = HistoryRobot(widgetTester);
    await robot.init();

    robot.checkNoData();
  });
}
