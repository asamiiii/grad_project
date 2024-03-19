import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class BNBScreen extends StatelessWidget {
  const BNBScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer <BNBCubit,BNBStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BNBCubit.getObject(context);
        return Scaffold(
          bottomNavigationBar:SizedBox(
            height: 83,
            child: BottomNavigationBar(
              backgroundColor: const Color(0xffF5F5F5),
                type: BottomNavigationBarType.fixed,
                selectedLabelStyle: const TextStyle(
                  color: Color(0xff4A4373),
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
                unselectedLabelStyle: const TextStyle(
                  color: Color(0xff4A4373) ,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
                onTap: (value) {
                  cubit.changeCurrent(value);
                },
                currentIndex: cubit.current,
                items:cubit.bottomNavigationBarItems
            ),
          ) ,
          body:cubit.screens[cubit.current] ,

        );
      },
    );
  }
}