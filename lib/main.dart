import 'package:flutter/material.dart';

import './question.dart';

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
      'What\s your favorite color?',
      'What\s your favorite animal?',
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
              questions[_questionIndex],
            ),
            ElevatedButton(
              child: Text('Answer 1'),
              onPressed: _answerQuestion, //onPressed takes a function
            ),
            ElevatedButton(
              child: Text('Answer 2'),
              onPressed: () => print('Answer 2 chosen!'),
            ),
            ElevatedButton(
              child: Text('Answer 3'),
              onPressed: () {
                // ...
                print('Answer 3 chosen');
              },
            ),
          ],
        ),
      ),
    );
  }
}
