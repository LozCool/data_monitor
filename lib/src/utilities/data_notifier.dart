/// A class that will notify listeners to changes AFTER calling
/// the passed notify function (if one is provided).
class DataNotifier
{
  final _listeners = <void Function()>[];

  void addListener(void Function() listener) {
    _listeners.add(listener);
  }

  void dispose() {
    _listeners.clear();
  }

  void notify([void Function()? notifier]) {
    if (notifier != null) {
      notifier();
    }
    notifyListeners();
  }

  void notifyListeners() {
    for (final listener in _listeners) {
      listener();
    }
  }

  void removeListener(void Function() listener) {
    _listeners.remove(listener);
  }
}
