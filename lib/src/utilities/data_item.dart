import 'package:data_monitor/data_monitor.dart';

/// `DataItem` is used to track a field in a data model for changes.
///
/// When a change is detected, all associated `DataProperty` elements are
/// marked as dirty, as well as the associated data model being notified.
///
/// This only happens after the first time a field has been read (using
/// its getter). The `DataNotifier` from which the model extends is used
/// to generate notifications. These can be temporarily 'masked' to great
/// effect. Please see the `DataNotifier` documentation.
///
/// Can throw an Exception if you try to re-assign a `List`, `Map` or `Set`
/// that has been annotated with `@monitor` because it has internally
/// been 'mutated' to cover notifications in the Collection.
class DataItem
{
  final DataNotifier        _model;
  final List<DataProperty>? _properties;

  bool    _isActive = false;
  dynamic _value;

  DataItem(
      this._model,
      this._value,

      [this._properties]
  );

  dynamic getValue() {
    if (!_model.isMasked()) {
      _isActive = true;
    }
    return _value;
  }

  void setValue(
      dynamic newValue,
     [bool isMutated = false])
  {
    // if (isMutated) {
    //   throw Exception('@monitor types of List, Map and Set should not be re-assigned. Mark them as \'final\' in your data model to avoid this possibility.');
    // }
    if (_isActive && newValue != _value) {
      if (_properties != null) {
        for (DataProperty property in _properties) {
          property.isDirty = true;
        }
      }
      _model.notify();
    }
    _value = newValue;
  }
}

/// A `DataProperty` can be marked as dirty by an associated `DataItem`
///
/// When it is dirty, its cached value is no longer used. Instead, it
/// is recalculated the next time its value is read (via its getter).
class DataProperty
{
  bool    isDirty = true;
  dynamic value;

  dynamic setValue(
      dynamic newValue)
  {
    isDirty = false;

    return value = newValue;
  }
}