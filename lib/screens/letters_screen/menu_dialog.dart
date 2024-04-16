import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grad_project/screens/letters_screen/dummy_letters.dart';
import 'package:grad_project/screens/letters_screen/letters_view_model.dart';
import 'package:grad_project/utils/size_helper.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class MenuDialog extends StatelessWidget {
  // Offers? offer;
  MenuDialog({
    Key? key,
  }) : super(key: key);

  bool _isChanged = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25), // Set a circular border radius
      ),
      backgroundColor: const Color.fromRGBO(247, 246, 246, 1),
      contentPadding: const EdgeInsets.all(20), // Remove content padding
      content: SizedBox(
          height: 45.h,
          width: 60.w,
          child: Column(
            children: [
              Row(children: [
                Image.asset('assets/images/letter_to_left.png',height: 50,width: 40,),
                SizeHelper.horizontalSpace(50),
                Image.asset('assets/images/Home_icon.png',height: 85,width: 85,)
              ],),
              SizeHelper.verticalSpace(20),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 6,
                   crossAxisSpacing: 10,
                   mainAxisSpacing: 10
                   ),
                itemCount: dummyLetters.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      var provider = context.read<LettersViewModel>();
                      provider.setIndex(indexx: index);
                      
                    },
                    child: Container(
                      // width: 5,
                      // height: 5,
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        border: Border.all(color: Colors.black,)
                      ),
                      child: Center(child:Text(dummyLetters[index].letter??'')),
                    ),
                  );
                },
              ),
            ],
          )),
      // actions: [

      // ],
    );
  }
}
