import 'dart:collection';

import 'package:data_monitor/data_notifier.dart';
import 'package:data_monitor/data_listener.dart';

class MonitoredMap<T, K, V> extends MapBase<K, V>
{
  late final DataNotifier _model;
       final Map<K, V>    _map = {};

  bool _isInitialized = false;

  @override
  V? operator [](Object? key) {
    return _map[key];
  }

  @override
  void operator []=(K key, V value) {
    _map[key] = value;

    notify();
  }

  @override
  Iterable<K> get keys {
    return _map.keys;
  }

  @override
  void clear() {
    _map.clear();

    notify();
  }

  @override
  V? remove(Object? key) {
    V? returnValue = _map.remove(key);

    notify();

    return returnValue;
  }

  void notify() {
    if (!_isInitialized) {
      _isInitialized = true;
      _model         = DataListener.model<T>() as DataNotifier;
    }
    _model.notify();
  }
}