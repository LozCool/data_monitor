import 'package:flutter/material.dart';

import 'package:data_monitor/data_listener.dart';

import '../models/model_a.dart';
import '../models/model_b.dart';

class SecondaryPage extends StatefulWidget
{
  final String title;

  const SecondaryPage(
      {required this.title,

       super.key});

  @override
  State<SecondaryPage> createState() {
    return _SecondaryPageState();
  }
}

class _SecondaryPageState extends State<SecondaryPage>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            centerTitle: true,
            title: Text(widget.title)
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('You have pushed the button this many times:'),
              DataListener<ModelA>(
                builder: ((BuildContext context) {
                  ModelA model = DataListener.model<ModelA>();

                  return Text(
                      '${model.testInteger}',
                      style: Theme.of(context).textTheme.headlineMedium
                  );
                }),
                constructor: ModelA.new,
              ),
              DataListener<ModelB>(
                builder: ((BuildContext context) {
                  ModelB model = DataListener.model<ModelB>();

                  return Text(
                      '${model.testInteger}',
                      style: Theme.of(context).textTheme.headlineMedium
                  );
                }),
                constructor: ModelB.new,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          ModelA model = DataListener.model<ModelA>();

                          model.testInteger++;
                        },
                        child: const Icon(Icons.add)
                    ),
                    TextButton(
                        onPressed: () {
                          ModelB model = DataListener.model<ModelB>();

                          model.testInteger++;
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
