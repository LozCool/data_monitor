import 'package:flutter/material.dart';

import 'package:data_monitor/data_listener.dart';

import '../models/model_a.dart';
import '../models/model_b.dart';

class SecondaryPage extends StatelessWidget
{
  late final ModelA modelA;
  late final ModelB modelB;

  SecondaryPage({super.key})
  {
    modelA = DataListener.prepare(constructor: ModelA.new);
    modelB = DataListener.prepare(constructor: ModelB.new);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            centerTitle: true,
            title: Text('State Management Secondary Page')
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('You have pushed the button this many times:'),
              DataListener<ModelA>(
                builder: ((BuildContext context) {
                  return Text(
                      '${modelA.testInteger}',
                      style: Theme.of(context).textTheme.headlineMedium
                  );
                })
              ),
              DataListener<ModelB>(
                builder: ((BuildContext context) {
                  return Text(
                      '${modelB.testInteger}',
                      style: Theme.of(context).textTheme.headlineMedium
                  );
                })
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          modelA.testInteger++;
                        },
                        child: const Icon(Icons.add)
                    ),
                    TextButton(
                        onPressed: () {
                          modelB.testInteger++;
                        },
                        child: const Icon(Icons.add)
                    )
                  ]
              )
            ],
          ),
        )
    );
  }
}
