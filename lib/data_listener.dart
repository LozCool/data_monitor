import 'package:flutter/widgets.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

import 'src/utilities/data_notifier.dart';

/// A widget that does not have any mutable state.
///
/// It does, however, take an instance argument that can be described as a
/// data repository, or model. The model should already have been constructed
/// prior to calling this class. It can, therefore, be shared across multiple
/// instances of the `DataListener` widget.
///
/// The `DataListener` widget will only be rebuilt when it receives change
/// notifications from the associated data model. This is an implementation
/// detail as it subscribes for such notifications internally. Also, it
/// tracks only changes to the data model passed as a constructor argument.
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
       final DataNotifier                  _model;
       final Widget Function(BuildContext) _builder;
  late final VoidCallback                  _listener;

  DataListener(
      this._model,

      {required this._builder}) : super(key: GlobalKey())
  {
      void listener() {
        Element element = (super.key as GlobalKey).currentContext as Element;

        element.markNeedsBuild();
      }
      _model.addListener(_listener = listener);
  }

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      return () {
        _model.removeListener(_listener);
      };
    }, []);

    return _builder(context);
  }
}
