import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ic_calculator/core/state/calc_history.dart';
import 'package:ic_calculator/features/calc/calc_view.dart';
import 'package:ic_calculator/features/calc/widgets/calc_result_text.dart';

enum CalcItem {
  ac('AC'),
  c('C'),
  $1('1'),
  $2('2'),
  $3('3'),
  $4('4'),
  $5('5'),
  $6('6'),
  $7('7'),
  $8('8'),
  $9('9'),
  $0('0'),
  plus('+'),
  minus('-'),
  times('*'),
  divid('/'),
  done('=');

  final String text;
  const CalcItem(this.text);
}

class CalcRobot {
  final WidgetTester tester;

  CalcRobot(this.tester);

  /// 初期化
  Future<void> init() async {
    TestWidgetsFlutterBinding.ensureInitialized();

    await tester.pumpWidget(
      const MaterialApp(
        home: CalcHistory(
          child: CalcView(),
        ),
      ),
    );
  }

  /// 電卓上のボタンをタップ
  Future<void> tapCalc(CalcItem item) async {
    await tester.tap(find.text(item.text));
    await tester.pump();
  }

  /// 結果の確認
  void checkResult(String result) {
    // expect(find.text(result), findsOneWidget);
    expect(
      find.descendant(
        of: find.byType(CalcResultText),
        matching: find.text(result),
      ),
      findsOneWidget,
    );
  }
}
