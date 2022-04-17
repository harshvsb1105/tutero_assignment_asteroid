import 'package:flutter/material.dart';
import 'package:tutero_assignment_asteroid/views/game.view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        GameView.routeName: (context) => GameView(),
      },
      home: GameView(),
    );
  }
}
