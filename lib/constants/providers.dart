import 'package:grad_project/screens/letters_screen/letters_view_model.dart';
import 'package:grad_project/screens/letters_typing_screen/letters_typing_view_model.dart';
import 'package:grad_project/screens/levels_of_subject/levels_view_model.dart';
import 'package:grad_project/screens/subjects_screen/subject_view_model.dart';
import 'package:grad_project/screens/units_of_level/units_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProviders{
  static List<SingleChildWidget> appProviders=[
    ChangeNotifierProvider(create: (_) => SubjectViewModel()),
    ChangeNotifierProvider(create: (_) => LevelsViewModel()),
    ChangeNotifierProvider(create: (_) => UnitsViewModel()),
    ChangeNotifierProvider(create: (_) => LettersViewModel()),
    ChangeNotifierProvider(create: (_) => LettersTypingViewModel()),
    //LettersTypingViewModel
  ];
}