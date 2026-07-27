/// A class that will notify listeners to changes AFTER calling
/// the passed notify function (if one is provided).
///
/// It is possible to block these notifications, temporarily, by
/// calling the `maskNotifications` and `unmaskNotifications` methods.
/// This is especially important when you create (load) a data model's
/// instance from an external source (such as SQL or JSON).
///
/// This can be used to save an ENORMOUS amount of time when an App
/// is first started, or later, if it is 're-loaded'.
class DataNotifier
{
  static bool _isMasked = false;

  final _listeners = <void Function()>[];

  static void maskNotifications() {
    _isMasked = true;
  }

  static void unmaskNotifications() {
    _isMasked = false;
  }

  void addListener(
      void Function() listener)
  {
    _listeners.add(listener);
  }

  void dispose() {
    _listeners.clear();
  }

  bool isMasked() {
    return _isMasked;
  }

  void notify(
      [void Function()? notifier])
  {
    if (notifier != null) {
      notifier();
    }
    notifyListeners();
  }

  void notifyListeners() {
    if (!_isMasked) {
      for (final listener in _listeners) {
        listener();
      }
    }
  }

  void removeListener(
      void Function() listener)
  {
    _listeners.remove(listener);
  }
}
