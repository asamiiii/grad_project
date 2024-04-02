import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:grad_project/screens/letters_screen/top_bar.dart';
import 'package:grad_project/utils/size_helper.dart';
import 'package:grad_project/widgets/close_button.dart';
import 'package:grad_project/widgets/to_right_left_button.dart';
import 'package:sizer/sizer.dart';

class LettersView extends StatefulWidget {
  const LettersView({super.key});

  @override
  State<LettersView> createState() => _LettersViewState();
}

class _LettersViewState extends State<LettersView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  const LettersTopBar(),
                  SizeHelper.verticalSpace(35.h),
                  ToRightLeft()
                ],
              )),
          Positioned(
            left: 7.w,
            right: 7.w,
            top: 20.h,
            bottom: 20.h,
            child: Container(
              // color: Colors.red,
              height: SizeHelper.getScreenHeight(context: context) * 0.65,
              width: SizeHelper.getScreenWidth(context: context) * 0.85,
              child: Column(
                children: [
                  SizeHelper.verticalSpace(5.h),
                  const LetterText(),
                  SizeHelper.verticalSpace(5.h),
                  Image.asset('assets/images/lion.png')
                  ],
              ),
            ),
          )
        ],
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
        Text('اسد',style: TextStyle(color: Colors.green, fontSize: 50.sp)),
        // SizeHelper.horizontalSpace(10.w),
        Text(
          'ا',
          style: TextStyle(color: Colors.green, fontSize: 50.sp),
        ),
      ],
    );
  }
}
