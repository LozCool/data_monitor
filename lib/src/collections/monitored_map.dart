import 'package:collection/collection.dart';

import '../utilities/data_notifier.dart';

/// A `Map<K, V>` that is monitored for internal changes which then
/// notify the data model with which it was instantiated.
class MonitoredMap<K, V> extends DelegatingMap<K, V>
{
  final DataNotifier _model;

  const MonitoredMap.from(this._model, super.map);

  MonitoredMap(this._model) : super(<K, V>{});

  @override
  void operator []=(K key, V value) {
    super[key] = value;
    _model.notify();
  }

  @override
  void addAll(Map<K, V> other) {
    super.addAll(other);
    _model.notify();
  }

  @override
  void addEntries(Iterable<MapEntry<K, V>> entries) {
    super.addEntries(entries);
    _model.notify();
  }

  @override
  void clear() {
    super.clear();
    _model.notify();
  }

  @override
  V putIfAbsent(K key, V Function() ifAbsent) {
    V returnValue = super.putIfAbsent(key, ifAbsent);

    _model.notify();

    return returnValue;
  }

  @override
  V? remove(Object? key) {
    V? returnValue = super.remove(key);

    _model.notify();

    return returnValue;
  }

  @override
  void removeWhere(bool Function(K, V) test) {
    super.removeWhere(test);
    _model.notify();
  }

  @override
  V update(K key, V Function(V) update, {V Function()? ifAbsent}) {
    V returnValue = super.update(key, update, ifAbsent: ifAbsent);

    _model.notify();

    return returnValue;
  }

  @override
  void updateAll(V Function(K, V) update) {
    super.updateAll(update);
    _model.notify();
  }
}