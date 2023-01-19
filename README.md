# enum_plus

[![platform](https://img.shields.io/badge/Platform-Flutter-02569B?logo=flutter)](https://flutter.dev)
[![platform](https://img.shields.io/badge/Platform-Dart-02569B?logo=dart)](https://dart.dev)
[![pub package](https://img.shields.io/pub/v/enum_plus.svg?label=enum_plus&color=02569B)](https://pub.dev/packages/pipeline_plus)
[![license](https://img.shields.io/github/license/aydinfatih/enum_plus?color=02569B)](https://opensource.org/licenses/BSD-3-Clause)

Simple, extensible and powerful enumeration implementation

## Usage

You must include EnumPlus in your Enum. If you are using <a href="https://dart.dev/guides/language/language-tour#declaring-enhanced-enums" target="_blank">enhanced enum</a>. You should return your own value by overriding the toValue method.

```dart
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
```
## Enum Methods
- [Enum Methods](#enum-methods)
    - [equal()](#equal)
    - [notEqual()](#notequal)
    - [inside()](#inside)
    - [outside()](#outside)
    - [getFriendlyName()](#getfriendlyname)
- [Enum List Methods](#enum-list-methods)
    - [hasName()](#hasname)
    - [hasFriendlyName()](#hasfriendlyname)
    - [getNames()](#getnames)
    - [getName()](#getname)
    - [getNamesExcept()](#getnamesexcept)
    - [getFriendlyNames()](#getfriendlynames)
    - [getFriendlyNamesExcept()](#getfriendlynamesexcept)
    - [fromNames()](#fromnames)
    - [fromFriendlyNames()](#fromfriendlynames)
    - [fromName()](#fromname)
    - [fromFriendlyName()](#fromfriendlyname)
    - [toListExcept()](#tolistexcept)
    - [getRandom()](#getrandom)
    - [getRandomName()](#getrandomname)
    - [getRandomFriendlyName()](#getrandomfriendlyname)
    - [hasValue()](#hasvalue)
    - [getValues()](#getvalues)
    - [getValue()](#getvalue)
    - [getValuesExcept()](#getvaluesexcept)
    - [fromValue()](#fromvalue)
    - [fromValues()](#fromvalues)
    - [coerce()](#coerce)
    - [getRandomValue()](#getrandomvalue)
___
### equal
Checks if this instance is equal to the given enum instance or value.
```dart
  print(Animal.DOG.equal(Animal.DOG)); // true
  print(Animal.DOG.equal(0)); // true
  print(Animal.DOG.equal(Animal.CAT)); // false
  print(Animal.DOG.equal(1)); // false
```
___
### notEqual
Checks if this instance is not equal to the given enum instance or value.
```dart
  print(Animal.DOG.notEqual(Animal.CAT)); // true
  print(Animal.DOG.notEqual(1)); // true
  print(Animal.DOG.notEqual(Animal.DOG)); // false
  print(Animal.DOG.notEqual(0)); // false
```
___
### inside
Checks if a matching enum instance or value is in the given values.
```dart
  print(Animal.DOG.inside([Animal.DOG, Animal.CAT])); // true
  print(Animal.DOG.inside([0, 1])); // true
  print(Animal.DOG.inside([Animal.HONEY_BEE, Animal.CAT])); // false
  print(Animal.DOG.inside([1, 2])); // false
```
___
### outside
Checks if a matching enum instance or value is not in the given values.
```dart
  print(Animal.DOG.outside([Animal.HONEY_BEE, Animal.CAT])); // true
  print(Animal.DOG.outside([1, 2])); // true
  print(Animal.DOG.outside([Animal.DOG, Animal.CAT])); // false
  print(Animal.DOG.outside([0, 1])); // false
```
___
### getFriendlyName
Transform the name into a friendly, formatted version.
```dart
  print(Animal.HONEY_BEE.getFriendlyName()); // Honey Bee
```

## Enum List Methods
### hasName
Check that the enum contains a specific name.
```dart
  print(Animal.values.hasName('DOG')); // true
  print(Animal.values.hasName('FISH')); // false
```
___
### hasFriendlyName
Check that the enum contains a specific friendly name.
```dart
  print(Animal.values.hasFriendlyName('Honey Bee')); // true
  print(Animal.values.hasFriendlyName('Dog')); // true
  print(Animal.values.hasFriendlyName('Fish')); // false
```
___
### getNames
Get all or a custom set of the enum names.
```dart
  print(Animal.values.getNames()); // [DOG, CAT, HONEY_BEE]
  print(Animal.values.getNames(values: [0, Animal.CAT])); // [DOG, CAT]
```
___
### getName
Get the name for a single enum value.
```dart
  print(Animal.values.getName(1)); // CAT
  print(Animal.values.getName(100)); //Bad state: No element
```
___
### getNamesExcept
Return names of all the enums except the given values.
```dart
  print(Animal.values.getNamesExcept([0, Animal.HONEY_BEE])); // [CAT]
```
___
### getFriendlyNames
Get all or a custom set of the enum friendly names.
```dart
  print(Animal.values.getFriendlyNames()); // [Dog, Cat, Honey Bee]
  print(Animal.values.getFriendlyNames(values: [0, Animal.HONEY_BEE])); // [Dog, Honey Bee]
```
___
### getFriendlyNamesExcept
Return friendly names of all the enums except the given values.
```dart
  print(Animal.values.getFriendlyNamesExcept([Animal.DOG, 1])); // [Honey Bee]
```
___
### fromNames
Get enums from names.
```dart
  print(Animal.values.fromNames(['DOG', 'CAT'])); // [Animal.DOG, Animal.CAT]
  print(Animal.values.fromNames(['CAT', 'FISH'])); // Bad state: No element
```
___
### fromFriendlyNames
Get enums from friendly names.
```dart
  print(Animal.values.fromFriendlyNames(['Honey Bee', 'Cat'])); // [Animal.HONEY_BEE, Animal.CAT]
  print(Animal.values.fromFriendlyNames(['Honey Bee', 'Fish'])); // Bad state: No element
```
___
### fromName
Make an enum instance from a given key.
```dart
  print(Animal.values.fromName('DOG')); // Animal.DOG
  print(Animal.values.fromName('FISH')); // Bad state: No element
```
___
### fromFriendlyName
Make an enum instance from a given friendly name.
```dart
  print(Animal.values.fromFriendlyName('Honey Bee')); // Animal.HONEY_BEE
  print(Animal.values.fromFriendlyName('Fish')); // Bad state: No element
```
___
### toListExcept
Return instances of all the enums except the given values.
```dart
  print(Animal.values.toListExcept([Animal.DOG, 1])); // [Animal.HONEY_BEE]
```
___
### getRandom
Get a random instance of the enum.
```dart
  print(Animal.values.getRandom()); // Animal.HONEY_BEE
```
___
### getRandomName
Get a random name of the enum.
```dart
  print(Animal.values.getRandomName()); // DOG
```
___
### getRandomFriendlyName
Get a random friendly name of the enum.
```dart
  print(Animal.values.getRandomFriendlyName()); // Cat
```
___
### hasValue
Check that the enum contains a specific value.
```dart
  print(Animal.values.hasValue(1)); // true
  print(Animal.values.hasValue(Animal.CAT)); // true
  print(Animal.values.hasValue(100)); // false
```
___
### getValues
Get all or a custom set of the enum values.
```dart
  print(Animal.values.getValues()); // [0, 1, 2]
  print(Animal.values.getValues(names: ['DOG'])); // [0]
```
___
### getValue
Get the value for a single enum key.
```dart
  print(Animal.values.getValue('DOG')); // 0
  print(Animal.values.getValue('FISH')); // Bad state: No element
```
___
### getValuesExcept
Return values of all the enums except the given values.
```dart
  print(Animal.values.getValuesExcept([Animal.DOG, 1])); // [2]
```
___
### fromValue
Make a new instance from an enum value.
```dart
  print(Animal.values.fromValue(1)); // Animal.CAT
  print(Animal.values.fromValue(Animal.CAT)); // Animal.CAT
  print(Animal.values.fromValue(100)); // Bad state: No element
```
___
### fromValues
Return instances from enum values.
```dart
  print(Animal.values.fromValues([0, Animal.CAT])); // [Animal.DOG, Animal.CAT]
```
___
### coerce
Attempt to instantiate a new Enum using the given key or value.
```dart
  print(Animal.values.coerce(1)); // Animal.CAT
  print(Animal.values.coerce('CAT')); // Animal.CAT
  print(Animal.values.coerce(100)); // null
  print(Animal.values.coerce('FISH')); // null
```
___
### getRandomValue
Get a random value of the enum.
```dart
  print(Animal.values.getRandomValue()); // 1
```