import 'package:data_monitor/annotations.dart';
import 'package:data_monitor/collections.dart';
import 'package:data_monitor/data_notifier.dart';

part 'model_a.g.dart';

class ModelA extends ModelAData with _$ModelAData
{
  // Other methods etc for class
}

@dataMonitor
abstract class ModelAData extends DataNotifier
{
  @monitor
  int testInteger = 0;

  @monitor
  String testString = '';

  MonitoredList<ModelA, String> testList = MonitoredList<ModelA, String>();
}
