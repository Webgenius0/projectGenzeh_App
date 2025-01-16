import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:genzeh911/features/auth/model/onboard_model.dart';

import '../../../../networks/dio/dio.dart';
import '../../../../networks/endpoints.dart';
import '../../../../networks/exception_handler/data_source.dart';

final class OnboardApi {
  static final OnboardApi _singleton = OnboardApi._internal();
  OnboardApi._internal();
  static OnboardApi get instance => _singleton;

  Future<OnboardModel> onboard({
    required String old,
    required String findus,
    required String maingoal,
  }) async {
    try {
      Map data = {
        "old": old,
        "find_us": findus,
        "main_goal": maingoal,
      };

      Response response = await postHttp(Endpoints.onboard(), data);

      if (response.statusCode == 200) {
        final data = OnboardModel.fromRawJson(json.encode(response.data));
        return data;
      } else {
        // Handle non-200 status code errors
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      // Handle generic errors
      // throw ErrorHandler.handle(error).failure.responseMessage;
      rethrow;
    }
  }
}
