import 'package:flutter_test/flutter_test.dart';
import 'package:ic_calculator/core/enum/enum.dart';
import 'package:ic_calculator/features/calc/calc_interface.dart';
import 'package:ic_calculator/features/calc/calc_presenter.dart';

void calcUnitTest() {
  group('数値入力', () {
    test('数値入力 ', () {
      final (presenter, interface) = _Helper.getInstance();

      presenter.onPressNumber(0);
      expect(interface.dispOperand, 0.0);

      presenter.onPressNumber(1);
      expect(interface.dispOperand, 1.0);

      presenter.onPressNumber(2);
      expect(interface.dispOperand, 12.0);

      presenter.onPressNumber(3);
      expect(interface.dispOperand, 123.0);

      presenter.onPressNumber(4);
      expect(interface.dispOperand, 1234.0);

      presenter.onPressNumber(5);
      expect(interface.dispOperand, 12345.0);

      presenter.onPressNumber(6);
      expect(interface.dispOperand, 123456.0);

      presenter.onPressNumber(7);
      expect(interface.dispOperand, 1234567.0);

      presenter.onPressNumber(8);
      expect(interface.dispOperand, 12345678.0);

      presenter.onPressNumber(9);
      expect(interface.dispOperand, 123456789.0);

      presenter.onPressNumber(0);
      expect(interface.dispOperand, 1234567890.0);
    });
  });

  group('四則演算子', () {
    test('+', () {
      final (presenter, interface) = _Helper.getInstance();

      _Helper.setDispOperand(presenter, 100);
      presenter.onPressOperator(Operator.plus);
      expect(interface.dispOperand, 0.0);
    });

    test('-', () {
      final (presenter, interface) = _Helper.getInstance();

      _Helper.setDispOperand(presenter, 100);
      presenter.onPressOperator(Operator.minus);
      expect(interface.dispOperand, 0.0);
    });

    test('*', () {
      final (presenter, interface) = _Helper.getInstance();

      _Helper.setDispOperand(presenter, 100);
      presenter.onPressOperator(Operator.times);
      expect(interface.dispOperand, 0.0);
    });

    test('/', () {
      final (presenter, interface) = _Helper.getInstance();

      _Helper.setDispOperand(presenter, 100);
      presenter.onPressOperator(Operator.divid);
      expect(interface.dispOperand, 0.0);
    });
  });

  group('クリア', () {
    test('C', () {
      final (presenter, interface) = _Helper.getInstance();

      _Helper.setDispOperand(presenter, 100.0);
      presenter.onPressClear();
      expect(interface.dispOperand, 0.0);
    });

    test('AC', () {
      final (presenter, interface) = _Helper.getInstance();

      _Helper.setDispOperand(presenter, 100.0);
      presenter.onPressAllClear();
      expect(interface.dispOperand, 0.0);
    });
  });
}

class _Helper {
  // インスタンス取得
  static (CalcPresenter, CalcInterface) getInstance() {
    final interface = CalcInterface();
    final presenter = CalcPresenter()..calcInterface = interface;

    return (presenter, interface);
  }

  // 電卓表示の切り替え
  static void setDispOperand(CalcPresenter presenter, double operand) =>
      presenter.calcInterface = CalcInterface()..dispOperand = operand;
}
