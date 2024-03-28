// ignore_for_file: must_be_immutable, use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grad_project/helper/build_widgets.dart';
import 'package:grad_project/home_feature/subject_view_model.dart';
import 'package:grad_project/models/dummy_data/subject_dummy.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../models/subject_data_response.dart' as subject;
import 'subject_screen.dart';

class SubjectsScreen extends StatefulWidget {
  static String id = 'SubjectsScreen';

  const SubjectsScreen({Key? key}) : super(key: key);

  @override
  State<SubjectsScreen> createState() => _SubjectsScreenState();
}

class _SubjectsScreenState extends State<SubjectsScreen> {
  subject.SubjectDataResponse? subjectDataResponse;
  @override
  void initState() {
    var provider = context.read<SubjectViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      provider.getSubjectObject();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff4A4373),
      body: Consumer<SubjectViewModel>(
        builder: (context, provider, child) => provider.isLoading==false ? Column(
          children: [
            SizedBox(
              height: 4.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 2.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi, Melsayed!",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Text(
                      "What language would\n you like to learn?",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp,
                          color: Colors.white),
                    ),
                  ],
                ),
                const Spacer(),
                Image.asset(
                  "assets/images/hoem_body.png",
                )
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14),
                  ),
                  color: Color(0xffF5F5F5),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 20.w,
                      height: 0.5.h,
                      color: const Color(0xff2632386E).withOpacity(0.43),
                    ),
                    SizedBox(
                      height: 0.1.h,
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          Text(
                            "Language Being Learned",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.sp,
                                color: const Color(0xff43463F)),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 1.75.h),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xff737070),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "score",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.sp,
                                          color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                    Text(
                                      "0 Level",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.sp,
                                          color: const Color(0xffEFF8FF)),
                                    ),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                    Text(
                                      "7 active participants",
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Image.asset(
                                  "assets/images/play.png",
                                )
                              ],
                            ),
                          ),
                          
                          //* Subjects List View
                          ...subjectList
                              .map((e) => 
                                  BuildSubject(
                                    image: e.imageUrl ?? '',
                                    name: e.subjectName ?? '',
                                    progressBarValue: e.score ?? 0,
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, 'SubjectScreen');
                                    },
                                  ))
                              
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ):const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class BuildSubject extends StatelessWidget {
  BuildSubject({
    Key? key,
    required this.image,
    required this.name,
    required this.progressBarValue,
    required this.onTap,
  }) : super(key: key);

  String image;
  String name;
  int progressBarValue;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 4,),
        InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                border: Border.all(color: const Color(0xffCDCDCD))),
            child: Row(
              children: [
                Image.asset(
                  image,
                  width: 17.w,
                  height: 8.h,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: 3.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        LinearPercenIndicator(
                          progressBarValue: progressBarValue,
                          width: 52.w,
                          lineHeight: 1.5.h,
                          percent: 0.5,
                          backgroundColor: Colors.grey[200],
                          progressColor: Colors.blue[400],
                        ),
                        Text(
                          "$progressBarValue%",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10.sp,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        // SizedBox(height: 1,),
      ],
    );
  }
}
