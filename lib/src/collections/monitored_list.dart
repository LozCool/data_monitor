import 'dart:collection';

import 'package:data_monitor/data_notifier.dart';
import 'package:data_monitor/data_listener.dart';

class MonitoredList<T, E> extends ListBase<E?>
{
  late final DataNotifier model;
       final List<E?>     list = [];

  bool isInitialized = false;

  @override
  E? operator [](int index) {
    return list[index];
  }

  @override
  void operator []=(int index, E? element) {
    list[index] = element;

    notify();
  }

  @override
  int get length {
    return list.length;
  }

  @override
  set length(int value) {
    list.length = value;

    notify();
  }

  @override
  void add(E? element) {
    list.add(element);

    length = list.length;
  }

  void notify() {
    if (!isInitialized) {
      isInitialized = true;
      model         = DataListener.model<T>() as DataNotifier;
    }
    model.notify();
  }
}
