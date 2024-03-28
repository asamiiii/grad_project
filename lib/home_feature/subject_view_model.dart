import 'package:flutter/cupertino.dart';
import 'package:grad_project/data_source/remote/repository_data_source.dart';
import 'package:grad_project/models/subject_data_response.dart';

class SubjectViewModel extends ChangeNotifier{
 bool isLoading = true;

 Future<SubjectDataResponse> getSubjectObject()async{
  isLoading = true;
  notifyListeners();
  SubjectDataResponse subject = await RemoteDataSource.getSubject();
  isLoading = false;
  notifyListeners();
  return subject;
 }
}