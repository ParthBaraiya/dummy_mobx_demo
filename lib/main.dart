import 'package:dummy_mobx/observable.dart';
import 'package:dummy_mobx/observer.dart';
import 'package:flutter/material.dart';

final value1 = Observable(0);
final value2 = Observable(0);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mobx Dummy"),
      ),
      body: Center(
        child: Observer(
          builder: (_) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text("Number 1"),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) =>
                        value1.value = int.parse(value.isEmpty ? '0' : value),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text("Number 2"),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) =>
                        value2.value = int.parse(value.isEmpty ? '0' : value),
                  ),
                  Text("Sum is: ${value1.value + value2.value}")
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
