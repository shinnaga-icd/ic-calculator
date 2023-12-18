import 'package:flutter/material.dart';
import 'package:ic_calculator/core/enum/enum.dart';
import 'package:ic_calculator/core/extentions/num_extentions.dart';
import 'package:ic_calculator/features/calc/calc_presenter.dart';
import 'package:ic_calculator/features/calc/calc_viewmodel.dart';
import 'package:ic_calculator/features/calc/widgets/calc_button.dart';
import 'package:ic_calculator/features/calc/widgets/calc_result_text.dart';

class CalcView extends StatefulWidget {
  const CalcView({super.key});

  @override
  State<CalcView> createState() => _CalcViewState();
}

class _CalcViewState extends State<CalcView> implements CalcViewModel {
  CalcPresenter presenter = CalcPresenter();

  /// 数字ボタン 0~9
  Widget _numButton(int number) => CalcButton(
        displaySentence: number.toString(),
        onPressed: () => presenter.onPressNumber(number),
      );

  Widget _operatorButton(Operator operator) => CalcButton(
        displaySentence: operator.display,
        onPressed: () => presenter.onPressOperator(operator),
      );

  /// =ボタン
  Widget _equalButton() =>
      CalcButton(displaySentence: '=', onPressed: presenter.onPressDone);

  /// Cボタン
  Widget _clearButton() =>
      CalcButton(displaySentence: 'C', onPressed: presenter.onPressClear);

  /// Cボタン
  Widget _allClearButton() =>
      CalcButton(displaySentence: 'AC', onPressed: presenter.onPressAllClear);

  /// 空エリア
  Widget _emptyArea() => const CalcButton(displaySentence: '');

  /// ボタン配置リスト
  late final List<List<Widget>> buttonList;

  @override
  void initState() {
    super.initState();
    presenter.calcViewModel = this;
    // 卓上のボタン配列
    buttonList = <List<Widget>>[
      [
        _allClearButton(),
        _emptyArea(),
        _emptyArea(),
        _emptyArea(),
      ],
      [
        _clearButton(),
        _emptyArea(),
        _emptyArea(),
        _operatorButton(Operator.divid),
      ],
      [
        _numButton(1),
        _numButton(2),
        _numButton(3),
        _operatorButton(Operator.times),
      ],
      [
        _numButton(4),
        _numButton(5),
        _numButton(6),
        _operatorButton(Operator.minus),
      ],
      [
        _numButton(7),
        _numButton(8),
        _numButton(9),
        _operatorButton(Operator.plus),
      ],
      [_emptyArea(), _numButton(0), _emptyArea(), _equalButton()],
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          CalcResultText(dispValue: operand.formatWithCommas()),
          for (List<Widget> buttonRow in buttonList)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...buttonRow,
              ],
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => presenter.goHistory(context),
        child: const Icon(Icons.history),
      ),
    );
  }

  @override
  double operand = 0;

  @override
  void screenRefresh() => setState(() {});
}
