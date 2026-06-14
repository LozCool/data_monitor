import 'package:flutter/material.dart';

import 'pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
        theme: ThemeData(
          colorScheme: .fromSeed(seedColor: Colors.deepPurple)
        )
    );
  }
}
