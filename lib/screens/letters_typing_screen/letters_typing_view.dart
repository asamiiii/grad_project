// ignore_for_file: must_be_immutable

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:grad_project/models/typing_letters_data_response.dart';
import 'package:grad_project/screens/letters_typing_screen/letters_typing_view_model.dart';
import 'package:grad_project/screens/letters_typing_screen/top_bar.dart';
import 'package:grad_project/utils/size_helper.dart';
import 'package:grad_project/widgets/to_right_left_button.dart';
import 'package:image_painter/image_painter.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

// ImagePainterController imagePainterController= ImagePainterController(mode: PaintMode.freeStyle);
ScrollPhysics scrollPhysicsZ = const AlwaysScrollableScrollPhysics();

class LettersTypingView extends StatefulWidget {
  List<Ques>? ques;
  LettersTypingView({super.key, required this.ques});

  @override
  State<LettersTypingView> createState() => _LettersViewState();
}

class _LettersViewState extends State<LettersTypingView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  // int index = 0;

  @override
  Widget build(BuildContext context) {
    // var unitsViewModel = context.read<UnitsViewModel>();
    return Scaffold(
      // appBar: AppBar(),

      body: Stack(
        children: [
          Container(
              width: SizeHelper.getScreenWidth(context: context),
              height: SizeHelper.getScreenHeight(context: context),
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 5.h),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/lesson.png',
                    ),
                    fit: BoxFit.fill),
              ),
              child: Column(
                children: [
                  const LettersTypingTopBar(),
                  SizeHelper.verticalSpace(35.h),
                  ToRightLeft(
                    toRight: () {
                      // debugPrint('Index : $index');
                      // if ((widget.ques!.length)  != index) {
                      // index= index+1;
                      // }
                      // debugPrint('Index : $index');
                      debugPrint('Index Length : ${widget.ques?.length}');
                      // imagePainterController.notifyListeners();
                      setState(() {});
                    },
                    toLeft: () {
                      // if (index > 0) {
                      // index= index-1;
                      // }
                      //  debugPrint('Index : $index');
                      debugPrint('Index Length : ${widget.ques?.length}');
                      //  imagePainterController.notifyListeners();
                      setState(() {});
                      // unitsViewModel.decreaseIndex();
                    },
                  )
                ],
              )),
          Positioned(
            left: 10.w,
            right: 5.w,
            top: 15.h,
            bottom: 20.h,
            child: Column(
              children: [
                SizeHelper.verticalSpace(5.h),
                //
                Expanded(
                  child: ListView.builder(
                    physics: scrollPhysicsZ,
                    itemCount: widget.ques?.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      // final imagePainterController=ImagePainterController();
                      return Container(
                        padding: EdgeInsets.all(15),
                        child: Stack(
                          children: [
                            ImagePainter.network(
                                widget.ques?[index].image?.secureUrl ?? '',
                                width: 70.w,
                                height: 50.h,
                                controller: widget
                                        .ques?[index].imagePainterController ??
                                    ImagePainterController(),
                                scalable: true),
                            SizeHelper.verticalSpace(5.h),
                            Positioned(
                                bottom: 0,
                                right: 10,
                                child: ElevatedButton(
                                    onPressed: () async {
                                      if (scrollPhysicsZ
                                          is AlwaysScrollableScrollPhysics) {
                                        scrollPhysicsZ =
                                            const NeverScrollableScrollPhysics();
                                      } else {
                                        scrollPhysicsZ =
                                            const AlwaysScrollableScrollPhysics();
                                      }
                                      setState(() {});
                                    },
                                    child: scrollPhysicsZ
                                            is AlwaysScrollableScrollPhysics
                                        ? Text('قف')
                                        : Text('أكمل '))),
                            Positioned(
                              bottom: 0,
                              left: 10,
                              child: ElevatedButton(
                                onPressed: () async {
                                  Uint8List? image = await widget
                                      .ques?[index].imagePainterController!
                                      .exportImage();
                                  File fileimage = await context
                                      .read<LettersTypingViewModel>()
                                      .convertUint8ListToFile(image!, 'test');
                                  context
                                      .read<LettersTypingViewModel>()
                                      .chechLetterTracing(
                                          InputImage.fromFile(
                                            fileimage,
                                          ),
                                          widget.ques?[index].text);
                                },
                                child: const Text('التحقق'),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class LetterTypingItem extends StatefulWidget {
//   Letter? letter;
//   LetterTypingItem({super.key, this.letter});

//   @override
//   State<LetterTypingItem> createState() => _LetterTypingItemState();
// }

// class _LetterTypingItemState extends State<LetterTypingItem> {
//   @override
//   Widget build(BuildContext context) {
//     /// Initialize `ImagePainterController`.

//     return Column(
//       children: [
//         SizeHelper.verticalSpace(5.h),
//         //
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             ImagePainter.network(widget.letter?.image ?? '',
//                 width: 70.w,
//                 height: 50.h,
//                 controller: ImagePainterController(mode: PaintMode.freeStyle),
//                 scalable: true),
//             // Image.asset(
//             //   letter?.image ?? '',
//             //   width: 30.w,
//             //   height: 15.h,
//             // ),
//             // Text(letter?.word ?? '',
//             //     style: TextStyle(color: Colors.green, fontSize: 50.sp)),
//           ],
//         ),
//       ],
//     );
//   }
// }

class LetterText extends StatelessWidget {
  const LetterText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('اسد', style: TextStyle(color: Colors.green, fontSize: 50.sp)),
        // SizeHelper.horizontalSpace(10.w),
        Text(
          'ا',
          style: TextStyle(color: Colors.green, fontSize: 50.sp),
        ),
      ],
    );
  }
}

changeScrollPhysics(ScrollPhysics scrollPhysics) {}
