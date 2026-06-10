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

## WARNING:

This package is in beta and still being tested. Please do not use it yet.

## Details

This package allows Flutter projects to utilize State Management to overcome
some of the limitations enforced by the framework.

Its main use is to create data repositories or models that allow callers to be
notified when changes are made to member fields. These changes are tracked
internally and cause Widgets that use the data to be rebuilt.

No more calls to setState().

## Features

Can be used (with more efficiency) to rebuild `StatelessWidget`. You can remove
all the verbose State code that is usually associated with a `StatefulWidget`.

## Getting started

The package is very simple to use. Just add code like the following to your
data model class:

```dart
@dataMonitor
abstract class ModelData extends ChangeNotifier {
  @monitor
  int count;

  @monitor
  String name = 'A Name';
}
```

## Usage

A fully working Flutter Application that describes how to use the various
features is available in the `/example` package.

## Additional information

Also included is a Code Generator that can be used with the `build_runner` package
to automatically generate boilerplate code from @annotations like the ones
seen above.
