import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

// void main() => runApp(MyApp()); // function that has one expression
// All widgets are classes

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  //Core widget
  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'Whats your favorite color?',
        'answers': ['Black', 'Red', 'Green', 'White'],
      },
      {
        'questionText': 'Whats your favorite animal?',
        'answers': ['Rabbit', 'Snake', 'Elephant', 'Lion'],
      },
      {
        'questionText': 'Whos your favorite instructor?',
        'answers': ['Max', 'Gunnar', 'Hjalti', 'Mónika'],
      },
    ];
    return MaterialApp(
      home: Scaffold(
        // Scaffold creates a base page design for you app
        appBar: AppBar(
          title: Text('My first app'),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'] as String,
            ),
            ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
