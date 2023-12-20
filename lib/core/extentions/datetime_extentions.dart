extension DateTimeExtention on DateTime {
  /// 標準型へのフォーマット
  /// ex. 2023/12/18 10:23:40
  String toStringWithFormat() {
    final yyyy = _format0(year, digit: 4);
    final mm = _format0(month);
    final dd = _format0(day);
    final hh = _format0(hour);
    final mi = _format0(minute);
    final ss = _format0(second);
    return '$yyyy/$mm/$dd $hh:$mi:$ss';
  }
}

String _format0(
  int i, {
  int digit = 2,
}) =>
    i.toString().padLeft(digit, '0');
