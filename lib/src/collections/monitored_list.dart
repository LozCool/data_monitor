import 'dart:math' as math;

import 'package:collection/collection.dart';

import 'package:data_monitor/data_notifier.dart';
import 'package:data_monitor/data_listener.dart';

/// A `List<E>` that is monitored for internal changes which then
/// notify the data model within which it is declared.
class MonitoredList<T, E> extends DelegatingList<E>
{
  late final DataNotifier _model;

  bool _isInitialized = false;

  MonitoredList() : super(<E>[]);

  MonitoredList.from(super.list);

  @override
  void operator []=(int index, E value) {
    super[index] = value;
    notify();
  }

  @override
  void add(E value) {
    super.add(value);
    notify();
  }

  @override
  void addAll(Iterable<E> iterable) {
    super.addAll(iterable);
    notify();
  }

  @override
  void clear() {
    super.clear();
    notify();
  }

  @override
  void fillRange(int start, int end, [E? fillValue]) {
    super.fillRange(start, end, fillValue);
    notify();
  }

  @override
  void insert(int index, E element) {
    super.insert(index, element);
    notify();
  }

  @override
  void insertAll(int index, Iterable<E> iterable) {
    super.insertAll(index, iterable);
    notify();
  }

  @override
  bool remove(Object? value) {
    bool returnValue = super.remove(value);

    if (returnValue) {
      notify();
    }
    return returnValue;
  }

  @override
  E removeAt(int index) {
    E returnValue = super.removeAt(index);

    notify();

    return returnValue;
  }

  @override
  E removeLast() {
    E returnValue = super.removeLast();

    notify();

    return returnValue;
  }

  @override
  void removeRange(int start, int end) {
    super.removeRange(start, end);
    notify();
  }

  @override
  void removeWhere(bool Function(E) test) {
    super.removeWhere(test);
    notify();
  }

  @override
  void replaceRange(int start, int end, Iterable<E> iterable) {
    super.replaceRange(start, end, iterable);
    notify();
  }

  @override
  void retainWhere(bool Function(E) test) {
    super.retainWhere(test);
    notify();
  }

  @override
  void setAll(int index, Iterable<E> iterable) {
    super.setAll(index, iterable);
    notify();
  }

  @override
  void setRange(int start, int end, Iterable<E> iterable, [int skipCount = 0]) {
    super.setRange(start, end, iterable, skipCount);
    notify();
  }

  @override
  void shuffle([math.Random? random]) {
    super.shuffle(random);
    notify();
  }

  @override
  void sort([int Function(E, E)? compare]) {
    super.sort(compare);
    notify();
  }

  void notify() {
    if (!_isInitialized) {
      _isInitialized = true;
      _model         = DataListener.model<T>() as DataNotifier;
    }
    _model.notify();
  }
}
