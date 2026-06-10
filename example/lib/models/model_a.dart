import 'package:flutter/foundation.dart';

import 'package:data_monitor/annotations.dart';

part 'model_a.g.dart';

class ModelA extends ModelAData with _$ModelAData
{
  // Other methods etc for class
}

@dataMonitor
abstract class ModelAData extends ChangeNotifier
{
  @monitor
  int testInteger = 0;

  @monitor
  String testString = '';

  @monitor
  List<String> list = [];
}
