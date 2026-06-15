import 'package:collection/collection.dart';

import 'package:data_monitor/data_notifier.dart';
import 'package:data_monitor/data_listener.dart';

/// A `Set<E>` that is monitored for internal changes which then
/// notify the data model within which it is declared.
class MonitoredSet<T, E> extends DelegatingSet<E>
{
  late final DataNotifier _model;

  bool _isInitialized = false;

  MonitoredSet() : super(<E>{});

  @override
  bool add(E value) {
    bool returnValue = super.add(value);

    if (returnValue) {
      notify();
    }
    return returnValue;
  }

  @override
  void addAll(Iterable<E> elements) {
    super.addAll(elements);
    notify();
  }

  @override
  void clear() {
    super.clear();
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
  void removeAll(Iterable<Object?> elements) {
    super.removeAll(elements);
    notify();
  }

  @override
  void removeWhere(bool Function(E) test) {
    super.removeWhere(test);
    notify();
  }

  @override
  void retainAll(Iterable<Object?> elements) {
    super.retainAll(elements);
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

/*
import 'dart:collection';

import 'package:data_monitor/data_notifier.dart';
import 'package:data_monitor/data_listener.dart';

class MonitoredSet<T, E> extends SetBase<E>
{
  late final DataNotifier _model;
       final Set<E>       _set = {};

  bool _isInitialized = false;

  @override
  Iterator<E> get iterator {
    return _set.iterator;
  }

  @override
  int get length {
    return _set.length;
  }

  @override
  bool add(E value) {
    bool returnValue = _set.add(value);

    notify();

    return returnValue;
  }

  @override
  bool contains(Object? element) {
    return _set.contains(element);
  }

  @override
  E? lookup(Object? element) {
    return _set.lookup(element);
  }

  @override
  bool remove(Object? value) {
    bool returnValue = _set.remove(value);

    notify();

    return returnValue;
  }

  @override
  Set<E> toSet() {
    return _set.toSet();
  }

  void notify() {
    if (!_isInitialized) {
      _isInitialized = true;
      _model         = DataListener.model<T>() as DataNotifier;
    }
    _model.notify();
  }
} */
