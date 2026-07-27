import 'package:flutter/material.dart';

import 'package:data_monitor/data_listener.dart';

import '../models/model_a.dart';
import '../models/model_b.dart';

class SecondaryPage extends StatelessWidget
{
  const SecondaryPage({super.key});

  @override
  Widget build(
      BuildContext context)
  {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            centerTitle: true,
            title: Text('State Management Secondary Page')
        ),
        body: Center(
            child: DataListener(
              [modelA, modelB],
              builder: (
                  BuildContext context)
              {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('You have pressed the buttons this many times:'),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                                children: [
                                  Text('${modelA.counter}', style: Theme.of(context).textTheme.headlineMedium),
                                  TextButton(
                                      onPressed: () {
                                        modelA.counter++;
                                      },
                                      child: const Icon(Icons.add),
                                  )
                                ]
                            ),
                            Column(
                                children: [
                                  Text('${modelB.counter}', style: Theme.of(context).textTheme.headlineMedium),
                                  TextButton(
                                      onPressed: () {
                                        modelB.counter++;
                                      },
                                      child: const Icon(Icons.add),
                                  )
                                ]
                            )
                          ]
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: 250.0,
                                child: TextField(
                                    controller: TextEditingController(text: modelB.firstName),
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'First Name'
                                    ),
                                    onSubmitted: (String value) {
                                      modelB.firstName = value;
                                    },
                                ),
                            ),
                            const SizedBox(height: 10.0),
                            SizedBox(
                                width: 250.0,
                                child: TextField(
                                    controller: TextEditingController(text: modelB.lastName),
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Last Name'
                                    ),
                                    onSubmitted: (String value) {
                                      modelB.lastName = value;
                                    },
                                ),
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Your full name is: '),
                                  Text(
                                      modelB.fullName,
                                      style: TextStyle(fontWeight: FontWeight.bold)
                                  ),
                                ],
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Or, it could be: '),
                                  Text(
                                      modelB.reversedFullName,
                                      style: TextStyle(fontWeight: FontWeight.bold)
                                  ),
                                ],
                            ),
                        ],
                      ),
                    ],
                );
              }
            )
       )
    );
  }
}
