import 'package:flutter/material.dart';

class Answer extends StatefulWidget {
  const Answer(this.answer, this.switchQuestion, {super.key});
  final String answer;
  final Function() switchQuestion;
  @override
  State<Answer> createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.switchQuestion,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple[800],
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
      child: Text(
        widget.answer,
        textAlign: TextAlign.center,
      ),
    );
  }
}
