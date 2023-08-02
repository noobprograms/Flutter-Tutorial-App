import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tutorial_project/answer_btn.dart';

import 'data/questions.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen(this.answerFunc, {super.key});
  final void Function(String ans) answerFunc;
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  var currentQuestionIndex = 0;

  void switchQuestion(String e) {
    widget.answerFunc(e);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[currentQuestionIndex];
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 73, 5, 114),
          Color.fromARGB(255, 24, 4, 59)
        ])),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  currentQuestion.text,
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                ...currentQuestion.getShuffledAnswers().map((e) {
                  return Answer(e, () {
                    switchQuestion(e);
                  });
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
