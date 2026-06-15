import 'package:collection/collection.dart';

import 'package:data_monitor/data_notifier.dart';
import 'package:data_monitor/data_listener.dart';

/// A `Map<K, V>` that is monitored for internal changes which then
/// notify the data model within which it is declared.
class MonitoredMap<T, K, V> extends DelegatingMap<K, V>
{
  late final DataNotifier _model;

  bool _isInitialized = false;

  MonitoredMap() : super(<K, V>{});

  @override
  void operator []=(K key, V value) {
    super[key] = value;
    notify();
  }

  @override
  void addAll(Map<K, V> other) {
    super.addAll(other);
    notify();
  }

  @override
  void addEntries(Iterable<MapEntry<K, V>> entries) {
    super.addEntries(entries);
    notify();
  }

  @override
  void clear() {
    super.clear();
    notify();
  }

  @override
  V putIfAbsent(K key, V Function() ifAbsent) {
    V returnValue = super.putIfAbsent(key, ifAbsent);

    notify();

    return returnValue;
  }

  @override
  V? remove(Object? key) {
    V? returnValue = super.remove(key);

    notify();

    return returnValue;
  }

  @override
  void removeWhere(bool Function(K, V) test) {
    super.removeWhere(test);
    notify();
  }

  @override
  V update(K key, V Function(V) update, {V Function()? ifAbsent}) {
    V returnValue = super.update(key, update, ifAbsent: ifAbsent);

    notify();

    return returnValue;
  }

  @override
  void updateAll(V Function(K, V) update) {
    super.updateAll(update);
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