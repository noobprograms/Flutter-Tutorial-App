import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen(this.changeScreen, {super.key});
  final void Function() changeScreen;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 73, 5, 114),
          Color.fromARGB(255, 24, 4, 59)
        ])),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(
                'assets/images/quiz-logo.png',
                width: 300,
                color: Colors.deepPurple[600],
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Learn flutter the Fun way",
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: changeScreen,
                child: const Text(
                  'Take Quiz',
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 14, 1, 57),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                  ), // background
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
