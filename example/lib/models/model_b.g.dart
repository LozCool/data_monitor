// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_b.dart';

// **************************************************************************
// DataMonitorGenerator
// **************************************************************************

mixin _$ModelBData on ModelBData {
  late final DataItem _testInteger = DataItem(testInteger, []);

  @override
  set testInteger(int value) {
    if (_testInteger.setValue(value)) {
      notify(() {
        super.testInteger = value;
      });
    }
  }

  late final DataItem _firstName = DataItem(firstName, [
    _fullName,
    _reversedFullName,
  ]);

  @override
  set firstName(String value) {
    if (_firstName.setValue(value)) {
      notify(() {
        super.firstName = value;
      });
    }
  }

  late final DataItem _lastName = DataItem(lastName, [
    _fullName,
    _reversedFullName,
  ]);

  @override
  set lastName(String value) {
    if (_lastName.setValue(value)) {
      notify(() {
        super.lastName = value;
      });
    }
  }

  late final DataProperty _fullName = DataProperty(super.fullName);

  @override
  String get fullName {
    return _fullName.isDirty
        ? _fullName.setValue(super.fullName)
        : _fullName.value;
  }

  late final DataProperty _reversedFullName = DataProperty(
    super.reversedFullName,
  );

  @override
  String get reversedFullName {
    return _reversedFullName.isDirty
        ? _reversedFullName.setValue(super.reversedFullName)
        : _reversedFullName.value;
  }
}
