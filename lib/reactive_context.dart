import 'package:dummy_mobx/observer.dart';

class ReactiveContext {
  static final initial = ReactiveContext();

  ObserverState? _currentObserver;

  ObserverState? get currentObserver => _currentObserver;

  void register(ObserverState observer) => _currentObserver = observer;

  void reset() => _currentObserver = null;
}
