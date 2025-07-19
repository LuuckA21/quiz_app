import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

const String tagStartScreen = "start-screen";
const String tagQuestionsScreen = "questions-screen";
const String tagResultsScreen = "results-screen";

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  String activeScreen = tagStartScreen;
  final List<String> selectedAnswers = [];

  // @override
  // void initState() {
  //   super.initState();
  //   activeScreen = StartScreen(switchScreen);
  // }

  void switchScreen() {
    setState(() {
      activeScreen = tagQuestionsScreen;
    });
  }

  void restartQuiz() {
    selectedAnswers.clear();
    setState(() {
      activeScreen = tagQuestionsScreen;
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = tagResultsScreen;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Widget screenWidget = activeScreen == tagStartScreen
        ? StartScreen(switchScreen)
        : activeScreen == tagQuestionsScreen
        ? QuestionsScreen(chooseAnswer)
        : ResultsScreen(
            selectedAnswers: selectedAnswers,
            onRestartQuiz: restartQuiz,
          );

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
