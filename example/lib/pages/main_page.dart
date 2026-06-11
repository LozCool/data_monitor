import 'package:flutter/material.dart';

import 'package:data_monitor/data_listener.dart';

import '../models/model_a.dart';
import '../models/model_b.dart';
import 'secondary_page.dart';

class MainPage extends StatelessWidget
{
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    ModelA modelA = DataListener.prepare(constructor: ModelA.new);
    ModelB modelB = DataListener.prepare(constructor: ModelB.new);

    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) {
                        return const SecondaryPage();
                      }
                    )
                );
              },
              child: Icon(Icons.arrow_forward_outlined, size: 25.0)
            )
          ],
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          centerTitle: true,
          title: Text('State Management Main Page')
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
