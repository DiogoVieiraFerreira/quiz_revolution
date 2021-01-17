import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  GameScreen();

  @override
  _GameScreen createState() => _GameScreen();
}

class _GameScreen extends State<GameScreen> {
  //seconds
  int _remainingTime = 30;
  double _hinOpacity = 0;
  void _toggleHint(){
    setState(() {
      _hinOpacity = 1 - _hinOpacity;
    });
  }
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
                    hint("Hint: La Solution ultime"),
                    buildAnswersButtons(["Answer 1","Answer 2", "Answer 3"]),
                  ],
                ),
              ),
            ),
            buildHintButton(),
          ],
        ),
      ),
    );
  }

  Widget hint(text){
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 15),
      child : Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Opacity(
            child: Text(text, textScaleFactor: 1.0, textAlign: TextAlign.center),
            opacity: _hinOpacity,
          ),
        ],
      ),
    );
  }
  
  Column buildAnswersButtons(array){
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

  Widget buildHintButton() {
    return Center(
      child: FloatingActionButton(
        onPressed: () => _toggleHint(),
        child: Icon(Icons.help_outline),
        backgroundColor: Theme.of(context).accentColor,
      ),
    );
  }

  void timer(int howLongSeconds){
    DateTime totalTime = DateTime.now().add(Duration(seconds: howLongSeconds));
    Duration remainingTime = totalTime.difference(DateTime.now());
    // TODO refresh every time :)

  }
}