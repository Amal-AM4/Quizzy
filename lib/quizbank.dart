import 'question.dart';

class Quizbank {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question(
      q: 'The `<script>` tag can only be placed in the `<head>` section of an HTML document.',
      a: false,
    ),
    Question(
      q: 'JavaScript can be used to change the content of an HTML element.',
      a: true,
    ),
    Question(
      q: 'JavaScript can be used to change the CSS styles of an HTML element.',
      a: true,
    ),
    Question(
      q: 'To use an external JavaScript file, you use the `<link>` tag.',
      a: false,
    ),
    Question(
      q: 'The `onclick` attribute in HTML is an example of an event handler.',
      a: true,
    ),
    Question(q: 'JavaScript is case-sensitive.', a: true),
    Question(
      q: 'Semicolons are always required at the end of every JavaScript statement.',
      a: false,
    ),
    Question(
      q: 'HTML5 introduced new APIs that can be accessed with JavaScript, like `localStorage`.',
      a: true,
    ),
    Question(
      q: '`document.write()` is the recommended way to add content to a webpage after it has loaded.',
      a: false,
    ),
    Question(
      q: '`innerHTML` and `innerText` are interchangeable and always produce the same output.',
      a: false,
    ),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber == _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
