import 'package:enum_plus/enum_plus.dart';
import 'animal.dart';

void main() {
  print(Animal.DOG.equal(Animal.DOG)); // true
  print(Animal.DOG.equal(0)); // true
  print(Animal.DOG.equal(Animal.CAT)); // false
  print(Animal.DOG.equal(1)); // false

  print(Animal.DOG.notEqual(Animal.CAT)); // true
  print(Animal.DOG.notEqual(1)); // true
  print(Animal.DOG.notEqual(Animal.DOG)); // false
  print(Animal.DOG.notEqual(0)); // false

  print(Animal.DOG.inside([Animal.DOG, Animal.CAT])); // true
  print(Animal.DOG.inside([0, 1])); // true
  print(Animal.DOG.inside([Animal.HONEY_BEE, Animal.CAT])); // false
  print(Animal.DOG.inside([1, 2])); // false

  print(Animal.DOG.outside([Animal.HONEY_BEE, Animal.CAT])); // true
  print(Animal.DOG.outside([1, 2])); // true
  print(Animal.DOG.outside([Animal.DOG, Animal.CAT])); // false
  print(Animal.DOG.outside([0, 1])); // false

  print(Animal.HONEY_BEE.getFriendlyName()); // Honey Bee

  print(Animal.values.hasName('DOG')); // true
  print(Animal.values.hasName('FISH')); // false

  print(Animal.values.hasFriendlyName('Honey Bee')); // true
  print(Animal.values.hasFriendlyName('Dog')); // true
  print(Animal.values.hasFriendlyName('Fish')); // false

  print(Animal.values.getName(1)); // CAT
  print(Animal.values.getName(100)); //Bad state: No element

  print(Animal.values.getNames()); // [DOG, CAT, HONEY_BEE]
  print(Animal.values.getNames(values: [0, Animal.CAT])); // [DOG, CAT]
  print(Animal.values.getNamesExcept([0, Animal.HONEY_BEE])); // [CAT]

  print(Animal.values.getFriendlyNames()); // [Dog, Cat, Honey Bee]
  print(Animal.values
      .getFriendlyNames(values: [0, Animal.HONEY_BEE])); // [Dog, Honey Bee]
  print(Animal.values.getFriendlyNamesExcept([Animal.DOG, 1])); // [Honey Bee]

  print(Animal.values.fromName('DOG')); // Animal.DOG
  print(Animal.values.fromName('FISH')); // Bad state: No element

  print(Animal.values.fromFriendlyName('Honey Bee')); // Animal.HONEY_BEE
  print(Animal.values.fromFriendlyName('Fish')); // Bad state: No element

  print(Animal.values.toListExcept([Animal.DOG, 1])); // [Animal.HONEY_BEE]

  print(Animal.values.getRandom()); // Animal.HONEY_BEE
  print(Animal.values.getRandomName()); // DOG
  print(Animal.values.getRandomFriendlyName()); // Cat

  print(Animal.values.fromNames(['DOG', 'CAT'])); // [Animal.DOG, Animal.CAT]
  print(Animal.values.fromNames(['CAT', 'FISH'])); // Bad state: No element
  print(Animal.values.fromFriendlyNames(
      ['Honey Bee', 'Cat'])); // [Animal.HONEY_BEE, Animal.CAT]
  print(Animal.values
      .fromFriendlyNames(['Honey Bee', 'Fish'])); // Bad state: No element

  print(Animal.values.hasValue(1)); // true
  print(Animal.values.hasValue(Animal.CAT)); // true
  print(Animal.values.hasValue(100)); // false

  print(Animal.values.getValue('DOG')); // 0
  print(Animal.values.getValue('FISH')); // Bad state: No element

  print(Animal.values.fromValues([0, Animal.CAT])); // [Animal.DOG, Animal.CAT]

  print(Animal.values.getValues()); // [0, 1, 2]
  print(Animal.values.getValues(names: ['DOG'])); // [0]
  print(Animal.values.getValuesExcept([Animal.DOG, 1])); // [2]

  print(Animal.values.fromValue(1)); // Animal.CAT
  print(Animal.values.fromValue(Animal.CAT)); // Animal.CAT
  print(Animal.values.fromValue(100)); // Bad state: No element

  print(Animal.values.coerce(1)); // Animal.CAT
  print(Animal.values.coerce('CAT')); // Animal.CAT
  print(Animal.values.coerce(100)); // null
  print(Animal.values.coerce('FISH')); // null

  print(Animal.values.getRandomValue()); // 1
}
