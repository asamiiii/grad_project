import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child: Image.asset(
            'assets/images/loading.gif',
            width: 25,
            height: 10,
            // fit: BoxFit.,
          )),
    );
  }
}
