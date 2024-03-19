// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:grad_project/helper/build_widgets.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';
import 'package:sizer/sizer.dart';

import 'arabic_intro_screen.dart';
import 'arabic_unit_screen.dart';

class ArabicScreen extends StatefulWidget {
  const ArabicScreen();

  static String id = 'ArabicScreen';

  @override
  State<ArabicScreen> createState() => _ArabicScreenState();
}

class _ArabicScreenState extends State<ArabicScreen> {
  int? progressBarValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 7.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BuildButton(
                  icon: Icons.arrow_back_ios,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                BuildButton(
                  icon: Icons.menu,
                  onTap: () {},
                ),
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Image.asset(
            "assets/images/Arabic2.png",
            width: 60.w,
            height: 25.h,
          ),
          Text(
            "تعلم اللغة العربية",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 25.sp,
                color: Color(0xff4A4373),
            ),
          ),
          SizedBox(
            height: 0.1.h,
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 4.w),
              itemCount: 3,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          // --------------------screens depends on index
                          return index == 0
                              ?  ArabicIntroScreen()
                              : index == 1
                                  ? const ArabicUnitScreen()
                                  :  ArabicIntroScreen();
                        },
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 1.h,
                      horizontal: 2.w,
                    ),
                    margin: EdgeInsets.only(bottom: 2.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      border: Border.all(
                        color: const Color(0xffCDCDCD),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5.sp),
                          decoration: BoxDecoration(
                              color: index == 0
                                  ? Color(0xff8BC34A)
                                  : index == 1
                                      ? Color(0xffFBB237)
                                      : Color(0xffFF4B4C),
                              borderRadius: BorderRadius.circular(8)),
                          child: Column(
                            children: [
                              Image.asset(
                                index == 0
                                    ? "assets/images/Handshake.png"
                                    : index == 1
                                        ? "assets/images/BookBookmark.png"
                                        : "assets/images/Fire.png",
                                width: 14.w,
                                height: 5.h,
                              ),
                              Text(
                                index == 0
                                    ? "المستوي 1"
                                    : index == 1
                                        ? "المستوي 2"
                                        : "المستوي 3",
                                style: TextStyle(
                                  fontSize: 9.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              index == 0
                                  ? "المقدمة"
                                  : index == 1
                                      ? "التدريب"
                                      : "التفاعلات",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.sp,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 0.01.h,
                            ),

                            // Text(
                            //   " 1 ساعه 30 دقيقه",
                            //   style: TextStyle(
                            //       fontSize: 9.sp,
                            //       color: Color(0xff50555C),
                            //   ),
                            // ),
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: LinearPercenIndicator(
                                    progressBarValue: 20,
                                    width: 48.w,
                                    lineHeight: 1.5.h,
                                    percent: 0.5,
                                    backgroundColor: Colors.grey[200],
                                    progressColor:  index == 0
                                        ? Color(0xff8BC34A)
                                        : index == 1
                                        ? Color(0xffFBB237)
                                        : Color(0xffFF4B4C),
                                  ),
                                ),
                                Text(
                                  "$progressBarValue/20",
                                  style:  TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10.sp,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            width: 60.w,
            height: 8.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xff4A4373),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text(
                  "التعلم الان",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                      color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Container(
                  width: 10.w,
                  height: 10.h,
                  decoration:
                      BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                  child: IconButton(
                    onPressed: () {},
                    icon:  Icon(
                      Icons.arrow_forward_ios,
                      size: 20.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
           SizedBox(
            height: 2.h,
          ),
        ],
      ),
    );
  }
}


class BuildButton extends StatelessWidget {
  BuildButton({
    Key? key,
    required this.onTap,
    required this.icon,
  }) : super(key: key);
  final VoidCallback onTap;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12.w,
      height: 5.5.h,
      decoration: BoxDecoration(
        color: const Color(0xff4A4373),
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        onPressed: () {
          onTap();
        },
        icon: Icon(
          icon,
          size: 22.sp,
          color: Colors.white,
        ),
      ),
    );
  }
}
