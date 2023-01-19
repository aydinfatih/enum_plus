import 'package:enum_plus/enum_plus.dart';

enum EnhancedMixedFormatEnum with EnumPlus {
  Normal(0),
  Normal1(1),
  MultiWordKeyName(2),
  MultiWordKeyName1(3),
  UPPERCASE(4),
  UPPERCASE_SNAKE_CASE(5),
  UPPERCASE1(6),
  lowercase(7),
  lowercase_snake_case(8),
  lowercase1(9);

  const EnhancedMixedFormatEnum(this.value);

  final int value;

  @override
  dynamic toValue() {
    return value;
  }
}
