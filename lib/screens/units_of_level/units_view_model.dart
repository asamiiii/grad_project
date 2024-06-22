import 'package:flutter/material.dart';
import 'package:grad_project/constants/constants.dart';
import 'package:grad_project/data_source/remote/repository_data_source.dart';
import 'package:grad_project/models/lessons_data_response.dart';
import 'package:grad_project/models/units_data_response.dart';
import 'package:grad_project/screens/ques_screen/model/ques_response.dart';
import 'package:provider/provider.dart';


class UnitsViewModel extends ChangeNotifier{

 bool isLoading = true;

 UnitsDataResponse? unitDataResponse;

 Future<UnitsDataResponse?> getUnitsObject({required String? levelId})async{
  isLoading = true;
  notifyListeners();
  unitDataResponse = await RemoteDataSource.getUnits(levelId: levelId);
  isLoading = false;
  notifyListeners();
  return unitDataResponse;
 }


 LessonsDataResponse? lessonsDataResponse;

 Future<LessonsDataResponse?> getLessonsObject({required String? unitId})async{
  lessonsDataResponse = null;
  index=0;
  isLoading = true;
  notifyListeners();
  lessonsDataResponse = await RemoteDataSource.getLessons(unitId: unitId);
  isLoading = false;
  notifyListeners();
  return lessonsDataResponse;
 }


  QuesResponse? quesResponse;

 Future<QuesResponse?> getQuesObject({required String? unitId})async{
  quesResponse = null;
  quesIndex=0;
  isLoading = true;
  notifyListeners();
  quesResponse = await RemoteDataSource.getQues(unitId: unitId);
  isLoading = false;
  notifyListeners();
  return quesResponse;
 }

   int index = 0;
   int quesIndex = 0;

  void setIndex({required int indexx}) {
    index = indexx;
    logger.d('Letter index : $index');
    notifyListeners();
  }

  void increaseIndex(BuildContext ctx) {
    // var length= ctx.read<UnitsViewModel>().lessonsDataResponse?.categs?.length;
    if ((lessonsDataResponse?.categs?.length)! - 1 != index) {
      index++;
      logger.d('Letter index : $index');
      notifyListeners();
    }
  }

  void decreaseIndex() {
    if (index > 0) {
      index--;
      logger.d('Letter index : $index');
      notifyListeners();
    }
  }

 
 }