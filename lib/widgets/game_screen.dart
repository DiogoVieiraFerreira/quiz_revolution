import 'dart:developer';

import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  GameScreen();

  @override
  _GameScreen createState() => _GameScreen();
}

class _GameScreen extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Questions"),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text("29.58", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Text("1/15", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Expanded(
              child: Center(
                child: Column (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildAnswersButtons(["Answer 1","Answer 2", "Answer 3"]),
                  ],
                ),
              ),
            ),
            buildHint(context),
          ],
        ),
      ),
    );
  }
}
Widget buildAnswersButtons(array){
  return Column(
    children: [
      ...array.map( (text) {
        return ElevatedButton(
          onPressed: () {
            log("Success click: $text");
          },
          child: SizedBox(
            width: double.infinity,
            child: Text(text, textScaleFactor: 2.0, textAlign: TextAlign.center)
          )
        );
      }),
    ],
  );
}
Widget buildHint(BuildContext context) {
  return Center(
    child: FloatingActionButton(
      onPressed: () => log("Success click: Hint"),
      child: Icon(Icons.help_outline),
      backgroundColor: Theme.of(context).accentColor,
    ),
  );
}