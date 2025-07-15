import 'package:flutter/material.dart';

class StartQuiz extends StatelessWidget {
  const StartQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/quiz-logo.png", height: 300),
        SizedBox(height: 50),
        Text(
          "Learn Flutter the fun way!",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        SizedBox(height: 30),
        OutlinedButton(
          onPressed: () {},
          child: Text("Start Quiz", style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
