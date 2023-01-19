import 'package:enum_plus/enum_plus.dart';
import 'package:test/test.dart';

import 'enums/enhanced_mixed_format_enum.dart';
import 'enums/mixed_format_enum.dart';

void main() {
  group('Enum', () {
    group('Enum Tests', () {
      test('equals', () {
        expect(MixedFormatEnum.Normal.equal(MixedFormatEnum.Normal), true);
        expect(MixedFormatEnum.Normal.equal(MixedFormatEnum.MultiWordKeyName), false);
      });
      test('notEquals', () {
        expect(MixedFormatEnum.Normal.notEqual(MixedFormatEnum.Normal), false);
        expect(MixedFormatEnum.Normal.notEqual(MixedFormatEnum.MultiWordKeyName), true);
      });
      test('inside', () {
        expect(MixedFormatEnum.Normal.inside([MixedFormatEnum.Normal, MixedFormatEnum.MultiWordKeyName]), true);
        expect(MixedFormatEnum.Normal.inside([MixedFormatEnum.MultiWordKeyName]), false);
      });
      test('outside', () {
        expect(MixedFormatEnum.Normal.outside([MixedFormatEnum.Normal, MixedFormatEnum.MultiWordKeyName]), false);
        expect(MixedFormatEnum.Normal.outside([MixedFormatEnum.MultiWordKeyName]), true);
      });
      test('getFriendlyName', () {
        expect(MixedFormatEnum.Normal.getFriendlyName(), equals('Normal'));
        expect(MixedFormatEnum.Normal1.getFriendlyName(), equals('Normal 1'));
        expect(MixedFormatEnum.MultiWordKeyName.getFriendlyName(), equals('Multi Word Key Name'));
        expect(MixedFormatEnum.MultiWordKeyName1.getFriendlyName(), equals('Multi Word Key Name 1'));
        expect(MixedFormatEnum.UPPERCASE.getFriendlyName(), equals('Uppercase'));
        expect(MixedFormatEnum.UPPERCASE_SNAKE_CASE.getFriendlyName(), equals('Uppercase Snake Case'));
        expect(MixedFormatEnum.UPPERCASE1.getFriendlyName(), equals('Uppercase 1'));
        expect(MixedFormatEnum.lowercase.getFriendlyName(), equals('Lowercase'));
        expect(MixedFormatEnum.lowercase_snake_case.getFriendlyName(), equals('Lowercase Snake Case'));
      });
    });
    group('Enum List Tests', () {
      test('hasName', () {
        expect(MixedFormatEnum.values.hasName('MultiWordKeyName1'), true);
        expect(MixedFormatEnum.values.hasName('invalid'), false);
      });
      test('hasFriendlyName', () {
        expect(MixedFormatEnum.values.hasFriendlyName(MixedFormatEnum.MultiWordKeyName1.getFriendlyName()), true);
        expect(MixedFormatEnum.values.hasFriendlyName('invalid'), false);
      });
      test('getName', () {
        expect(MixedFormatEnum.values.getName(MixedFormatEnum.Normal), equals('Normal'));
        expect(() => MixedFormatEnum.values.getName(100), throwsStateError);
      });
      test('getNames', () {
        expect(MixedFormatEnum.values.getNames(), MixedFormatEnum.values.asNameMap().keys);
        expect(MixedFormatEnum.values.getNames(values: [MixedFormatEnum.Normal, MixedFormatEnum.Normal1]), ['Normal', 'Normal1']);
      });
      test('getNamesExcept', () {
        List<MixedFormatEnum> exceptValues = [MixedFormatEnum.Normal, MixedFormatEnum.lowercase1];
        List<String> result = MixedFormatEnum.values.getNamesExcept(exceptValues);
        expect(result.length, equals(MixedFormatEnum.values.length - exceptValues.length));
        expect(result.contains('Normal'), false);
        expect(result.contains('Normal'), false);
        expect(result.contains('MultiWordKeyName'), true);
      });
      test('getFriendlyNames', () {
        expect(MixedFormatEnum.values.getFriendlyNames(), equals(MixedFormatEnum.values.map((item) => item.getFriendlyName()).toList()));
        expect(MixedFormatEnum.values.getFriendlyNames(values: [MixedFormatEnum.Normal, MixedFormatEnum.Normal1]), ['Normal', 'Normal 1']);
      });
      test('getFriendlyNamesExcept', () {
        List<MixedFormatEnum> exceptValues = [MixedFormatEnum.Normal, MixedFormatEnum.lowercase1];
        List<String> result = MixedFormatEnum.values.getFriendlyNamesExcept(exceptValues);
        expect(result.length, equals(MixedFormatEnum.values.length - exceptValues.length));
        expect(result.contains('Normal'), false);
        expect(result.contains('Lowercase 1'), false);
        expect(result.contains('Multi Word Key Name'), true);
      });
      test('fromNames', () {
        expect(MixedFormatEnum.values.fromNames(['Normal', 'MultiWordKeyName']), equals([MixedFormatEnum.Normal, MixedFormatEnum.MultiWordKeyName]));
      });
      test('fromFriendlyNames', () {
        expect(MixedFormatEnum.values.fromFriendlyNames(['Normal', 'Multi Word Key Name']), equals([MixedFormatEnum.Normal, MixedFormatEnum.MultiWordKeyName]));
      });
      test('fromName', () {
        expect(MixedFormatEnum.values.fromName('Normal'), equals(MixedFormatEnum.Normal));
        expect(() => MixedFormatEnum.values.fromName('Invalid'), throwsStateError);
      });
      test('fromFriendlyName', () {
        expect(MixedFormatEnum.values.fromFriendlyName(MixedFormatEnum.Normal.getFriendlyName()), equals(MixedFormatEnum.Normal));
        expect(() => MixedFormatEnum.values.fromFriendlyName('Invalid'), throwsStateError);
      });
      test('toListExcept', () {
        List<MixedFormatEnum> exceptValues = [MixedFormatEnum.Normal, MixedFormatEnum.lowercase1];
        List<MixedFormatEnum> result = MixedFormatEnum.values.toListExcept(exceptValues);
        expect(result.length, equals(MixedFormatEnum.values.length - exceptValues.length));
        expect(result.contains(MixedFormatEnum.Normal), false);
        expect(result.contains(MixedFormatEnum.lowercase1), false);
      });
      test('getRandom', () {
        expect(MixedFormatEnum.values.getRandom().runtimeType, equals(MixedFormatEnum));
      });
      test('getRandomName', () {
        String randomName = MixedFormatEnum.values.getRandomName();
        expect(MixedFormatEnum.values.hasName(randomName), true);
      });
      test('getRandomFriendlyName', () {
        expect(MixedFormatEnum.values.hasFriendlyName(MixedFormatEnum.MultiWordKeyName.getFriendlyName()), true);
        expect(MixedFormatEnum.values.hasFriendlyName('Invalid'), false);
      });
      test('hasValue', () {
        expect(MixedFormatEnum.values.hasValue(MixedFormatEnum.Normal), true);
        expect(MixedFormatEnum.values.hasValue('invalid'), false);
      });
      test('fromValues', () {
        expect(MixedFormatEnum.values.fromValues([MixedFormatEnum.Normal, MixedFormatEnum.UPPERCASE]), equals([MixedFormatEnum.Normal, MixedFormatEnum.UPPERCASE]));
      });
      test('getValues', () {
        expect(MixedFormatEnum.values.getValues(), equals(MixedFormatEnum.values.map((item) => item.toValue()).toList()));
      });
      test('getValuesExcept', () {
        List<MixedFormatEnum> exceptValues = [MixedFormatEnum.Normal, MixedFormatEnum.lowercase1];
        List<dynamic> result = MixedFormatEnum.values.getValuesExcept(exceptValues);
        expect(result.length, equals(MixedFormatEnum.values.length - exceptValues.length));
        expect(result.contains(MixedFormatEnum.Normal.toValue()), false);
        expect(result.contains(MixedFormatEnum.lowercase1.toValue()), false);
        expect(result.contains(MixedFormatEnum.MultiWordKeyName1.toValue()), true);
      });
      test('fromValue', () {
        expect(MixedFormatEnum.values.fromValue(MixedFormatEnum.Normal.toValue()), equals(MixedFormatEnum.Normal));
        expect(() => MixedFormatEnum.values.fromValue('Invalid'), throwsStateError);
      });
      test('getRandomValue', () {
        dynamic randomValue = MixedFormatEnum.values.getRandomValue();
        expect(MixedFormatEnum.values.hasValue(randomValue), true);
      });
      test('coerce', () {
        expect(MixedFormatEnum.values.coerce(MixedFormatEnum.Normal.toValue()), equals(MixedFormatEnum.Normal));
        expect(MixedFormatEnum.values.coerce('Normal'), equals(MixedFormatEnum.Normal));
      });
    });
  });

  group('Enhanced Enum', () {
    group('Enhanced Enum Tests', () {
      test('equals', () {
        expect(EnhancedMixedFormatEnum.Normal.equal(EnhancedMixedFormatEnum.Normal), true);
        expect(EnhancedMixedFormatEnum.Normal.equal(0), true);
        expect(EnhancedMixedFormatEnum.Normal.equal(EnhancedMixedFormatEnum.MultiWordKeyName), false);
        expect(EnhancedMixedFormatEnum.Normal.equal(2), false);
      });
      test('notEquals', () {
        expect(EnhancedMixedFormatEnum.Normal.notEqual(EnhancedMixedFormatEnum.Normal), false);
        expect(EnhancedMixedFormatEnum.Normal.notEqual(0), false);
        expect(EnhancedMixedFormatEnum.Normal.notEqual(EnhancedMixedFormatEnum.MultiWordKeyName), true);
        expect(EnhancedMixedFormatEnum.Normal.notEqual(2), true);
      });
      test('inside', () {
        expect(EnhancedMixedFormatEnum.Normal.inside([EnhancedMixedFormatEnum.Normal, EnhancedMixedFormatEnum.MultiWordKeyName]), true);
        expect(EnhancedMixedFormatEnum.Normal.inside([0, 2]), true);
        expect(EnhancedMixedFormatEnum.Normal.inside([EnhancedMixedFormatEnum.MultiWordKeyName]), false);
        expect(EnhancedMixedFormatEnum.Normal.inside([2]), false);
      });
      test('outside', () {
        expect(EnhancedMixedFormatEnum.Normal.outside([EnhancedMixedFormatEnum.Normal, EnhancedMixedFormatEnum.MultiWordKeyName]), false);
        expect(EnhancedMixedFormatEnum.Normal.outside([0, 2]), false);
        expect(EnhancedMixedFormatEnum.Normal.outside([EnhancedMixedFormatEnum.MultiWordKeyName]), true);
        expect(EnhancedMixedFormatEnum.Normal.outside([2]), true);
      });
      test('getFriendlyName', () {
        expect(EnhancedMixedFormatEnum.Normal.getFriendlyName(), equals('Normal'));
        expect(EnhancedMixedFormatEnum.Normal1.getFriendlyName(), equals('Normal 1'));
        expect(EnhancedMixedFormatEnum.MultiWordKeyName.getFriendlyName(), equals('Multi Word Key Name'));
        expect(EnhancedMixedFormatEnum.MultiWordKeyName1.getFriendlyName(), equals('Multi Word Key Name 1'));
        expect(EnhancedMixedFormatEnum.UPPERCASE.getFriendlyName(), equals('Uppercase'));
        expect(EnhancedMixedFormatEnum.UPPERCASE_SNAKE_CASE.getFriendlyName(), equals('Uppercase Snake Case'));
        expect(EnhancedMixedFormatEnum.UPPERCASE1.getFriendlyName(), equals('Uppercase 1'));
        expect(EnhancedMixedFormatEnum.lowercase.getFriendlyName(), equals('Lowercase'));
        expect(EnhancedMixedFormatEnum.lowercase_snake_case.getFriendlyName(), equals('Lowercase Snake Case'));
        expect(EnhancedMixedFormatEnum.lowercase1.getFriendlyName(), equals('Lowercase 1'));
      });
    });
    group('Enum List Tests', () {
      test('hasName', () {
        expect(EnhancedMixedFormatEnum.values.hasName('MultiWordKeyName1'), true);
        expect(EnhancedMixedFormatEnum.values.hasName('invalid'), false);
      });
      test('hasFriendlyName', () {
        expect(EnhancedMixedFormatEnum.values.hasFriendlyName(EnhancedMixedFormatEnum.MultiWordKeyName1.getFriendlyName()), true);
        expect(EnhancedMixedFormatEnum.values.hasFriendlyName('invalid'), false);
      });
      test('getName', () {
        expect(EnhancedMixedFormatEnum.values.getName(0), equals('Normal'));
        expect(() => EnhancedMixedFormatEnum.values.getName('invalid'), throwsStateError);
      });
      test('getNames', () {
        expect(EnhancedMixedFormatEnum.values.getNames(), EnhancedMixedFormatEnum.values.asNameMap().keys);
        expect(EnhancedMixedFormatEnum.values.getNames(values: [EnhancedMixedFormatEnum.Normal, EnhancedMixedFormatEnum.Normal1]), ['Normal', 'Normal1']);
      });
      test('getNamesExcept', () {
        List<dynamic> exceptValues = [0, EnhancedMixedFormatEnum.lowercase1];
        List<String> result = EnhancedMixedFormatEnum.values.getNamesExcept(exceptValues);
        expect(result.length, equals(EnhancedMixedFormatEnum.values.length - exceptValues.length));
        expect(result.contains('Normal'), false);
        expect(result.contains('Normal'), false);
        expect(result.contains('MultiWordKeyName'), true);
      });
      test('getFriendlyNames', () {
        expect(EnhancedMixedFormatEnum.values.getFriendlyNames(), equals(EnhancedMixedFormatEnum.values.map((item) => item.getFriendlyName()).toList()));
        expect(EnhancedMixedFormatEnum.values.getFriendlyNames(values: [0, EnhancedMixedFormatEnum.Normal1]), ['Normal', 'Normal 1']);
      });
      test('getFriendlyNamesExcept', () {
        List<dynamic> exceptValues = [0, EnhancedMixedFormatEnum.lowercase1];
        List<String> result = EnhancedMixedFormatEnum.values.getFriendlyNamesExcept(exceptValues);
        expect(result.length, equals(EnhancedMixedFormatEnum.values.length - exceptValues.length));
        expect(result.contains('Normal'), false);
        expect(result.contains('Lowercase 1'), false);
        expect(result.contains('Multi Word Key Name'), true);
      });
      test('fromNames', () {
        expect(EnhancedMixedFormatEnum.values.fromNames(['Normal', 'MultiWordKeyName']), equals([EnhancedMixedFormatEnum.Normal, EnhancedMixedFormatEnum.MultiWordKeyName]));
      });
      test('fromFriendlyNames', () {
        expect(EnhancedMixedFormatEnum.values.fromFriendlyNames(['Normal', 'Multi Word Key Name']), equals([EnhancedMixedFormatEnum.Normal, EnhancedMixedFormatEnum.MultiWordKeyName]));
      });
      test('fromName', () {
        expect(EnhancedMixedFormatEnum.values.fromName('Normal'), equals(EnhancedMixedFormatEnum.Normal));
        expect(() => EnhancedMixedFormatEnum.values.fromName('Invalid'), throwsStateError);
      });
      test('fromFriendlyName', () {
        expect(EnhancedMixedFormatEnum.values.fromFriendlyName(EnhancedMixedFormatEnum.Normal.getFriendlyName()), equals(EnhancedMixedFormatEnum.Normal));
        expect(() => EnhancedMixedFormatEnum.values.fromFriendlyName('Invalid'), throwsStateError);
      });
      test('toListExcept', () {
        List<dynamic> exceptValues = [0, EnhancedMixedFormatEnum.lowercase1];
        List<EnhancedMixedFormatEnum> result = EnhancedMixedFormatEnum.values.toListExcept(exceptValues);
        expect(result.length, equals(EnhancedMixedFormatEnum.values.length - exceptValues.length));
        expect(result.contains(EnhancedMixedFormatEnum.Normal), false);
        expect(result.contains(EnhancedMixedFormatEnum.lowercase1), false);
      });
      test('getRandom', () {
        expect(EnhancedMixedFormatEnum.values.getRandom().runtimeType, equals(EnhancedMixedFormatEnum));
      });
      test('getRandomName', () {
        String randomName = EnhancedMixedFormatEnum.values.getRandomName();
        expect(EnhancedMixedFormatEnum.values.hasName(randomName), true);
      });
      test('getRandomFriendlyName', () {
        expect(EnhancedMixedFormatEnum.values.hasFriendlyName(EnhancedMixedFormatEnum.MultiWordKeyName.getFriendlyName()), true);
        expect(EnhancedMixedFormatEnum.values.hasFriendlyName('Invalid'), false);
      });
      test('hasValue', () {
        expect(EnhancedMixedFormatEnum.values.hasValue(0), true);
        expect(EnhancedMixedFormatEnum.values.hasValue(3), true);
        expect(EnhancedMixedFormatEnum.values.hasValue('invalid'), false);
      });
      test('fromValues', () {
        expect(EnhancedMixedFormatEnum.values.fromValues([0, 4]), equals([EnhancedMixedFormatEnum.Normal, EnhancedMixedFormatEnum.UPPERCASE]));
      });
      test('getValues', () {
        expect(EnhancedMixedFormatEnum.values.getValues(), equals(EnhancedMixedFormatEnum.values.map((item) => item.toValue()).toList()));
      });
      test('getValuesExcept', () {
        List<dynamic> exceptValues = [0, EnhancedMixedFormatEnum.lowercase1];
        List<dynamic> result = EnhancedMixedFormatEnum.values.getValuesExcept(exceptValues);
        expect(result.length, equals(EnhancedMixedFormatEnum.values.length - exceptValues.length));
        expect(result.contains(EnhancedMixedFormatEnum.Normal.toValue()), false);
        expect(result.contains(EnhancedMixedFormatEnum.lowercase1.toValue()), false);
        expect(result.contains(EnhancedMixedFormatEnum.MultiWordKeyName1.toValue()), true);
      });
      test('fromValue', () {
        expect(EnhancedMixedFormatEnum.values.fromValue(0), equals(EnhancedMixedFormatEnum.Normal));
        expect(() => EnhancedMixedFormatEnum.values.fromValue('Invalid'), throwsStateError);
      });
      test('getRandomValue', () {
        dynamic randomValue = EnhancedMixedFormatEnum.values.getRandomValue();
        expect(EnhancedMixedFormatEnum.values.hasValue(randomValue), true);
      });
      test('coerce', () {
        expect(EnhancedMixedFormatEnum.values.coerce(0), equals(EnhancedMixedFormatEnum.Normal));
        expect(EnhancedMixedFormatEnum.values.coerce('Normal'), equals(EnhancedMixedFormatEnum.Normal));
      });
    });
  });
}
