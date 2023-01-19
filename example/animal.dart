import 'package:enum_plus/enum_plus.dart';

enum Animal with EnumPlus {
  DOG(0),
  CAT(1),
  HONEY_BEE(2);

  const Animal(this.value);

  final int value;

  @override
  dynamic toValue() => value;
}
