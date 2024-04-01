import 'package:flutter/material.dart';
import 'package:grad_project/data_source/remote/repository_data_source.dart';
import 'package:grad_project/models/units_data_response.dart';

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
 }