import 'package:flutter/material.dart';

import 'game_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "630710782",
      theme: ThemeData(

        primarySwatch: Colors.purple,
      ),
      home: const GamePage(),
    );
  }
}
//