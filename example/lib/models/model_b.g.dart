// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_b.dart';

// **************************************************************************
// DataMonitorGenerator
// **************************************************************************

mixin _$ModelB on _ModelB {
  late final DataItem _counter = DataItem(this, super.counter);

  @override
  int get counter {
    return _counter.getValue();
  }

  @override
  set counter(int value) {
    _counter.setValue(value);
  }

  late final DataItem _firstName = DataItem(this, super.firstName, [
    _fullName,
    _reversedFullName,
  ]);

  @override
  String get firstName {
    return _firstName.getValue();
  }

  @override
  set firstName(String value) {
    _firstName.setValue(value);

    firstNamePropagate(value);
  }

  late final DataItem _lastName = DataItem(this, super.lastName, [
    _fullName,
    _reversedFullName,
  ]);

  @override
  String get lastName {
    return _lastName.getValue();
  }

  @override
  set lastName(String value) {
    _lastName.setValue(value);
  }

  late final DataProperty _fullName = DataProperty();

  @override
  String get fullName {
    return _fullName.isDirty
        ? _fullName.setValue(super.fullName)
        : _fullName.value;
  }

  late final DataProperty _reversedFullName = DataProperty();

  @override
  String get reversedFullName {
    return _reversedFullName.isDirty
        ? _reversedFullName.setValue(super.reversedFullName)
        : _reversedFullName.value;
  }
}
