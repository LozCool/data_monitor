import 'package:data_monitor/data_monitor.dart';

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

  // late MonitoredList<String> testList = MonitoredList(this);
  late MonitoredList<String>     testList = MonitoredList.from(this, ['A', 'B', 'C']);
  late MonitoredMap<int, String> testMap  = MonitoredMap(this);
  late MonitoredSet<String>      testSet  = MonitoredSet(this);
}
