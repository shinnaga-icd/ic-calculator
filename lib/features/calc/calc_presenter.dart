import 'package:flutter/material.dart';
import 'package:ic_calculator/core/enum/enum.dart';
import 'package:ic_calculator/features/calc/calc_viewmodel.dart';
import 'package:ic_calculator/features/history/history_view.dart';

class CalcPresenter {
  CalcViewModel _viewModel = CalcViewModel();
  double _currentResult = 0;
  Operator? _targetOperator;

  /// データバインディング用class
  set calcViewModel(CalcViewModel calcViewModel) {
    _viewModel = calcViewModel;
  }

  /// イベントハンドラ

  /// 数値入力
  void onPressNumber(int inputNumber) {
    if (_viewModel.operand == 0) {
      _viewModel.operand += inputNumber;
    } else {
      _viewModel.operand *= 10;
      _viewModel.operand += inputNumber;
    }
    _viewModel.screenRefresh();
  }

  /// 四則演算子押下
  void onPressOperator(Operator operator) {
    _calculate(_targetOperator);
    _targetOperator = operator;
    _clear();
    _viewModel.screenRefresh();
  }

  /// =押下
  void onPressDone() {
    _calculate(_targetOperator);
    _targetOperator = null;
    _viewModel.operand = _currentResult;
    _viewModel.screenRefresh();
  }

  /// C押下
  void onPressClear() {
    _clear();
    _viewModel.screenRefresh();
  }

  /// AC押下
  void onPressAllClear() {
    _allClear();
    _viewModel.screenRefresh();
  }

  /// HistoryViewへ移動
  void goHistory(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute<void>(builder: (_) => HistoryView()));
  }

  /// メンバ関数

  /// 四則演算実行
  void _calculate(Operator? operator) {
    if (operator == null) {
      _currentResult = _viewModel.operand;
    } else {
      switch (operator) {
        case Operator.plus:
          _add();
        case Operator.minus:
          _minus();
        case Operator.times:
          _times();
        case Operator.divid:
          _divid();
      }
    }
  }

  /// 加算
  void _add() => _currentResult += _viewModel.operand;

  /// 減算
  void _minus() => _currentResult -= _viewModel.operand;

  /// 乗算
  void _times() {
    _currentResult = _currentResult == 0 ? 1 : _currentResult;
    _currentResult *= _viewModel.operand;
  }

  /// 除算
  void _divid() {
    _currentResult = _currentResult == 0 ? 1 : _currentResult;
    _currentResult /= _viewModel.operand;
  }

  /// 入力値クリア
  void _clear() {
    _viewModel.operand = 0;
  }

  /// 全クリア
  void _allClear() {
    _currentResult = 0;
    _clear();
  }
}
