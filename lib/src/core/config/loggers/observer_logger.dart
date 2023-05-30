import 'package:loggy/loggy.dart';

/// Creating a mixin that implements the LoggyType interface.
mixin ObserverLogger implements LoggyType {
  @override
  Loggy<ObserverLogger> get loggy => Loggy<ObserverLogger>('OBSERVER');
}
