library;

import 'package:flutter/widgets.dart';

/// A widget that does not have any mutable state.
///
/// It does, however, take a type that can be described as a data repository,
/// or model. It reacts to changes in that repository by rebuilding itself
/// in the widget tree whenever changes in the source occur.
///
/// The widget requires a builder [Function] that describes part of the user
/// interface by building a constellation of other widgets that describe the
/// user interface more concretely.
///
/// The ModelListener widget will only be rebuilt when it receives change
/// notifications from the associated data model. This is an implementation
/// detail as it subscribes for such notifications internally. Also, it
/// tracks only changes to a specific data model (or repository) type.
///
/// It can be used for tracking data changes that are very local to parts of
/// the application. But, much more importantly, it can be used to track
/// changes between various application components that want to communicate
/// with each other. The changes to a single data model are passed seamlessly
/// from one instance of a [DataListener] widget to other instances in the
/// application that reference the same underlying data source. Changes can
/// be sourced from anywhere.
///
/// The first time a [DataListener] of a type is created, it instantiates an
/// instance of the data model of that type. It is then internally tracked
/// for changes. Also, a reference to that (singleton) instance can accessed
/// elsewhere in the application by calling the static [model] method.
class DataListener<T> extends StatelessWidget
{
  static final Map<Type, ChangeNotifier> models = {};

  final Widget Function(BuildContext) builder;

  const DataListener._(
      {required this.builder,
       required Key? listenerKey}) : super(key: listenerKey);

  factory DataListener(
      {required Function constructor,
       required Widget   Function(BuildContext) builder})
  {
    GlobalKey       listenerKey = GlobalKey();
    ChangeNotifier? model       = models[T];

    model ??= models[T] = constructor();

    model?.addListener(() {
      Element element = listenerKey.currentContext as Element;

      element.markNeedsBuild();
    });
    return DataListener._(
        builder: builder,
        listenerKey: listenerKey);
  }

  static E model<E>() {
    E? returnValue = models[E] as E;

    if (returnValue == null) {
      throw Exception('Requested Model of type $E has not been instantiated.');
    }
    return returnValue;
  }

  @override
  Widget build(BuildContext context) {
    return builder(context);
  }
}
