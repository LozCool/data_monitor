import 'package:data_monitor/annotations.dart';
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
}
