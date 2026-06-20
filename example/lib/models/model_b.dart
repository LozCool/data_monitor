import 'package:data_monitor/annotations.dart';
import 'package:data_monitor/data_item.dart';
import 'package:data_monitor/data_notifier.dart';

part 'model_b.g.dart';

class ModelB extends ModelBData with _$ModelBData
{
  // Other methods etc for class
}

@dataMonitor
abstract class ModelBData extends DataNotifier
{
  @monitor
  int testInteger = 0;

  @monitor
  String firstName = '';

  @monitor
  String lastName = '';

  @cache
  String get fullName {
    return '$firstName $lastName';
  }

  @cache
  String get reversedFullName {
    return '$lastName,  $firstName';
  }
}
