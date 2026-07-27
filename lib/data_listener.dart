import 'package:flutter/widgets.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

import 'src/utilities/data_notifier.dart';

/// A widget that does not have any mutable state.
///
/// It does, however, take an argument which is a list of what can be described
/// as data repositories, or models. The models in the list should already have
/// been constructed prior to calling this class. A range of chosen models can,
/// therefore, be shared across multiple instances of the `DataListener` widget.
///
/// The `DataListener` widget will only be rebuilt when it receives change
/// notifications from any of the associated data models. This is an
/// implementation detail as it subscribes for such notifications internally.
/// Also, it tracks only changes to the data models passed as a list in the
/// constructor argument.
///
/// The widget requires a builder `Function` that describes part of the user
/// interface by building a constellation of other widgets that describe the
/// user interface more concretely.
///
/// It can be used for tracking data changes that are very local to parts of
/// the application. But, much more importantly, it can be used to track
/// changes between various application components that want to communicate
/// with each other. The changes to a single data model are passed seamlessly
/// from one instance of a `DataListener` widget to other instances in the
/// application that reference the same underlying data model instance. Changes
/// can be sourced from anywhere.
class DataListener extends HookWidget
{
  late final void Function() _onNotified;

 final List<DataNotifier>            _models;
 final Widget Function(BuildContext) _builder;

  DataListener(
      this._models,

      {required this._builder}) : super(key: GlobalKey())
  {
      void listener() {
        Element element = (key as GlobalKey).currentContext as Element;

        element.markNeedsBuild();
      }
      _onNotified = listener;

      for (DataNotifier model in _models) {
        model.addListener(_onNotified);
      }
  }

  @override
  Widget build(
      BuildContext context)
  {
    useEffect(() {
      return () {
        for (DataNotifier model in _models) {
          model.removeListener(_onNotified);
        }
      };
    }, []);

    return _builder(context);
  }
}
