<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

## DataListener<T> class

A widget that does not have any mutable state.

It does, however, take a type that can be described as a data repository,
or model. It reacts to changes in that repository by rebuilding itself
in the widget tree whenever changes in the source occur.

The widget requires a builder `Function` that describes part of the user
interface by building a constellation of other widgets that describe the
user interface more concretely.

The ModelListener widget will only be rebuilt when it receives change
notifications from the associated data model. This is an implementation
detail as it subscribes for such notifications internally. Also, it tracks
only changes to a specific data model (or repository) type.

It can be used for tracking data changes that are very local to parts of
the application. But, much more importantly, it can be used to track
changes between various application components that want to communicate
with each other. The changes to a single data model are passed seamlessly
from one instance of a `DataListener` widget to other instances in the
application that reference the same underlying data source. Changes can
be sourced from anywhere.

The first time a `DataListener` of a type is created, it instantiates an
instance of the data model of that type. It is then internally tracked
for changes. Also, a reference to that (singleton) instance can accessed
elsewhere in the application by calling the static `model` method.
