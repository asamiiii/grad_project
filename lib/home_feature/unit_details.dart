// ignore_for_file: prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grad_project/screens/letters_screen/letters_view.dart';
import 'package:grad_project/widgets/build_app_bar.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';
import 'package:sizer/sizer.dart';

class ArabicUnitScreen extends StatelessWidget {
  const ArabicUnitScreen();

  static String id = 'ArabicUnitScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
         children: [
           Padding(
             padding:
             EdgeInsets.only(left: 4.w, right: 4.w, top: 7.h, bottom: 4.h),
             child: const BuildAppBar(),
           ),
           const SizedBox(height: 20,),
           Container(
             height: 71,
             color:const Color(0xffC4C4C4).withOpacity(.4),
             width: double.infinity,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 const Text(
                   "اللغة العربية",
                   textAlign: TextAlign.center,
                   style: TextStyle(
                       fontWeight: FontWeight.w500,
                       fontSize: 28,
                       color: Color(0xff4A4373)
                   ),
                 ),
                 const SizedBox(width: 10,),
                 Image.asset(
                   "assets/images/Vector.png",
                 ),
                 const SizedBox(width: 10,),
                 const Text(
                   "3",
                   style:TextStyle(
                       fontSize: 30,
                       color: Colors.amber
                   ),
                 ),
                 const SizedBox(width: 27,),
                 Image.asset(
                   "assets/images/geles.png",
                 ),
                 const SizedBox(width: 10,),
                 const Text(
                   "213",
                   style:TextStyle(
                       fontSize: 30,
                       color: Colors.blue
                   ),
                 ),

               ],
             ),
           ),
           const SizedBox(height: 90,),
           Stack(
             alignment: Alignment.topCenter,
             clipBehavior: Clip.none,
             children: [
               Container(
                 width: 200,
                 height: 120,
                 alignment: Alignment.bottomCenter,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20),
                   color:const Color(0xffC4C4C4).withOpacity(.4),
                   border: Border.all(color:const Color(0xffC4C4C4) ,width: 4)
                 ),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     const Text(
                       "الوحدة 1",
                       textAlign: TextAlign.center,
                       style: TextStyle(
                           fontWeight: FontWeight.w500,
                           fontSize: 28,
                           color: Color(0xff4A4373)
                       ),
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Image.asset(
                           "assets/images/Vector.png",
                         ),
                         const ProgressBar(
                           width: 100,
                           height: 15,
                           value: 2,
                           gradient: LinearGradient(
                             begin: Alignment.centerLeft,
                             end: Alignment.centerRight,
                             colors: [
                               Colors.amber,
                               Colors.amber,
                               Color(0xffC4C4C4),
                               Color(0xffC4C4C4),
                             ],
                           ),
                         ),
                         const Text(
                           "18/50",
                           textAlign: TextAlign.center,
                           style: TextStyle(
                               fontSize: 16,
                               color: Colors.grey
                           ),
                         ),

                       ],
                     )
                   ],
                 ),

               ),
               Positioned(
                 top: -65,
                 child: Image.asset(
                   "assets/images/Horse.png",
                 ),
               ),
             ],
           ),
           const SizedBox(height: 30,),
           
           Expanded(
             child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                       
               return Padding(
                 padding:  EdgeInsets.symmetric(horizontal: 20.w),
                 child: Row(
                  mainAxisAlignment: index.isOdd?MainAxisAlignment.start:MainAxisAlignment.end,
                   children: [
                     GestureDetector(
                                   onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LettersView(),));
                                   },
                     child: Column(
                       children: [
                         Stack(
                           alignment: Alignment.bottomRight,
                           clipBehavior: Clip.none,
                           children: [
                             Container(
                               width: 110,
                               height: 110,
                               decoration: BoxDecoration(
                                 shape: BoxShape.circle,
                                 border: Border.all(
                                   color: const Color(0xffC4C4C4),
                                   width: 10
                                 )
                               ),
                               child: Container(
                                 decoration: BoxDecoration(
                                     shape: BoxShape.circle,
                                     color: Colors.blue,
                                     border: Border.all(
                                         color: Colors.white,
                                         width: 1
                                     )
                                 ),
                                 child: Image.asset(
                                   "assets/images/Pencil.png"
                                 ),
                               )
                             ),
                             Container(
                               decoration: const BoxDecoration(
                                   image: DecorationImage(
                                       image: AssetImage("assets/images/Vector.png")
                                   )
                               ),
                               width: 27,
                               height: 27,
                               alignment: Alignment.center,
                               child:const Text(
                                 "6",
                                 textAlign: TextAlign.center,
                                 style: TextStyle(
                                     fontSize: 15,
                                     color: Colors.black
                                 ),
                               ) ,
                             )
                           ],
                         ),
                         const Text(
                           "الحروف",
                           textAlign: TextAlign.center,
                           style: TextStyle(
                               fontSize: 18,
                               fontWeight: FontWeight.w400,
                               color: Colors.black
                           ),
                         ),
                       ],
                     ),
                                  ),
                   ],
                 ),
               );
             },),
           )
         ],
      ),
    );
  }
}
