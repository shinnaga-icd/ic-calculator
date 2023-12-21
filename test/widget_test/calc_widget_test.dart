import 'package:flutter_test/flutter_test.dart';

import '../robot_pattern/calc_robot.dart';

void calcWidgetTest() {
  testWidgets('10 + 5 = => 15', (widgetTester) async {
    final robot = CalcRobot(widgetTester);
    await robot.init();

    await robot.tapCalc(CalcItem.$1);
    await robot.tapCalc(CalcItem.$0);
    await robot.tapCalc(CalcItem.plus);
    await robot.tapCalc(CalcItem.$5);
    await robot.tapCalc(CalcItem.done);

    robot.checkResult('15');
  });

  testWidgets('10 - 5 = => 5', (widgetTester) async {
    final robot = CalcRobot(widgetTester);
    await robot.init();

    await robot.tapCalc(CalcItem.$1);
    await robot.tapCalc(CalcItem.$0);
    await robot.tapCalc(CalcItem.minus);
    await robot.tapCalc(CalcItem.$5);
    await robot.tapCalc(CalcItem.done);

    robot.checkResult('5');
  });

  testWidgets('10 * 5 = => 50', (widgetTester) async {
    final robot = CalcRobot(widgetTester);
    await robot.init();

    await robot.tapCalc(CalcItem.$1);
    await robot.tapCalc(CalcItem.$0);
    await robot.tapCalc(CalcItem.times);
    await robot.tapCalc(CalcItem.$5);
    await robot.tapCalc(CalcItem.done);

    robot.checkResult('50');
  });

  testWidgets('10 / 5 = => 2', (widgetTester) async {
    final robot = CalcRobot(widgetTester);
    await robot.init();

    await robot.tapCalc(CalcItem.$1);
    await robot.tapCalc(CalcItem.$0);
    await robot.tapCalc(CalcItem.divid);
    await robot.tapCalc(CalcItem.$5);
    await robot.tapCalc(CalcItem.done);

    robot.checkResult('2');
  });

  testWidgets('10 + 30 - 8 = => 32', (widgetTester) async {
    final robot = CalcRobot(widgetTester);
    await robot.init();

    await robot.tapCalc(CalcItem.$1);
    await robot.tapCalc(CalcItem.$0);
    await robot.tapCalc(CalcItem.plus);
    await robot.tapCalc(CalcItem.$3);
    await robot.tapCalc(CalcItem.$0);
    await robot.tapCalc(CalcItem.minus);
    await robot.tapCalc(CalcItem.$8);
    await robot.tapCalc(CalcItem.done);

    robot.checkResult('32');
  });

  testWidgets('5 * 12 / 3 = => 20', (widgetTester) async {
    final robot = CalcRobot(widgetTester);
    await robot.init();

    await robot.tapCalc(CalcItem.$5);
    await robot.tapCalc(CalcItem.times);
    await robot.tapCalc(CalcItem.$1);
    await robot.tapCalc(CalcItem.$2);
    await robot.tapCalc(CalcItem.divid);
    await robot.tapCalc(CalcItem.$3);
    await robot.tapCalc(CalcItem.done);

    robot.checkResult('20');
  });

  testWidgets('30 + 50 - 45 * 4 / 7 = => 20', (widgetTester) async {
    final robot = CalcRobot(widgetTester);
    await robot.init();

    await robot.tapCalc(CalcItem.$3);
    await robot.tapCalc(CalcItem.$0);
    await robot.tapCalc(CalcItem.plus);
    await robot.tapCalc(CalcItem.$5);
    await robot.tapCalc(CalcItem.$0);
    await robot.tapCalc(CalcItem.minus);
    await robot.tapCalc(CalcItem.$4);
    await robot.tapCalc(CalcItem.$5);
    await robot.tapCalc(CalcItem.times);
    await robot.tapCalc(CalcItem.$4);
    await robot.tapCalc(CalcItem.divid);
    await robot.tapCalc(CalcItem.$7);
    await robot.tapCalc(CalcItem.done);

    robot.checkResult('20');
  });

  testWidgets('23 / 16 = => 1.438(四捨五入)', (widgetTester) async {
    final robot = CalcRobot(widgetTester);
    await robot.init();

    await robot.tapCalc(CalcItem.$2);
    await robot.tapCalc(CalcItem.$3);
    await robot.tapCalc(CalcItem.divid);
    await robot.tapCalc(CalcItem.$1);
    await robot.tapCalc(CalcItem.$6);
    await robot.tapCalc(CalcItem.done);

    robot.checkResult('1.438');
  });

  testWidgets('- 5 * 3 - 9 + 2 = -22', (widgetTester) async {
    final robot = CalcRobot(widgetTester);
    await robot.init();

    await robot.tapCalc(CalcItem.minus);
    await robot.tapCalc(CalcItem.$5);
    await robot.tapCalc(CalcItem.times);
    await robot.tapCalc(CalcItem.$3);
    await robot.tapCalc(CalcItem.minus);
    await robot.tapCalc(CalcItem.$9);
    await robot.tapCalc(CalcItem.plus);
    await robot.tapCalc(CalcItem.$2);
    await robot.tapCalc(CalcItem.done);

    robot.checkResult('-22');
  });
}
