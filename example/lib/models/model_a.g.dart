// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_a.dart';

// **************************************************************************
// DataMonitorGenerator
// **************************************************************************

mixin _$ModelA on _ModelA {
  late final DataItem _counter = DataItem(this, super.counter);

  @override
  int get counter {
    return _counter.getValue();
  }

  @override
  set counter(int value) {
    _counter.setValue(value);
  }

  late final DataItem _testString = DataItem(this, super.testString);

  @override
  String get testString {
    return _testString.getValue();
  }

  @override
  set testString(String value) {
    _testString.setValue(value);
  }

  late final DataItem _testList = DataItem(
    this,
    MonitoredList<String>.from(this, super.testList),
  );

  @override
  List<String> get testList {
    return _testList.getValue();
  }

  late final DataItem _testMap = DataItem(
    this,
    MonitoredMap<int, String>.from(this, super.testMap),
  );

  @override
  Map<int, String> get testMap {
    return _testMap.getValue();
  }

  late final DataItem _testSet = DataItem(
    this,
    MonitoredSet<String>.from(this, super.testSet),
  );

  @override
  Set<String> get testSet {
    return _testSet.getValue();
  }
}
