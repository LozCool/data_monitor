import 'package:flutter/material.dart';

import 'package:data_monitor/data_listener.dart';

import '../global.dart';

class SecondaryPage extends StatelessWidget
{
  late final TextEditingController firstController;
  late final TextEditingController lastController;

  SecondaryPage({super.key})
  {
    firstController = TextEditingController(text: modelB.firstName);
    lastController  = TextEditingController(text: modelB.lastName );
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
              DataListener(
                  modelA,
                  builder: ((BuildContext context) {
                    return Text(
                        '${modelA.testInteger}',
                        style: Theme.of(context).textTheme.headlineMedium
                    );
                  })
              ),
              DataListener(
                  modelB,
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
              ),
              DataListener(
                  modelB,
                  builder: ((BuildContext context) {
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: 250.0,
                              child: TextField(
                                  controller: firstController,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'First Name'
                                  ),
                                  onSubmitted: (String value) {
                                    modelB.firstName = value;
                                  }
                              )
                          ),
                          const SizedBox(height: 10.0),
                          SizedBox(
                              width: 250.0,
                              child: TextField(
                                  controller: lastController,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Last Name'
                                  ),
                                  onSubmitted: (String value) {
                                    modelB.lastName = value;
                                  }
                              )
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Your full name is: '),
                                Text(modelB.fullName, style: TextStyle(fontWeight: FontWeight.bold))
                              ]
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Or, it could be: '),
                                Text(modelB.reversedFullName, style: TextStyle(fontWeight: FontWeight.bold))
                              ]
                          )
                        ]
                    );
                  })
              )
            ],
          ),
        )
    );
  }
}
