import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int performComputation(int value) {
    // Your computation logic here
    int result = 0;
    for (int i = 0; i < value; i++) {
      result += i;
    }
    return result;
  }

  Future<int> runComputation(int value) async {
    return await compute(performComputation, value);
  }

  final int _counter = 0;

  void _incrementCounter() async {
    int result = await runComputation(100000000);
    log("_incrementCounter $result");
    // setState(() {
    //   _counter = result;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("widget.title"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const CircularProgressIndicator(),
            ElevatedButton(
              child: const Text('start'),
              onPressed: () async {
                // final sum = compute(computationallyExpensiveTask(1000000000),100);
                // print(sum);
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'gg',
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  int computationallyExpensiveTask(int value) {
    var sum = 0;
    for (var i = 0; i <= value; i++) {
      sum += i;
    }
    print('finished task');
    return sum;
  }
}
