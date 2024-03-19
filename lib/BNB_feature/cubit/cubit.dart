
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/BNB_feature/cubit/states.dart';
import 'package:grad_project/home_feature/subjects_screen.dart';

class BNBCubit extends Cubit <BNBStates>{
  BNBCubit ():super(InitialState());
  static BNBCubit getObject(context) =>BlocProvider.of(context);
  int current = 0 ;
  List<Widget> screens = [
    const SubjectsScreen(),
    const SubjectsScreen(),
    const SubjectsScreen(),
    const SubjectsScreen(),
  ];

  void changeCurrent (int index){
    current = index ;
    emit(ChangeBNBState());
  }

  List<BottomNavigationBarItem> bottomNavigationBarItems = [
    BottomNavigationBarItem(
      label: "Learn",
      icon: Image.asset(
        "assets/images/home.png",
      ),
    ),
    BottomNavigationBarItem(
      label: "Search",
      icon: Image.asset(
        "assets/images/search.png",
      ),
    ),
    BottomNavigationBarItem(
      label: "Achievement",
      icon: Image.asset(
        "assets/images/achieve.png",
      ),
    ),
    BottomNavigationBarItem(
      label: "Profile",
      icon: Image.asset(
        "assets/images/profile.png",
      ),
    ),
  ];

}