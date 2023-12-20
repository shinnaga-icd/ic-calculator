enum Operator {
  /// 無し（初期化用）
  none(display: ''),

  /// 加算記号(+)
  plus(display: '+'),

  /// 減算記号(-)
  minus(display: '-'),

  /// 乗算記号(*)
  times(display: '*'),

  /// 除算記号(/)
  divid(display: '/');

  final String _display;

  @override
  String toString() => _display;

  const Operator({
    required display,
  }) : _display = display;
}
