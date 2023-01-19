import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

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
  final questions = const [
      {
        'questionText': "What's your favorite color?",
        'answers': ['Black', 'Red', 'Green'],
      },
      {
        'questionText': "What's your favorite animal?",
        'answers': ['Monkey', 'Shark', 'Lizzard', 'Bear', 'Wolf']
      },
      {
        'questionText': "Who's your favorite author?",
        'answers': [
          'J.R.R Tolkien',
          'Jane Austin',
          'Robert Jordan',
          'Brandon Sanderson'
        ]
      },
    ];

  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);

    if (_questionIndex < questions.length) {
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
        body: Column(
          children: [
            Question(questions[_questionIndex]['questionText'] as String),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
