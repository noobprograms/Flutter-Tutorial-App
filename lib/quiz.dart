import 'package:flutter/material.dart';
import 'package:tutorial_project/data/questions.dart';
import 'package:tutorial_project/quiz_screen.dart';
import 'package:tutorial_project/results_screen.dart';
import 'package:tutorial_project/welcome_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> answers = [];
  var current_screen = 'welcomeScreen';
  void storeAnswer(String answer) {
    answers.add(answer);
    if (answers.length == questions.length)
      setState(() {
        current_screen = 'resultsScreen';
      });
  }

  void switchScreen() {
    setState(() {
      if (current_screen == 'welcomeScreen')
        current_screen = 'quizScreen';
      else {
        current_screen = 'quizScreen';
        answers = [];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = WelcomeScreen(switchScreen);
    if (current_screen == "quizScreen") {
      screenWidget = QuizScreen(storeAnswer);
    }
    if (current_screen == "resultsScreen") {
      screenWidget = ResultsScreen(answers, switchScreen);
    }

    return screenWidget;
  }
}
