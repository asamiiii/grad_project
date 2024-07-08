import 'package:flutter/material.dart';
import 'package:grad_project/auth/auth_services/auth_services.dart';
import 'package:grad_project/constants/constants.dart';
import 'package:grad_project/data_source/remote/repository_data_source.dart';
import 'package:grad_project/models/lessons_data_response.dart';
import 'package:grad_project/models/login_data_response.dart';
import 'package:grad_project/models/units_data_response.dart';
import 'package:grad_project/screens/ques_screen/model/ques_response.dart';
import 'package:grad_project/screens/subjects_screen/subjects_view.dart';
import 'package:provider/provider.dart';

class LoginViewModel extends ChangeNotifier {
  bool isLoading = false;

  LoginDataResponse? loginDataResponse;

  Future<LoginDataResponse?> login(
      {required Map<String, dynamic> reqData,
      required BuildContext ctx}) async {
    try {
      isLoading = true;
      notifyListeners();
      debugPrint("Login Req body : $reqData");
      loginDataResponse = await RemoteDataSource.login(body: reqData);
      AuthService.saveToken(loginDataResponse?.token ?? 'NA');
      isLoading = false;
      notifyListeners();
      debugPrint('Token : ${await AuthService.getToken()}');
      if(await AuthService.getToken()!='NA'){
             Navigator.pushAndRemoveUntil(
          ctx,
          MaterialPageRoute(
            builder: (context) => const SubjectsScreen(),
          ),
          (route) => false);
      }
      
    } catch (error) {
      isLoading = false;
      notifyListeners();
    }
    return loginDataResponse;
  }
}
