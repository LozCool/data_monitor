import 'package:collection/collection.dart';

import '../utilities/data_notifier.dart';

/// A `Set<E>` that is monitored for internal changes which then
/// notify the data model with which it was instantiated.
class MonitoredSet<E> extends DelegatingSet<E>
{
  final DataNotifier _model;

  const MonitoredSet.from(this._model, super.set);

  MonitoredSet(this._model) : super(<E>{});

  @override
  bool add(E value) {
    bool returnValue = super.add(value);

    if (returnValue) {
      _model.notify();
    }
    return returnValue;
  }

  @override
  void addAll(Iterable<E> elements) {
    super.addAll(elements);
    _model.notify();
  }

  @override
  void clear() {
    super.clear();
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
  void removeAll(Iterable<Object?> elements) {
    super.removeAll(elements);
    _model.notify();
  }

  @override
  void removeWhere(bool Function(E) test) {
    super.removeWhere(test);
    _model.notify();
  }

  @override
  void retainAll(Iterable<Object?> elements) {
    super.retainAll(elements);
    _model.notify();
  }
}
