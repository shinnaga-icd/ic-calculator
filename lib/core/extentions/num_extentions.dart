extension NumExtention on num {
  String formatWithCommas() {
    String intPart = _getIntegerPartWithCommas(this);
    String dcmPart = _getDecimalPart(this);
    return intPart + dcmPart;
  }
}

/// 整数部のフォーマット取得
String _getIntegerPartWithCommas(num n) {
  int i = n.toInt();
  if (i < 1000) {
    return i.toString();
  }
  List<String> result = [];
  while (i > 0) {
    int remainder = i % 1000;
    i = (i - remainder) ~/ 1000;
    String resultItem =
        (i != 0) ? remainder.toString().padLeft(3, '0') : remainder.toString();
    result.add(resultItem);
  }

  return result.reversed.join(',');
}

/// 実数部取得
String _getDecimalPart(num n) {
  String decimalString = n.toStringAsFixed(3); // 小数部を2桁で文字列化する
  if (decimalString.endsWith('.000')) {
    return '';
  }
  return '.${decimalString.split('.')[1]}'; // 小数部を取得する
}
