import 'package:flutter/material.dart';
import 'package:ic_calculator/core/enum/enum.dart';
import 'package:ic_calculator/core/extentions/num_extentions.dart';
import 'package:ic_calculator/core/models/calc_history_model.dart';
import 'package:ic_calculator/core/state/calc_history.dart';
import 'package:ic_calculator/features/calc/calc_interface.dart';

class CalcPresenter {
  CalcInterface _interface = CalcInterface();

  /// 途中の計算結果
  double _currentResult = 0;

  /// 次計算する四則演算子
  Operator _targetOperator = Operator.none;

  /// 計算履歴保存用のデータモデル
  CalcHistoryResultModel _resultModel = CalcHistoryResultModel.empty();

  /// データバインディング用class
  set calcInterface(CalcInterface calcInterface) {
    _interface = calcInterface;
  }

  // イベントハンドラ //

  /// 数値入力
  void onPressNumber(int inputNumber) {
    _interface.dispOperand *= 10;
    _interface.dispOperand += inputNumber;

    _interface.screenRefresh();
  }

  /// 四則演算子押下
  void onPressOperator(Operator operator) {
    _calculate(_targetOperator);
    _dispClear();

    _targetOperator = operator;
    _interface.screenRefresh();
  }

  /// =押下
  void onPressDone(BuildContext context) {
    _calculate(_targetOperator);
    _interface.dispOperand = _currentResult;

    _targetOperator = Operator.none;
    CalcHistory.of(context, rebuild: false).addCalcHistory(_resultModel);
    _resultModel = CalcHistoryResultModel.empty();
    _interface.screenRefresh();
  }

  /// C押下
  void onPressClear() {
    _dispClear();
    _interface.screenRefresh();
  }

  /// AC押下
  void onPressAllClear() {
    _allClear();
    _interface.screenRefresh();
  }

  // メンバ関数 //

  /// 四則演算実行
  void _calculate(Operator operator) {
    // 計算実行
    switch (operator) {
      case Operator.plus:
        _resultModel.addFormula(operator.toString());
        _add();
      case Operator.minus:
        _resultModel.addFormula(operator.toString());
        _minus();
      case Operator.times:
        _resultModel.addFormula(operator.toString());
        _times();
      case Operator.divid:
        _resultModel.addFormula(operator.toString());
        _divid();
      case Operator.none:
        // 被演算数の処理ロジック
        _currentResult = _interface.dispOperand;
    }
    _resultModel.addFormula(_interface.dispOperand.formatWithCommas());

    // 計算実行時間更新と計算結果保存
    _resultModel.updateExecDateTime();
    _resultModel.setResult(_currentResult);
  }

  /// 加算
  void _add() => _currentResult += _interface.dispOperand;

  /// 減算
  void _minus() => _currentResult -= _interface.dispOperand;

  /// 乗算
  void _times() {
    _currentResult = _currentResult == 0 ? 1 : _currentResult;
    _currentResult *= _interface.dispOperand;
  }

  /// 除算
  void _divid() {
    _currentResult = _currentResult == 0 ? 1 : _currentResult;
    _currentResult /= _interface.dispOperand;
  }

  /// 画面表示クリア
  void _dispClear() {
    _interface.dispOperand = 0;
  }

  /// 全クリア
  void _allClear() {
    _currentResult = 0;
    _targetOperator = Operator.none;
    _dispClear();
  }
}
