## 1.1.6

Added `@cache` annotation which allows property getters in a data model to
cache the results of a 'get' and only update the `DataListener` when a
change is made to any associated @monitored fields.

`DataItem` and `DataProperty` tracker objects now placed in '.g.dart'
files by the new (1.1.3) `data_monitor_generators`

See the new Readme for information about how to use @cached getters.

## 1.1.5

All collections have been refactored. They now offer their functions
in a much FASTER and scalable way.

`MonitoredList` now has the ability to be initialized upon creation:

```dart
  MonitoredList<ModelA, String> testList = MonitoredList.from(['A', 'B', 'C']);
```

## 1.1.4

Minor corrections to ReadMe


Modified visibility of various class members and fields
for better documentation.

## 1.1.3

Now includes `MonitoredMap` that can be used very succinctly in a data
model to listen to changes in the underlying Map using `DataListener`

Now includes `MonitoredSet` that can be used very succinctly in a data
model to listen to changes in the underlying Set using `DataListener`

## 1.1.2

Now includes `MonitoredList` that can be used very succinctly in a data
model to listen to changes in the underlying list using `DataListener`

Updated /example so that it provides a clearer picture of how to use
nested `DataListeners`

Fixed memory leak when a `DataListener` is used in a widget tree that
is later re-generated.

Updated /example documentation so that access to the github repository
is no longer needed to create the Application.

## 1.1.1

Greatly simplified user interface (API).

Updated /example. Now only uses StatelessWidget.

Updated /example readme file.

Updated other documentation.

## 1.1.0

Removed beta release warning and promoted to v1.1.0