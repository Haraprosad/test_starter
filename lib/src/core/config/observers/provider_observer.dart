import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../loggers/observer_logger.dart';

class PObserver extends ProviderObserver with ObserverLogger {
  @override
  void didAddProvider(ProviderBase<Object?> provider, Object? value,
      ProviderContainer container) {
    super.didAddProvider(provider, value, container);
    loggy.debug("Provider: add -> $provider value: $value");
  }

  @override
  void didUpdateProvider(ProviderBase<Object?> provider, Object? previousValue,
      Object? newValue, ProviderContainer container) {
    super.didUpdateProvider(provider, previousValue, newValue, container);

    loggy.debug(
        "Provider: update -> $provider value: $previousValue and new_value $newValue");
  }

  @override
  void didDisposeProvider(
      ProviderBase<Object?> provider, ProviderContainer container) {
    super.didDisposeProvider(provider, container);
    loggy.debug("Provider: dispose -> $provider and container: $container");
  }
}
