import 'package:flutter/material.dart';

import 'pages/primary_page.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget
{
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PrimaryPage(),
        theme: ThemeData(
            colorScheme: .fromSeed(seedColor: Colors.deepPurple)
        )
    );
  }
}
