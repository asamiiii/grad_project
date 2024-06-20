import 'package:flutter/material.dart';
import 'package:grad_project/screens/letters_screen/dummy_letters.dart';
import 'package:grad_project/screens/letters_screen/letters_view_model.dart';
import 'package:grad_project/screens/letters_screen/top_bar.dart';
import 'package:grad_project/screens/letters_typing_screen/top_bar.dart';
import 'package:grad_project/screens/units_of_level/units_view_model.dart';
import 'package:grad_project/utils/size_helper.dart';
import 'package:grad_project/widgets/to_right_left_button.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class LettersTypingView extends StatefulWidget {
  const LettersTypingView({super.key});

  @override
  State<LettersTypingView> createState() => _LettersViewState();
}

class _LettersViewState extends State<LettersTypingView> {
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
                      unitsViewModel.increaseIndex(context);
                    },
                    toLeft: (){
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
            child: const SizedBox(),
            // child: SizedBox(
            //   // color: Colors.red,
            //   height: SizeHelper.getScreenHeight(context: context) * 0.65,
            //   width: SizeHelper.getScreenWidth(context: context) * 0.85,
            //   child: Consumer2<LettersViewModel,UnitsViewModel>(
            //       builder: (context, provider,unitsViewModel, child) => LetterTypingItem(
            //             letter: unitsViewModel.lessonsDataResponse.categs[provider.index],
            //           )),
            // ),
          )
        ],
      ),
    );
  }
}

class LetterTypingItem extends StatelessWidget {
  Letter? letter;
  LetterTypingItem({super.key, this.letter});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizeHelper.verticalSpace(5.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Text(letter?.word ?? '',
            //     style: TextStyle(color: Colors.green, fontSize: 50.sp)),
            // SizeHelper.horizontalSpace(10.w),
            Text(
              letter?.letter ?? '',
              style: TextStyle(color: Colors.green, fontSize: 50.sp),
            ),
          ],
        ),
        SizeHelper.verticalSpace(25.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(letter?.image ?? '',width: 30.w,height: 15.h,),
             Text(letter?.word ?? '',
                style: TextStyle(color: Colors.green, fontSize: 50.sp)),
          ],
        )
      ],
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
