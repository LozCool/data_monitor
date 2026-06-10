## Example

You can create an example Flutter application that uses `data_monitor` by:

1. At the command line, run `flutter create your_app_name` to create a
   Simple Counter App.

2. Open the application in your favorite editor and delete `lib/main.dart`.

3. From the `data_monitor` example repository at [github.com](https://github.com/LozCool/data_monitor/tree/master/example/lib),
   insert the whole lib/ hierarchy into your local project:

```
  lib/
    models/
      model_a.dart
      model_b.dart
    pages/
      main_page.dart
      secondary_page.dart
    main.dart
```

4. Add the following dependencies to your project's `pubspec.yaml` file:

```
  dependencies:
    data_monitor: ^1.1.0
  
  dev_dependencies:
    build_runner: ^2.15.0
    data_monitor_generators: ^1.1.0
```

5. Perform a `pub get` to get the packages listed above.

7. Then (in a console) run the following command before you build / run
   your application:

```
  dart run build_runner build
```
