/// `DataItem` is used to track a field in a data model for changes.
///
/// When a change is detected, all associated `DataProperty` elements are
/// marked as dirty.
class DataItem
{
  List<DataProperty> properties;
  dynamic            value;

  DataItem(this.value, this.properties);

  bool setValue(dynamic newValue) {
    bool returnValue = false;

    if (newValue != value) {
      for (DataProperty property in properties) {
        property.isDirty = true;
      }
      returnValue = true;
    }
    return returnValue;
  }
}

/// A `DataProperty` can be marked as dirty by an associated `DataItem`
///
/// When it is dirty, its cached value is no longer used. Instead, it
/// is recalculated the next time its value is read (via its getter).
class DataProperty
{
  bool    isDirty = false;
  dynamic value;

  DataProperty(this.value);

  dynamic setValue(dynamic newValue) {
    isDirty = false;

    return value = newValue;
  }
}