import 'package:flutter/widgets.dart';

class DataNotifier extends ChangeNotifier
{
  void notify([Function? notifier]) {
    if (notifier != null) {
      notifier();
    }
    notifyListeners();
  }
}
