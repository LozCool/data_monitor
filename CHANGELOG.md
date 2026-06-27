## 2.0.0

This is a major revision of the package but includes BREAKING CHANGES. Feel
free to continue using v1.x.x code while you migrate. This is a somewhat
simple process, but requires some thought.

  1. The main change is away from 'data type' towards 'instance' based
     data models.

  2. The ability to create multiple instances of the same data model class
     is now possible. Each instance will be tracked separately by the
     package. For example, imagine multiple 'controls' where each one has
     its own data model.

  3. The requirement to manually 'prepare' a model class has been removed.
     This implicitly means that such classes can now have complex constructors.

  4. All 'Typed' classes have been removed and now take an initial argument
     to their constructor which is the data model instance to be tracked.

  5. The package can now be used with a single
     `import 'package:data_monitor/data_monitor.dart';` statement.

  6. When you want to use the `data_listener` class in any Flutter code
     that you write, you must import its definition:
     `import 'package:data_monitor/data_listener.dart';`

Please see the updated Readme, documentation and /example for details.

## 1.1.7

Fixed major bug where `DataItem` was not tracking value changes correctly.

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