import 'package:grad_project/home_feature/subject_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProviders{
  static List<SingleChildWidget> appProviders=[
    ChangeNotifierProvider(create: (_) => SubjectViewModel()),
  ];
}