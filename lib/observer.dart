import 'package:dummy_mobx/reactive_context.dart';
import 'package:flutter/material.dart';

class Observer extends StatefulWidget {
  const Observer({super.key, required this.builder});

  final WidgetBuilder builder;

  @override
  State<Observer> createState() => ObserverState();
}

class ObserverState extends State<Observer> {
  final disposeListeners = <ValueChanged<ObserverState>>[];

  @override
  Widget build(BuildContext context) {
    ReactiveContext.initial.register(this);
    final widget = this.widget.builder(context);
    ReactiveContext.initial.reset();
    return widget;
  }

  @override
  void dispose() {
    for (final disposers in disposeListeners) {
      disposers(this);
    }
    disposeListeners.clear();
    super.dispose();
  }
}
