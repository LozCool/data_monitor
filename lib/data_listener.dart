library;

import 'package:flutter/widgets.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

import 'data_notifier.dart';

export 'package:data_monitor/data_listener.dart';

/// A widget that does not have any mutable state.
///
/// It does, however, take a type that can be described as a data repository,
/// or model. It reacts to changes in that repository by rebuilding itself
/// in the widget tree whenever changes in the source occur.
///
/// The widget requires a builder `Function` that describes part of the user
/// interface by building a constellation of other widgets that describe the
/// user interface more concretely.
///
/// The `ModelListener` widget will only be rebuilt when it receives change
/// notifications from the associated data model. This is an implementation
/// detail as it subscribes for such notifications internally. Also, it
/// tracks only changes to a specific data model (or repository) type.
///
/// It can be used for tracking data changes that are very local to parts of
/// the application. But, much more importantly, it can be used to track
/// changes between various application components that want to communicate
/// with each other. The changes to a single data model are passed seamlessly
/// from one instance of a `DataListener` widget to other instances in the
/// application that reference the same underlying data source (type). Changes
/// can be sourced from anywhere.
///
/// You MUST call the `prepare` method prior to using a `DataListener` widget
/// of the prepared type. Once prepared, this widget internally tracks changes
/// to the associated data repository.
///
/// A reference to a 'prepared' data model can also be obtained from anywhere
/// in the application by using the static `model` method.
class DataListener<T> extends HookWidget
{
  static final Map<Type, DataNotifier> _models = {};

  final VoidCallback                  _listener;
  final Widget Function(BuildContext) _builder;

  const DataListener._(
      {required this._builder,
       required this._listener,
       required Key listenerKey}) : super(key: listenerKey);

  factory DataListener(
      {required Widget Function(BuildContext) builder})
  {
    GlobalKey listenerKey = GlobalKey();

    void listener() {
      Element element = listenerKey.currentContext as Element;

      element.markNeedsBuild();
    }
    (model<T>() as DataNotifier).addListener(listener);

    return DataListener._(
        builder: builder,
        listener: listener,
        listenerKey: listenerKey);
  }

  static E model<E>() {
    E? model = _models[E] as E?;

    if (model == null) {
      throw Exception('Requested Model of type $E has not been prepared.');
    }
    return model;
  }

  static E prepare<E>(
      {required Function constructor}) {
    E? model = _models[E] as E?;

    model ??= _models[E] = constructor();

    return model!;
  }

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      return () {
        (model<T>() as DataNotifier).removeListener(_listener);
      };
    }, []);

    return _builder(context);
  }
}
