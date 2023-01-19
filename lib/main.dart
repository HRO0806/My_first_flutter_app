import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyFirstApp());
}

class MyFirstApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyFirstAppState();
  }
}

class _MyFirstAppState extends State<MyFirstApp> {
  final _questions = const [
    {
      'questionText': "What's your favorite color?",
      'answers': [
        {'text': 'Black', 'score': 3},
        {'text': 'Red', 'score': 2},
        {'text': 'Green', 'score': 1}
      ],
    },
    {
      'questionText': "What's your favorite animal?",
      'answers': [
        {'text': 'Monkey', 'score': 1},
        {'text': 'Shark', 'score': 2},
        {'text': 'Lizard', 'score': 5},
        {'text': 'Bear', 'score': 3},
        {'text': 'Wolf', 'score': 4}
      ]
    },
    {
      'questionText': "Who's your favorite author?",
      'answers': [
        {'text': 'J.R.R Tolkien', 'score': 1},
        {'text': 'Jane Austen', 'score': 4},
        {'text': 'Robert Jordan', 'score': 2},
        {'text': 'Brandon Sanderson', 'score': 3}
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion() {

    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print('We have more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Henry's Flutter App"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(),
      ),
    );
  }
}
