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
      'questionText': 'Hver er uppáhalds árstíðin þín?',
      'answers': [
        {'text': 'Vetur', 'score': 9},
        {'text': 'Haust', 'score': 5},
        {'text': 'Vor', 'score': 3},
        {'text': 'Sumar', 'score': 1}
      ],
    },
    {
      'questionText': 'Hvaða borg myndir þú vilja búa í?',
      'answers': [
        {'text': 'London', 'score': 2},
        {'text': 'Reykjavík', 'score': 8},
        {'text': 'New York', 'score': 4},
        {'text': 'Tokyo', 'score': 6}
      ],
    },
    {
      'questionText': 'Hvað langar þig að vera þegar þú ert orðin stór?',
      'answers': [
        {'text': 'Risaeðla', 'score': 2},
        {'text': 'Pípari', 'score': 9},
        {'text': 'Vélmenni', 'score': 6},
        {'text': 'Geimfari', 'score': 4}
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
          title: Text('Framtíðar appið'),
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
