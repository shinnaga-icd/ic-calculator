class CalcHistoryModel {
  /// コンストラクタ
  CalcHistoryModel(this.history);

  /// コンストラクタ（empty指定）
  static CalcHistoryModel empty() => CalcHistoryModel([]);

  /// 計算履歴
  List<CalcHistoryResultModel> history;
}

class CalcHistoryResultModel {
  /// コンストラクタ
  CalcHistoryResultModel({
    required this.execDateTime,
    required this.formula,
    required this.result,
  });

  /// コンストラクタ（empty指定）
  static CalcHistoryResultModel empty() => CalcHistoryResultModel(
      execDateTime: DateTime.now(), formula: [], result: 0.0);

  /// 計算実行時間
  DateTime execDateTime;

  /// 計算要素
  /// 計算数と四則演算子を順序性を保ちつつ保持
  /// ex. [100] [+] [20]
  List<String> formula;

  /// 計算結果
  double result;

  void updateExecDateTime() => execDateTime = DateTime.now();
  void addFormula(String item) => formula.add(item);
  void setResult(double result) => this.result = result;
}
