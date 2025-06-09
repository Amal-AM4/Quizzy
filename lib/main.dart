import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
// import 'question.dart';
import 'quizbank.dart';

Quizbank quizbank = Quizbank();

void main() {
  runApp(const Quizzy());
}

class Quizzy extends StatelessWidget {
  const Quizzy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  int slNo = 1;

  void checkAnswer(bool userSelectedAnswer) {
    bool correctAnswer = quizbank.getQuestionAnswer();
    setState(() {

      if (quizbank.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished',
          desc: 'You are completed the quiz sucessfully',
        ).show();

        quizbank.reset();
        scoreKeeper = [];
        slNo = 1;
      } else {
        if (userSelectedAnswer == correctAnswer) {
                // print('right');
                scoreKeeper.add(Icon(Icons.done, color: Colors.green,));
              } else {
                // print('wrong');
                scoreKeeper.add(Icon(Icons.close, color: Colors.red,));
              }
            
              slNo++;
              quizbank.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Text(
                '$slNo: ${quizbank.getQuestionText()}',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                checkAnswer(true);
              },
              style: TextButton.styleFrom(backgroundColor: Colors.green),
              child: Text(
                'True',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                checkAnswer(false);
              },
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              child: Text(
                'False',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
        ),
        Row(children: scoreKeeper),
      ],
    );
  }
}
