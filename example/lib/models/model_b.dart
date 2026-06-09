import 'package:flutter/foundation.dart';

import 'package:annotations/annotations.dart';

part 'model_b.g.dart';

class ModelB extends ModelBData with _$ModelBData
{
  // Other methods etc for class
}

@dataMonitor
abstract class ModelBData extends ChangeNotifier
{
  @monitor
  int testInteger = 0;
}
