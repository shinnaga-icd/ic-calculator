import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ic_calculator/core/state/calc_history.dart';
import 'package:ic_calculator/home.dart';

class HomeRobot {
  final WidgetTester tester;

  HomeRobot(this.tester);

  // 初期化
  Future<void> init() async {
    TestWidgetsFlutterBinding.ensureInitialized();

    await tester.pumpWidget(
      MaterialApp(
        home: CalcHistory(
          child: Home(),
        ),
      ),
    );
  }

  // Calcタップ
  Future<void> tapButtonNaviCalc() async {
    await tester.tap(find.byIcon(Icons.calculate));
    await tester.pump();
  }

  // Historyタップ
  Future<void> tapButtonNaviHist() async {
    await tester.tap(find.byIcon(Icons.history));
    await tester.pump();
  }
}
