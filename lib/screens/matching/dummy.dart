import 'package:flutter/material.dart';
import 'package:flutter_quiz_matcher/flutter_quiz_matcher.dart';
import 'package:flutter_quiz_matcher/models/model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Matching{
  List<String>? q;
  List<String>? a;



  Matching({this.q,this.a});
  
}

List<Matching> matching =[
  Matching(q: ['assets/images/11.jpg','assets/images/15.jpg','assets/images/20.jpg','assets/images/18.jpg'],a:['11','15','20','18']),
  Matching(q: ['assets/images/b.jpg','assets/images/j.jpg','assets/images/k.jpg','assets/images/kh.jpg'],a:['b','j','k','kh']),
  Matching(q: ['assets/images/n.jpg','assets/images/t.jpg','assets/images/z.jpg','assets/images/a.jpg'],a:['n','t','z','a']),
  


  
];



Widget matchingWidget(int? index){
  if(index == 0){
   return QuizMatcher(
                questions: [
                  ...matching[0].q!.map(
                        (e) => Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.black)),
                          width: 100,
                          height: 100,
                          child: Image.asset(e),
                        ),
                      )
                  // Container(
                  //   decoration: BoxDecoration(
                  //       border: Border.all(width: 1, color: Colors.black)),
                  //   width: 100,
                  //   height: 100,
                  //   child: Image.asset(matching[index].q),
                  // ),
                ],
                answers: [
                  ...matching[0].a!.map(
                        (e) => Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.black)),
                          width: 100,
                          height: 100,
                          child: Center(child: Text(e,style: TextStyle(fontSize: 20),)),
                        ),
                      )
                  // Container(
                  //   alignment: Alignment.center,
                  //   decoration: BoxDecoration(
                  //       border: Border.all(width: 1, color: Colors.black)),
                  //   width: 100,
                  //   height: 100,
                  //   child: Text(listAnswer[0]),
                  // ),
                  // Container(
                  //   alignment: Alignment.center,
                  //   decoration: BoxDecoration(
                  //       border: Border.all(width: 1, color: Colors.black)),
                  //   width: 100,
                  //   height: 100,
                  //   child: Text(listAnswer[1]),
                  // ),
                ],
                defaultLineColor: Colors.black,
                correctLineColor: Colors.green,
                incorrectLineColor: Colors.red,
                drawingLineColor: Colors.black,
                onScoreUpdated: (UserScore userAnswers) {
                  // print(userAnswers.questionIndex);
                  // print(userAnswers.questionAnswer);
                  if (userAnswers.questionAnswer == true) {
                    Fluttertoast.showToast(msg: 'شاااااااطر');
                  }
                },
                paddingAround: const EdgeInsets.all(20),
              );
  } else if(index ==1){
    return QuizMatcher(
                questions: [
                  ...matching[1].q!.map(
                        (e) => Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.black)),
                          width: 100,
                          height: 100,
                          child: Image.asset(e),
                        ),
                      )
                  // Container(
                  //   decoration: BoxDecoration(
                  //       border: Border.all(width: 1, color: Colors.black)),
                  //   width: 100,
                  //   height: 100,
                  //   child: Image.asset(matching[index].q),
                  // ),
                ],
                answers: [
                  ...matching[1].a!.map(
                        (e) => Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.black)),
                          width: 100,
                          height: 100,
                          child: Center(child: Text(e,style: TextStyle(fontSize: 20),)),
                        ),
                      )
                  // Container(
                  //   alignment: Alignment.center,
                  //   decoration: BoxDecoration(
                  //       border: Border.all(width: 1, color: Colors.black)),
                  //   width: 100,
                  //   height: 100,
                  //   child: Text(listAnswer[0]),
                  // ),
                  // Container(
                  //   alignment: Alignment.center,
                  //   decoration: BoxDecoration(
                  //       border: Border.all(width: 1, color: Colors.black)),
                  //   width: 100,
                  //   height: 100,
                  //   child: Text(listAnswer[1]),
                  // ),
                ],
                defaultLineColor: Colors.black,
                correctLineColor: Colors.green,
                incorrectLineColor: Colors.red,
                drawingLineColor: Colors.black,
                onScoreUpdated: (UserScore userAnswers) {
                  // print(userAnswers.questionIndex);
                  // print(userAnswers.questionAnswer);
                  if (userAnswers.questionAnswer == true) {
                    Fluttertoast.showToast(msg: 'شاااااااطر');
                  }
                },
                paddingAround: const EdgeInsets.all(20),
              );
  }else{
    return QuizMatcher(
                questions: [
                  ...matching[2].q!.map(
                        (e) => Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.black)),
                          width: 100,
                          height: 100,
                          child: Image.asset(e),
                        ),
                      )
                  // Container(
                  //   decoration: BoxDecoration(
                  //       border: Border.all(width: 1, color: Colors.black)),
                  //   width: 100,
                  //   height: 100,
                  //   child: Image.asset(matching[index].q),
                  // ),
                ],
                answers: [
                  ...matching[2].a!.map(
                        (e) => Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.black)),
                          width: 100,
                          height: 100,
                          child: Center(child: Text(e,style: TextStyle(fontSize: 20),)),
                        ),
                      )
                  // Container(
                  //   alignment: Alignment.center,
                  //   decoration: BoxDecoration(
                  //       border: Border.all(width: 1, color: Colors.black)),
                  //   width: 100,
                  //   height: 100,
                  //   child: Text(listAnswer[0]),
                  // ),
                  // Container(
                  //   alignment: Alignment.center,
                  //   decoration: BoxDecoration(
                  //       border: Border.all(width: 1, color: Colors.black)),
                  //   width: 100,
                  //   height: 100,
                  //   child: Text(listAnswer[1]),
                  // ),
                ],
                defaultLineColor: Colors.black,
                correctLineColor: Colors.green,
                incorrectLineColor: Colors.red,
                drawingLineColor: Colors.black,
                onScoreUpdated: (UserScore userAnswers) {
                  // print(userAnswers.questionIndex);
                  // print(userAnswers.questionAnswer);
                  if (userAnswers.questionAnswer == true) {
                    Fluttertoast.showToast(msg: 'شاااااااطر');
                  }
                },
                paddingAround: const EdgeInsets.all(20),
              );
  }
}