// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_a.dart';

// **************************************************************************
// DataMonitorGenerator
// **************************************************************************

mixin _$ModelAData on ModelAData {
  late final DataItem _testInteger = DataItem(testInteger, []);

  @override
  set testInteger(int value) {
    if (_testInteger.setValue(value)) {
      notify(() {
        super.testInteger = value;
      });
    }
  }

  late final DataItem _testString = DataItem(testString, []);

  @override
  set testString(String value) {
    if (_testString.setValue(value)) {
      notify(() {
        super.testString = value;
      });
    }
  }
}
