import 'package:flutter/material.dart';
import 'package:grad_project/utils/size_helper.dart';
import 'package:sizer/sizer.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: SizeHelper.getScreenWidth(context: context),
          height: SizeHelper.getScreenHeight(context: context),
          padding:EdgeInsets.all(50.sp) ,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/loading.gif',
                width: 30.w,
                height: 30.h,
              ),
              // Text('جاري التحميل')
            ],
          )),
    );
  }
}
