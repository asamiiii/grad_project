import 'package:flutter/material.dart';
import 'package:grad_project/constants/constants.dart';
import 'package:grad_project/data_source/remote/repository_data_source.dart';
import 'package:grad_project/models/lessons_data_response.dart';
import 'package:grad_project/models/login_data_response.dart';
import 'package:grad_project/models/units_data_response.dart';
import 'package:grad_project/screens/ques_screen/model/ques_response.dart';
import 'package:provider/provider.dart';


class LoginViewModel extends ChangeNotifier{

 bool isLoading = true;

 LoginDataResponse? loginDataResponse;

 Future<LoginDataResponse?> login({required Map<String,dynamic> reqData})async{
  isLoading = true;
  notifyListeners();
  debugPrint("Login Req body : $reqData");
  loginDataResponse = await RemoteDataSource.login(body:reqData );
  
  isLoading = false;
  notifyListeners();
  return loginDataResponse;
 }



 
 }