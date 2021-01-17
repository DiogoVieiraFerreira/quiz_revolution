import 'package:flutter/material.dart';

import 'widgets/game_screen.dart';

void main() => runApp(QuizRevolution());

class QuizRevolution extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Revolution',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => GameScreen(),
      },
    );
  }
}
