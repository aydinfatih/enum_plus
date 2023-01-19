import 'dart:math';

mixin EnumPlus implements Enum {
  /// Return a value representation of the enum.
  dynamic toValue() {
    return this;
  }

  /// Checks if this instance is equal to the given enum instance or value.
  bool equal(dynamic value) {
    if (value == this) {
      return value == this;
    }

    return toValue() == value;
  }

  /// Checks if this instance is not equal to the given enum instance or value.
  bool notEqual(dynamic value) {
    return !equal(value);
  }

  /// Checks if a matching enum instance or value is in the given values.
  bool inside(List values) {
    return values.where((value) => equal(value)).isNotEmpty;
  }

  /// Checks if a matching enum instance or value is not in the given values.
  bool outside(List values) {
    return !inside(values);
  }

  /// Transform the name into a friendly, formatted version.
  String getFriendlyName() {
    return name.split(RegExp(r'(?<=[a-z])(?=[A-Z])|(?<=[A-Z])(?=[A-Z][a-z])|(_)|(?=[0-9])')).map((word) {
      var tempWord = word.toLowerCase();
      return tempWord.replaceFirst(tempWord[0], tempWord[0].toUpperCase());
    }).join(' ');
  }
}

extension EnumPlusListExtension<T extends EnumPlus> on Iterable<T> {
  /// Check that the enum contains a specific name.
  bool hasName(String name) {
    return asNameMap().containsKey(name);
  }

  /// Check that the enum contains a specific friendly name.
  bool hasFriendlyName(String friendlyName) {
    return where((item) => item.getFriendlyName() == friendlyName).isNotEmpty;
  }

  /// Get all or a custom set of the enum names.
  List<String> getNames({List<dynamic>? values}) {
    if (values == null) {
      return asNameMap().keys.toList();
    }

    return fromValues(values).map((item) => item.name).toList();
  }

  /// Get the name for a single enum value.
  String getName(dynamic value) {
    return firstWhere((item) => item.toValue() == value).name;
  }

  /// Return names of all the enums except the given values.
  List<String> getNamesExcept(List<dynamic> values) {
    return where((item) => item.outside(values)).getNames();
  }

  /// Get all or a custom set of the enum friendly names.
  List<String> getFriendlyNames({List<dynamic>? values}) {
    if (values == null) {
      return map((item) => item.getFriendlyName()).toList();
    }

    return fromValues(values).map((item) => item.getFriendlyName()).toList();
  }

  /// Return friendly names of all the enums except the given values.
  List<String> getFriendlyNamesExcept(List<dynamic> values) {
    return where((item) => item.outside(values)).getFriendlyNames();
  }

  /// Get enums from names.
  List<T> fromNames(List<String> names) {
    return names.map(fromName).toList();
  }

  /// Get enums from friendly names.
  List<T> fromFriendlyNames(List<String> friendlyNames) {
    return friendlyNames.map(fromFriendlyName).toList();
  }

  /// Make an enum instance from a given key.
  T fromName(String name) {
    return firstWhere((item) => item.name == name);
  }

  /// Make an enum instance from a given friendly name.
  T fromFriendlyName(String friendlyName) {
    return firstWhere((item) => item.getFriendlyName() == friendlyName);
  }

  /// Return instances of all the enums except the given values.
  List<T> toListExcept(List<dynamic> values) {
    return where((item) => item.outside(values)).toList();
  }

  /// Get a random instance of the enum.
  T getRandom() {
    return elementAt(Random().nextInt(length));
  }

  /// Get a random name of the enum.
  String getRandomName() {
    return getRandom().name;
  }

  /// Get a random friendly name of the enum.
  String getRandomFriendlyName() {
    return getRandom().getFriendlyName();
  }

  /// Check that the enum contains a specific value.
  bool hasValue(dynamic value) {
    if (value.runtimeType == T) {
      return contains(value);
    }

    return getValues().contains(value);
  }

  /// Get all or a custom set of the enum values.
  List<dynamic> getValues({List<String>? names}) {
    if (names == null) {
      return map((T item) => item.toValue()).toList();
    }

    return names.map((value) => getValue(value)).toList();
  }

  /// Get the value for a single enum key.
  dynamic getValue(String name) {
    return firstWhere((item) => item.name == name).toValue();
  }

  /// Return values of all the enums except the given values.
  List<dynamic> getValuesExcept(List<dynamic> values) {
    return where((item) => item.outside(values)).getValues();
  }

  /// Make a new instance from an enum value.
  T fromValue(dynamic value) {
    if (value.runtimeType == T) {
      return value;
    }

    return firstWhere((item) => item.toValue() == value);
  }

  /// Return instances from enum values
  List<T> fromValues(List<dynamic> values) {
    return values.map(fromValue).toList();
  }

  /// Attempt to instantiate a new Enum using the given key or value.
  T? coerce(dynamic enumNameOrValue) {
    if (enumNameOrValue == null) {
      return null;
    }

    if (hasValue(enumNameOrValue)) {
      return fromValue(enumNameOrValue);
    }

    if (hasName(enumNameOrValue.toString()) && enumNameOrValue.runtimeType == String) {
      return fromName(enumNameOrValue);
    }

    return null;
  }

  /// Get a random value of the enum.
  dynamic getRandomValue() {
    return getValues().elementAt(Random().nextInt(length));
  }
}
