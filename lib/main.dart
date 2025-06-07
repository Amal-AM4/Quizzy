import 'dart:ffi';

import 'package:flutter/material.dart';
import 'question.dart';

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
  List<Icon> scoreKeeper = [
    // Icon(Icons.done, color: Colors.green),
    // Icon(Icons.clear, color: Colors.red),
  ];

  // List<String> questions = [
  //   'The `<script>` tag can only be placed in the `<head>` section of an HTML document.',
  //   'JavaScript can be used to change the content of an HTML element.',
  //   'JavaScript can be used to change the CSS styles of an HTML element.',
  //   'To use an external JavaScript file, you use the `<link>` tag.',
  //   'The `onclick` attribute in HTML is an example of an event handler.',
  //   'JavaScript is case-sensitive.',
  //   'Semicolons are always required at the end of every JavaScript statement.',
  //   'HTML5 introduced new APIs that can be accessed with JavaScript, like `localStorage`.',
  //   '`document.write()` is the recommended way to add content to a webpage after it has loaded.',
  //   '`innerHTML` and `innerText` are interchangeable and always produce the same output.',
  // ];

  // List<bool> answers = [
  //   false,
  //   true,
  //   true,
  //   false,
  //   true,
  //   true,
  //   false,
  //   true,
  //   false,
  //   false,
  // ];

  Question q1 = Question(q: 'The `<script>` tag can only be placed in the `<head>` section of an HTML document.', a: false);

  int questionNumber = 0;

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
                '${questionNumber + 1}: ${questions[questionNumber]}',
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
                bool correctAnswer = answers[questionNumber];

                if (correctAnswer == true) {
                  print('right');
                } else {
                  print('wrong');
                }

                setState(() {
                  questionNumber++;
                });
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
                bool correctAnswer = answers[questionNumber];

                if (correctAnswer == false) {
                  print('right');
                } else {
                  print('wrong');
                }
                setState(() {
                  questionNumber++;
                });
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
