import 'package:flutter/material.dart';
import 'package:animated_background/animated_background.dart';

import './quiz.dart';
import './result.dart';

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

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 2},
        {'text': 'Snake', 'score': 10},
        {'text': 'Elephant', 'score': 4},
        {'text': 'Lion', 'score': 7}
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Max', 'score': 2},
        {'text': 'John', 'score': 9},
        {'text': 'Lisa', 'score': 6},
        {'text': 'Bella', 'score': 4}
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  //Core widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // Scaffold creates a base page design for your app
        appBar: AppBar(
          title: Text('Amazing app'),
          backgroundColor: Colors.pink[200],
        ),
        body: Stack(
          children: [
            AnimatedBackground(
              behaviour: RandomParticleBehaviour(
                options: ParticleOptions(
                  spawnMaxRadius: 50,
                  spawnMinSpeed: 10.00,
                  particleCount: 68,
                  spawnMaxSpeed: 50,
                  minOpacity: 0.3,
                  spawnOpacity: 0.4,
                  baseColor: Colors.pink[100]!,
                ),
              ),
              vsync: this,
              child: Container(),
            ),
            _questionIndex < _questions.length
                ? Quiz(
                    answerQuestion: _answerQuestion,
                    questionIndex: _questionIndex,
                    questions: _questions,
                  )
                : Result(_totalScore, _resetQuiz),
          ],
        ),
      ),
    );
  }
}
