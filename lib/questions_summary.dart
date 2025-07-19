import 'package:flutter/material.dart';

const Color correctColor = const Color.fromARGB(255, 115, 190, 242);
const Color wrongColor = const Color.fromARGB(255, 254, 105, 241);

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((element) {
            final bool isAnswerCorrect =
                (element["correct_answer"] as String) ==
                (element["user_answer"] as String);
            // rgb(115, 190, 242)
            // rgb(254, 105, 241)

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  margin: const EdgeInsets.only(right: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isAnswerCorrect ? correctColor : wrongColor,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    ((element["question_index"] as int) + 1).toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        element["question"] as String,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: const Color.fromARGB(255, 214, 201, 207),
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        element["user_answer"] as String,
                        style: TextStyle(
                          color: const Color.fromARGB(255, 144, 83, 204),
                        ),
                      ),
                      Text(
                        element["correct_answer"] as String,
                        style: TextStyle(
                          color: const Color.fromARGB(255, 164, 157, 229),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
