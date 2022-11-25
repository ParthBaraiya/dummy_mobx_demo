import 'package:dummy_mobx/observer.dart';
import 'package:dummy_mobx/reactive_context.dart';
import 'package:flutter/material.dart';

class Observable<T> extends ChangeNotifier {
  T _value;

  Observable(T initialValue) : _value = initialValue {
    addListener(() {
      for (final observer in _observers) {
        if (observer.mounted) {
          observer.setState(() {});
        }
      }
    });
  }

  final _observers = <ObserverState>[];

  T get value {
    if (ReactiveContext.initial.currentObserver != null &&
        !_observers.contains(ReactiveContext.initial.currentObserver)) {
      _observers.add(ReactiveContext.initial.currentObserver!);
      ReactiveContext.initial.currentObserver!.disposeListeners
          .add((observer) => _observers.remove(observer));
    }
    return _value;
  }

  set value(T newValue) {
    if (newValue != _value) {
      _value = newValue;
      notifyListeners();
    }
  }
}
