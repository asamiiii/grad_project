import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:grad_project/data_source/remote/general_functions.dart';
import 'package:grad_project/data_source/remote/remote_constants.dart';
import 'package:grad_project/models/levels_data_response.dart';
import 'package:grad_project/models/subject_data_response.dart';

class RemoteDataSource {
  //! get subject
  static Future<SubjectDataResponse> getSubject() async {
    try {
      var response = await fetchData(url: RemoteConstants.subjectUrl);
      debugPrint('subjects Response : $response');
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
      debugPrint('subjects Response : $response');
      LevelsDataResponse levels = LevelsDataResponse.fromJson(response);
      return levels;
    } catch (error) {
      return LevelsDataResponse(error: error.toString());
    }
  }
}
