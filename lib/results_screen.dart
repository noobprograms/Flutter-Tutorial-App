import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tutorial_project/data/questions.dart';

class ResultsScreen extends StatelessWidget {
  ResultsScreen(this.answers, this.switchingFunc, {super.key});
  final List<String> answers;
  final void Function() switchingFunc;
  var resultsSummary = [];
  var correctAnswers = 0;

  void generateSummary() {
    // TODO Generate summary from the results of quiz and display it on screen
    for (var i = 0; i < questions.length; i++) {
      print(i);
      print(answers[0]);
      resultsSummary.add({
        'currentQuestion': questions[i].text,
        'questionIndex': i + 1,
        "isCorrect": questions[i].answers[0] == answers[i] ? true : false,
        'chosenAnswer': answers[i],
        'correctAnswer': questions[i].answers[0],
      });
      if ((resultsSummary[i]['isCorrect'])) {
        ++correctAnswers;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    generateSummary();
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 73, 5, 114),
              Color.fromARGB(255, 24, 4, 59)
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You answered $correctAnswers out of ${questions.length} questions correctly',
                style: GoogleFonts.lato(
                  fontSize: 24,
                  color: Colors.deepPurple,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  height: 400,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ...resultsSummary
                            .map((e) => Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: e["isCorrect"]
                                                ? const Color.fromARGB(
                                                    255, 205, 255, 148)
                                                : const Color.fromARGB(
                                                    255, 227, 115, 115)),
                                        child: Center(
                                          child: Text(
                                            '${e['questionIndex']}',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            e['currentQuestion'],
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.lato(
                                                fontSize: 18,
                                                color: Colors.white),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            e['chosenAnswer'],
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: e["isCorrect"]
                                                    ? Colors.lightGreen
                                                    : const Color.fromARGB(
                                                        255, 227, 115, 115)),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            e['correctAnswer'],
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.lightGreen),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ))
                            .toList()
                      ],
                    ),
                  ),
                ),
              ),
              TextButton.icon(
                onPressed: switchingFunc,
                icon: Icon(
                  Icons.replay,
                  color: Colors.deepPurple,
                ),
                label: Text(
                  'Restart Quiz!',
                  style: TextStyle(
                    color: Colors.deepPurple,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
