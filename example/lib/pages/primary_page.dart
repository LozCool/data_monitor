import 'package:flutter/material.dart';

import 'package:data_monitor/data_listener.dart';

import '../models/model_a.dart';
import '../models/model_b.dart';
import 'secondary_page.dart';

class PrimaryPage extends StatelessWidget
{
  const PrimaryPage({super.key});

  @override
  Widget build(
      BuildContext context)
  {
    return Scaffold(
        appBar: AppBar(
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                            builder: (
                                BuildContext context)
                            {
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
            title: Text('State Management Primary Page')
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

                                          modelA.testList.add('X - Y - Z');
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
                        SizedBox(
                            height: 100,
                            width: 200,
                            child: Align(
                                alignment: Alignment.center,
                                child: ListView.builder(
                                    itemBuilder: (
                                        BuildContext context,
                                        int          index)
                                    {
                                      return Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(modelA.testList.elementAtOrNull(index) ?? '')
                                          ]
                                      );
                                    },
                                    itemCount: modelA.testList.length
                                )
                            )
                        ),
                        SizedBox(
                            height: 30,
                            width: 200,
                            child: Align(
                                alignment: Alignment.center,
                                child: ListView.builder(
                                    itemBuilder: (
                                        BuildContext context,
                                        int          index)
                                    {
                                      return Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(modelA.testMap.values.elementAtOrNull(index) ?? '')
                                          ]
                                      );
                                    },
                                    itemCount: modelA.testMap.length
                                )
                            )
                        ),
                        SizedBox(
                            height: 30,
                            width: 200,
                            child: Align(
                                alignment: Alignment.center,
                                child: ListView.builder(
                                    itemBuilder: (
                                        BuildContext context,
                                        int          index)
                                    {
                                      return Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(modelA.testSet.elementAtOrNull(index) ?? '')
                                          ]
                                      );
                                    },
                                    itemCount: modelA.testSet.length
                                )
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
