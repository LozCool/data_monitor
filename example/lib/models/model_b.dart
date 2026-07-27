import 'package:data_monitor/data_monitor.dart';

part 'model_b.g.dart';

ModelB modelB = ModelB();

class ModelB extends _ModelB with _$ModelB
{
  // Other methods etc for class
}

@dataMonitor
abstract class _ModelB extends DataNotifier
{
  @monitor
  int counter = 0;

  @propagate
  String firstName = '';

  void firstNamePropagate(
      String value)
  {
    lastName = '';
  }

  @monitor
  String lastName = '';

  @cache
  String get fullName
  {
    return '$firstName $lastName';
  }

  @cache
  String get reversedFullName
  {
    return '$lastName,  $firstName';
  }
}
