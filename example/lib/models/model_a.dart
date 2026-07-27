import 'package:data_monitor/data_monitor.dart';

part 'model_a.g.dart';

ModelA modelA = ModelA();

class ModelA extends _ModelA with _$ModelA
{
  // Other methods etc for class
}

@dataMonitor
abstract class _ModelA extends DataNotifier
{
  @monitor
  int counter = 0;

  @monitor
  String testString = '';

  @monitor
  final List<String> testList = [ 'A - B - C' ];

  @monitor
  final Map<int, String> testMap = { 1: 'Hello' };

  @monitor
  final Set<String> testSet = { 'First' };
}
