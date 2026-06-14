import 'package:flutter/material.dart';

import 'package:data_monitor/data_listener.dart';

import '../models/model_a.dart';
import '../models/model_b.dart';
import 'secondary_page.dart';

class MainPage extends StatelessWidget
{
  late final ModelA modelA;
  late final ModelB modelB;

  MainPage({super.key})
  {
    modelA = DataListener.prepare(constructor: ModelA.new);
    modelB = DataListener.prepare(constructor: ModelB.new);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                            return SecondaryPage();
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
          child: DataListener<ModelA>(
              builder: (BuildContext context) {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('You have pushed the button this many times:'),
                      Text(
                          '${modelA.testInteger}',
                          style: Theme.of(context).textTheme.headlineMedium
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

                                  modelA.testList.add('X - Y - Z');
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
                      SizedBox(
                          height: 200,
                          width: 200,
                          child: Align(
                            alignment: Alignment.center,
                            child: ListView.builder(
                                itemBuilder: (BuildContext context, int index) {
                                  return Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(modelA.testList[index]!)
                                      ]
                                  );
                                },
                                itemCount: modelA.testList.length
                            ),
                          )
                      )
                    ]
                );
              }
          )
      )
    );
  }
}
