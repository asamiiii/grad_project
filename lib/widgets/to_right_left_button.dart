import 'package:flutter/material.dart';

class ToRightLeft extends StatelessWidget {
   ToRightLeft({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         //! To Left Button
            Image.asset(
              'assets/images/letter_to_left.png',
              height: 40,
              width: 40,
              fit: BoxFit.fill,
            ),

            //! To Right Button
            Image.asset(
              'assets/images/letter_to_right.png',
              height: 40,
              width: 40,
              fit: BoxFit.fill,
            ),
      ],
    );
  }
}