import 'package:flutter/material.dart';
import 'package:grad_project/screens/letters_screen/letters_view_model.dart';
import 'package:provider/provider.dart';

class ToRightLeft extends StatelessWidget {
  Function toRight;
  Function toLeft;
    ToRightLeft({super.key,required this.toLeft,required this.toRight});

  @override
  Widget build(BuildContext context) {
    var lettersViewModel = context.read<LettersViewModel>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         //! To Left Button
            InkWell(
              onTap: () {
                // lettersViewModel.increaseIndex();
                toLeft() ;
              },
              child: Image.asset(
                'assets/images/letter_to_left.png',
                height: 40,
                width: 40,
                fit: BoxFit.fill,
              ),
            ),

            //! To Right Button
            InkWell(
              onTap: () {
                // lettersViewModel.decreaseIndex();
                toRight();
              },
              child: Image.asset(
                'assets/images/letter_to_right.png',
                height: 40,
                width: 40,
                fit: BoxFit.fill,
              ),
            ),
      ],
    );
  }
}