import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_quiz_matcher/flutter_quiz_matcher.dart';
import 'package:flutter_quiz_matcher/models/model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grad_project/screens/matching/dummy.dart';
import 'package:grad_project/screens/units_of_level/units_view_model.dart';
import 'package:grad_project/utils/size_helper.dart';
import 'package:grad_project/widgets/close_button.dart';
import 'package:grad_project/widgets/to_right_left_button.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class MatchingView extends StatefulWidget {
  MatchingView({super.key});

  @override
  State<MatchingView> createState() => _MatchingViewState();
}

class _MatchingViewState extends State<MatchingView> {
  // int? index = 0;

  @override
  void initState() {
    // index = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UnitsViewModel>(
        builder:(context, value, child) =>  Stack(
          children: [
             matchingWidget(value.matchingIndex),
            
            Positioned(
                top: 80.h,
                left: 10,
                right: 10,
                child: ToRightLeft(
                  toRight: () {
                    context.read<UnitsViewModel>().increaseMatchingIndex(context);
                  },
                  toLeft: () {
                    context.read<UnitsViewModel>().decreaseMatchingIndex();
                    // debugPrint('index : $index');
        
                  },
                ))
          ],
        ),
      ),
    );
  }
}

List<String> listImagesLocations = [
  'assets/images/arabic.png',
  'assets/images/Arabic1.png',
  'assets/images/Arabic2.png',
];

List<String> listAnswer = [
  'X',
  'Y',
  'Z',
];


// ignore_for_file: must_be_immutable

// class LettersView extends StatefulWidget {
//   const LettersView({super.key});

//   @override
//   State<LettersView> createState() => _LettersViewState();
// }

// class _LettersViewState extends State<LettersView> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     //var lettersViewModel = context.read<LettersViewModel>();
//     var unitsViewModel = context.read<UnitsViewModel>();
//     return Scaffold(
//       // appBar: AppBar(),
//       body: Stack(
//         children: [
//           Container(
//               width: SizeHelper.getScreenWidth(context: context),
//               height: SizeHelper.getScreenHeight(context: context),
//               padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 5.h),
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage(
//                       'assets/images/lesson.png',
//                     ),
//                     fit: BoxFit.fill),
//               ),
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       XCloseButton(),
//                       SizeHelper.expandedSpace(),
//                       InkWell(
//                           onTap: () async {
//                             var soundUrl = unitsViewModel
//                                 .lessonsDataResponse
//                                 ?.categs?[unitsViewModel.index]
//                                 .video
//                                 ?.secureUrl;
//                             final player = AudioPlayer();
//                             await player.play(UrlSource(soundUrl ?? ''));
//                           },
//                           child: Image.asset('assets/images/audio.png'),
//                       ),
//                       SizeHelper.horizontalSpace(10),
//                       Image.asset('assets/images/refresh.png'),
//                       SizeHelper.horizontalSpace(10),
//                       const MenuButton(),
//                     ],
//                   ),
//                   SizeHelper.verticalSpace(35.h),
//                   ToRightLeft(
//                     toRight: () {
//                       // final player = AudioPlayer();
//                       // player.dispose();
//                       // player.stop();
//                       unitsViewModel.increaseIndex(context);
//                       // var soundUrl= unitsViewModel.lessonsDataResponse
//                       //           ?.categs?[lettersViewModel.index].video?.secureUrl;

//                       //  player.play(UrlSource(soundUrl??''));
//                       // player.stop();
//                     },
//                     toLeft: () {
//                       // final player = AudioPlayer();
//                       // player.stop();
//                       unitsViewModel.decreaseIndex();
//                       // var soundUrl= unitsViewModel.lessonsDataResponse
//                       //           ?.categs?[unitsViewModel.index].video?.secureUrl;
//                       //
//                       //        player.play(UrlSource(soundUrl??''));
//                       // player.stop();
//                     },
//                   )
//                 ],
//               )),
//           Positioned(
//             left: 12.w,
//             right: 12.w,
//             top: 18.h,
//             bottom: 18.h,
//             child: SizedBox(
//               // color: Colors.red,
//               height: SizeHelper.getScreenHeight(context: context) * 0.65,
//               width: SizeHelper.getScreenWidth(context: context) * 0.85,
//               child: Consumer<UnitsViewModel>(
//                   builder: (context, provider, child) => LetterItem(
//                         letter: provider
//                             .lessonsDataResponse?.categs?[provider.index],
//                       )),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class LetterItem extends StatelessWidget {
//   Categs? letter;
//   LetterItem({super.key, this.letter});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizeHelper.verticalSpace(5.h),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Text(letter?.text ?? '',
//                 style: TextStyle(color: Colors.green, fontSize: 35.sp,fontWeight: FontWeight.bold)),
//             // SizeHelper.horizontalSpace(10.w),
//             // Text(
//             //   letter?.text ?? '',
//             //   style: TextStyle(color: Colors.green, fontSize: 50.sp),
//             // ),
//           ],
//         ),
//         SizeHelper.verticalSpace(8.h),
//         Container(
//           height: 200,
//           width: 230,
//           child: CachedNetworkImage(
//             imageUrl: letter?.image?.secureUrl ?? '',
//             width: 150.w,
//             height: 30.h,
//             fit: BoxFit.fill,
//           ),
//         )
//       ],
//     );
//   }
// }

// class LetterText extends StatelessWidget {
//   const LetterText({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         Text('اسد', style: TextStyle(color: Colors.green, fontSize: 50.sp)),
//         // SizeHelper.horizontalSpace(10.w),
//         Text(
//           'ا',
//           style: TextStyle(color: Colors.green, fontSize: 50.sp),
//         ),
//       ],
//     );
//   }
// }

// class MenuButton extends StatelessWidget {
//   const MenuButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//         onTap: () {
//           showDialog(
//             context: context,
//             builder: (context) => MenuDialog(),
//           );
//         },
//         child: Image.asset('assets/images/menu.png'));
//   }
// }

// QuizMatcher(
//       questions: [
//         Container(
//           decoration:
//               BoxDecoration(border: Border.all(width: 1, color: Colors.black)),
//           width: 100,
//           height: 100,
//           child: Image.asset(listImagesLocations[0]),
//         ),
//         Container(
//           decoration:
//               BoxDecoration(border: Border.all(width: 1, color: Colors.black)),
//           width: 100,
//           height: 100,
//           child: Image.asset(listImagesLocations[1]),
//         ),
//       ],
//       answers: [
//         Container(
//           alignment: Alignment.center,
//           decoration:
//               BoxDecoration(border: Border.all(width: 1, color: Colors.black)),
//           width: 100,
//           height: 100,
//           child: Text(listAnswer[0]),
//         ),
//         Container(
//           alignment: Alignment.center,
//           decoration:
//               BoxDecoration(border: Border.all(width: 1, color: Colors.black)),
//           width: 100,
//           height: 100,
//           child: Text(listAnswer[1]),
//         ),
//       ],
//       defaultLineColor: Colors.black,
//       correctLineColor: Colors.green,
//       incorrectLineColor: Colors.red,
//       drawingLineColor: Colors.black,
//       onScoreUpdated: (UserScore userAnswers) {
//         // print(userAnswers.questionIndex);
//         // print(userAnswers.questionAnswer);
//         if (userAnswers.questionAnswer == true) {
//           Fluttertoast.showToast(msg: 'شاااااااطر');
//         }
//       },
//       paddingAround: const EdgeInsets.all(20),
//     );