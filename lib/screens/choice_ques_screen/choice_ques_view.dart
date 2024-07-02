import 'package:flutter/material.dart';
import 'package:grad_project/constants/constants.dart';
import 'package:grad_project/screens/choice_ques_screen/top_bar.dart';
import 'package:grad_project/screens/units_of_level/units_view_model.dart';
import 'package:grad_project/utils/size_helper.dart';
import 'package:grad_project/widgets/custom_button.dart';
import 'package:grad_project/widgets/to_right_left_button.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
class ChoiceQuestionView extends StatefulWidget {
  const ChoiceQuestionView({super.key});

  @override
  State<ChoiceQuestionView> createState() => _ChoiceQuestionViewState();
}

class _ChoiceQuestionViewState extends State<ChoiceQuestionView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var unitsViewModel = context.read<UnitsViewModel>();
    return Scaffold(
      // appBar: AppBar(),

      body: Stack(
        children: [
          Container(
              width: SizeHelper.getScreenWidth(context: context),
              height: SizeHelper.getScreenHeight(context: context),
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/ques2.png',
                    ),
                    fit: BoxFit.fill),
              ),
              child: Column(
                children: [
                  const ChoiceQuestionTopBar(),
                  SizeHelper.verticalSpace(5.h),
                  const QuestionName(quesName: ':اختر الحرف الذي تبدأ به الصوره'),
                  SizeHelper.verticalSpace(25.h),
                  ToRightLeft(
                    toRight: () {
                      unitsViewModel.increaseIndex(context);
                    },
                    toLeft: () {
                      unitsViewModel.decreaseIndex();
                    },
                  )
                ],
              )),
          Positioned(
            left: 13.w,
            right: 13.w,
            top: 20.h,
            bottom: 20.h,
            child: const SingleChildScrollView(
              child:  Column(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        ChoiceQuestionItem(
                          image: 'assets/images/camel.png',
                          letter1: 'A',
                          letter2: 'B',
                        ),
                        ChoiceQuestionItem(
                          image: 'assets/images/camel.png',
                          letter1: 'A',
                          letter2: 'B',
                        ),
                        ChoiceQuestionItem(
                          image: 'assets/images/camel.png',
                          letter1: 'A',
                          letter2: 'B',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // child: SizedBox(
            //   // color: Colors.red,
            //   height: SizeHelper.getScreenHeight(context: context) * 0.65,
            //   width: SizeHelper.getScreenWidth(context: context) * 0.85,
            //   child: Consumer2<LettersTypingViewModel,UnitsViewModel>(
            //       builder: (context, provider,unitsViewModel, child) => LetterTypingItem(
            //            // letter: unitsViewModel.lessonsDataResponse.categs[provider.index],
            //           )),
            // ),
          ),
          Positioned(
            left: 3.w,
            right: 3.w,
            height: 5.h,
            // top: 22.h,
            bottom: 3.h,
            child: BuildButton(
                title: 'تأكيد',
                titleColor: blueColor,
                buttonColor: whitColor,
                onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}

//! ChoiceQuestionItem
class ChoiceQuestionItem extends StatelessWidget {
  final String image;
  final String letter1;
  final String letter2;
  const ChoiceQuestionItem({
    super.key,
    required this.image,
    required this.letter1,
    required this.letter2,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
         // SizeHelper.verticalSpace(1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                image,
                width: 35.w,
                height: 15.h,
              ),
            ],
          ),
          SizeHelper.verticalSpace(2.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ChoiceQuestionLetter(
                letter: letter1,
              ),
              ChoiceQuestionLetter(
                letter: letter2,
              ),
            ],
          ),
          SizeHelper.verticalSpace(8.h),
        ],
      ),
    );
  }
}

// !QuestionName
class QuestionName extends StatelessWidget {
  final String? quesName;
  const QuestionName({super.key, required this.quesName});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [

        Text(
          quesName!,
          style: TextStyle(
              color: Colors.black,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold),
        ),
        SizeHelper.horizontalSpace(3.h),
      ],
    );
  }
}

// !ChoiceQuestionLetter
class ChoiceQuestionLetter extends StatelessWidget {
  final String? letter;
  final void Function()? onTap;
  const ChoiceQuestionLetter({
    super.key,
    this.letter,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // width: 10.w,
        // height: 5.h,
        decoration: BoxDecoration(
            color: Colors.white54,
            border: Border.all(
              color: Colors.black,
              width: 0.5,
            )),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 2.5.w),
            child: Text(
              letter ?? '',
              style: TextStyle(
                fontSize: 15.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

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
