import 'package:fluttertoast/fluttertoast.dart';
import 'package:grad_project/constants/constants.dart';
import 'package:grad_project/data_source/remote/general_functions.dart';
import 'package:grad_project/data_source/remote/remote_constants.dart';
import 'package:grad_project/models/levels_data_response.dart';
import 'package:grad_project/models/login_data_response.dart';
import 'package:grad_project/models/register_data_response.dart';
import 'package:grad_project/models/subject_data_response.dart';
import 'package:grad_project/models/units_data_response.dart';
import 'package:grad_project/screens/ques_screen/model/ques_response.dart';

import '../../models/lessons_data_response.dart';

class RemoteDataSource {
  //! get subject
  static Future<SubjectDataResponse> getSubject() async {
    try {
      var response = await fetchData(url: RemoteConstants.subjectUrl);
      logger.w('subjects Response : $response');
      SubjectDataResponse subjects = SubjectDataResponse.fromJson(response);
      return subjects;
    } catch (error) {
      return SubjectDataResponse(error: error.toString());
    }
  }

    //! get Levels
  static Future<LevelsDataResponse> getLevels({required String? subjectId}) async {
    try {
      var response = await fetchData(url: RemoteConstants.levelsUrl,queryParameters: {'subjectId':subjectId});
      logger.w('Levels Response : $response');
      LevelsDataResponse levels = LevelsDataResponse.fromJson(response);
      return levels;
    } catch (error) {
      return LevelsDataResponse(error: error.toString());
    }
  }

      //! get Units
  static Future<UnitsDataResponse> getUnits({required String? levelId}) async {
    try {
      var response = await fetchData(url: RemoteConstants.unitsUrl,queryParameters: {'levelId':levelId});
      logger.w('Units Response : $response');
      UnitsDataResponse levels = UnitsDataResponse.fromJson(response);
      return levels;
    } catch (error) {
      logger.e(error.toString());
      return UnitsDataResponse(error: error.toString());
    }
  }

    //! get Lessons
  static Future<LessonsDataResponse> getLessons({required String? unitId}) async {
    try {
      var response = await fetchData(url: '${RemoteConstants.lessonsUrl}?unitId=$unitId',);
      logger.w('Units Response : $response');
      LessonsDataResponse lessons = LessonsDataResponse.fromJson(response);
      return lessons;
    } catch (error) {
      logger.e(error.toString());
      return LessonsDataResponse(error: error.toString());
    }
  }


      //! get ques
  static Future<QuesResponse> getQues({required String? unitId}) async {
    try {
      var response = await fetchData(url: '${RemoteConstants.quesUrl}?catId=$unitId',);
      logger.w('Units Response : $response');
      QuesResponse ques = QuesResponse.fromJson(response);
      return ques;
    } catch (error) {
      logger.e(error.toString());
      return QuesResponse(error: error.toString());
    }
  }

  static Future<RegisterDataResponse> register({required Map<String,dynamic> body}) async {
    try {
      var response = await sendData(url: RemoteConstants.registerUrl,data: body);
      logger.w('Register Response : $response');
      RegisterDataResponse register = RegisterDataResponse.fromJson(response);
      Fluttertoast.showToast(msg: "تم التسجيل بنجاح");
      return register;
    } catch (error) {
      logger.e(error.toString());
      Fluttertoast.showToast(msg: error.toString());
      return RegisterDataResponse(message: error.toString());
    }

    
  }

  static Future<LoginDataResponse> login({required Map<String,dynamic> body}) async {
    try {
      var response = await sendData(url: RemoteConstants.loginUrl,data:body);
      logger.w('Login Response : $response');
      LoginDataResponse login = LoginDataResponse.fromJson(response);
      Fluttertoast.showToast(msg: 'تم تسجيل الدخول بنجاح');
      return login;
    } catch (error) {
      logger.e(error.toString());
      Fluttertoast.showToast(msg: error.toString());
      return LoginDataResponse(message: error.toString());
    }

}

}