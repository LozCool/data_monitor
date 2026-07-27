import 'dart:math' as math;

import 'package:collection/collection.dart';

import '../utilities/data_notifier.dart';

/// A `List<E>` that is monitored for internal changes which then
/// notify the data model with which it was instantiated.
class MonitoredList<E> extends DelegatingList<E>
{
  final DataNotifier _model;

  const MonitoredList.from(this._model, super.list);

  MonitoredList(this._model) : super(<E>[]);

  @override
  void operator []=(int index, E value) {
    super[index] = value;
    _model.notify();
  }

  @override
  void add(E value) {
    super.add(value);
    _model.notify();
  }

  @override
  void addAll(Iterable<E> iterable) {
    super.addAll(iterable);
    _model.notify();
  }

  @override
  void clear() {
    super.clear();
    _model.notify();
  }

  @override
  void fillRange(int start, int end, [E? fillValue]) {
    super.fillRange(start, end, fillValue);
    _model.notify();
  }

  @override
  void insert(int index, E element) {
    super.insert(index, element);
    _model.notify();
  }

  @override
  void insertAll(int index, Iterable<E> iterable) {
    super.insertAll(index, iterable);
    _model.notify();
  }

  @override
  bool remove(Object? value) {
    bool returnValue = super.remove(value);

    if (returnValue) {
      _model.notify();
    }
    return returnValue;
  }

  @override
  E removeAt(int index) {
    E returnValue = super.removeAt(index);

    _model.notify();

    return returnValue;
  }

  @override
  E removeLast() {
    E returnValue = super.removeLast();

    _model.notify();

    return returnValue;
  }

  @override
  void removeRange(int start, int end) {
    super.removeRange(start, end);
    _model.notify();
  }

  @override
  void removeWhere(bool Function(E) test) {
    super.removeWhere(test);
    _model.notify();
  }

  @override
  void replaceRange(int start, int end, Iterable<E> iterable) {
    super.replaceRange(start, end, iterable);
    _model.notify();
  }

  @override
  void retainWhere(bool Function(E) test) {
    super.retainWhere(test);
    _model.notify();
  }

  @override
  void setAll(int index, Iterable<E> iterable) {
    super.setAll(index, iterable);
    _model.notify();
  }

  @override
  void setRange(int start, int end, Iterable<E> iterable, [int skipCount = 0]) {
    super.setRange(start, end, iterable, skipCount);
    _model.notify();
  }

  @override
  void shuffle([math.Random? random]) {
    super.shuffle(random);
    _model.notify();
  }

  @override
  void sort([int Function(E, E)? compare]) {
    super.sort(compare);
    _model.notify();
  }
}
