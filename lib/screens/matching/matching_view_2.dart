import 'package:flutter/material.dart';
import 'package:flutter_quiz_matcher/flutter_quiz_matcher.dart';
import 'package:flutter_quiz_matcher/models/model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grad_project/experiance_shared_pref.dart';
import 'package:grad_project/screens/matching/dummy.dart';

class MatchingViewObj2 extends StatelessWidget {
  const MatchingViewObj2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: QuizMatcher(
      questions: [
        ...matchObject2.q!.map(
          (e) => Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black)),
            width: 100,
            height: 100,
            child: Image.asset(e),
          ),
        )
      ],
      answers: [
        ...matchObject2.a!.map(
          (e) => Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black)),
            width: 100,
            height: 100,
            child: Center(
                child: Text(
              e,
              style: TextStyle(fontSize: 20),
            )),
          ),
        )
      ],
      defaultLineColor: Colors.black,
      correctLineColor: Colors.green,
      incorrectLineColor: Colors.red,
      drawingLineColor: Colors.black,
      onScoreUpdated: (UserScore userAnswers) async{
        // print(userAnswers.questionIndex);
        // print(userAnswers.questionAnswer);
        if (userAnswers.questionAnswer == true) {
          Fluttertoast.showToast(msg: 'شاااااااطر');
          int? exValue = await Experiance.getExValue();
          Experiance.saveExValue(exValue! + 5);
          debugPrint('Experiance = ${await Experiance.getExValue()}');

        }
      },
      paddingAround: const EdgeInsets.all(20),
    ));
  }
}
