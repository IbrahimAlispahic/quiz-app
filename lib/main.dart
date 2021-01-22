import 'package:flutter/material.dart';

import './models/question.dart' as modelQuestion;
import './models/answer.dart' as modelAnswer;
import 'widgets/quiz.dart';
import 'widgets/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<modelQuestion.Question> _questions = List();

  @override
  void initState() {
    _questions.add(
      modelQuestion.Question(
        questionText: "Prvo pitanje",
        answers: [
          modelAnswer.Answer(score: 1, text: "First Answer"),
          modelAnswer.Answer(score: 2, text: "Second Answer"),
          modelAnswer.Answer(score: 3, text: "third Answer"),
          modelAnswer.Answer(score: 4, text: "Fourth Answer"),
        ]
      ),
    );
    _questions.add(
      modelQuestion.Question(
        questionText: "Drugo pitanje",
        answers: [
          modelAnswer.Answer(score: 1, text: "First Answer"),
          modelAnswer.Answer(score: 2, text: "Second Answer"),
          modelAnswer.Answer(score: 3, text: "third Answer"),
          modelAnswer.Answer(score: 4, text: "Fourth Answer"),
        ]
      ),
    );    
    _questions.add(
      modelQuestion.Question(
        questionText: "Trece pitanje",
        answers: [
          modelAnswer.Answer(score: 1, text: "First Answer"),
          modelAnswer.Answer(score: 2, text: "Second Answer"),
          modelAnswer.Answer(score: 3, text: "third Answer"),
          modelAnswer.Answer(score: 4, text: "Fourth Answer"),
        ]
      ),
    );
    super.initState();
  }

  // final _questions = const [
  //   {
  //     'questionText': 'What\'s your favorite color?',
  //     'answers': [
  //       {'text': 'Black', 'score': 10},
  //       {'text': 'Red', 'score': 5},
  //       {'text': 'Green', 'score': 3},
  //       {'text': 'White', 'score': 1},
  //     ],
  //   },
  //   {
  //     'questionText': 'What\'s your favorite animal?',
  //     'answers': [
  //       {'text': 'Rabbit', 'score': 3},
  //       {'text': 'Snake', 'score': 11},
  //       {'text': 'Elephant', 'score': 5},
  //       {'text': 'Lion', 'score': 9},
  //     ],
  //   },
  //   {
  //     'questionText': 'What\'s your favorite time of the year?',
  //     'answers': [
  //       {'text': 'Spring', 'score': 1},
  //       {'text': 'Summer', 'score': 2},
  //       {'text': 'Fall', 'score': 3},
  //       {'text': 'Winter', 'score': 4},
  //     ],
  //   },
  // ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print("index: $_questionIndex");
    print("score: $_totalScore");
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Quiz app',
          ),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion,
              )
            : Result(
                resetHandler: _resetQuiz,
                resultScore: _totalScore,
              ),
      ),
      theme: ThemeData(primaryColor: Colors.amber),
    );
  }
}
