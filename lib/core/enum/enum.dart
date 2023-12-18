enum Operator {
  /// 加算記号(+)
  plus(display: '+'),

  /// 減算記号(-)
  minus(display: '-'),

  /// 乗算記号(*)
  times(display: '*'),

  /// 除算記号(/)
  divid(display: '/');

  final String display;

  const Operator({
    required this.display,
  });
}
