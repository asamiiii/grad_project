import 'package:flutter/material.dart';
import 'package:grad_project/data_source/remote/repository_data_source.dart';
import 'package:grad_project/models/register_data_response.dart';

class RegisterViewModel extends ChangeNotifier {
  bool isLoading = true;

  RegisterDataResponse? registerDataResponse;

  Future<RegisterDataResponse?> register(
      {required Map<String, dynamic> reqData}) async {
    isLoading = true;
    notifyListeners();
    registerDataResponse = await RemoteDataSource.register(body: reqData);
    isLoading = false;
    notifyListeners();
    return registerDataResponse;
  }
}
